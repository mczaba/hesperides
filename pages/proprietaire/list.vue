<template>
  <v-container column justify-center class="mt-6" width="800px">
    <h1 class="subheading">Liste des propriétaires</h1>
    <v-text-field v-model="nameFilter"></v-text-field>
    <v-layout class="my-5" column>
      <v-card
        v-for="proprio in proprioListFiltered"
        :key="proprio.Id"
        class="px-10 py-3 mb-2"
        max-width="800px"
        flat
      >
        <v-layout row wrap align-center>
          <v-flex xs5>
            <div class="caption grey--text">Nom</div>
            <div>{{ proprio.nom }}</div>
          </v-flex>
          <v-flex xs5>
            <div class="caption grey--text">Prénom</div>
            <div>{{ proprio.prenom }}</div>
          </v-flex>
        </v-layout>
      </v-card>
    </v-layout>
  </v-container>
</template>

<script>
import axios from 'axios'

export default {
  middleware: 'consult',
  data() {
    return {
      nameFilter: '',
      proprioList: []
    }
  },
  computed: {
    proprioListFiltered() {
      return this.proprioList.filter((proprio) => {
        return (
          proprio.nom.includes(this.nameFilter) ||
          !(this.nameFilter.length >= 3)
        )
      })
    }
  },
  mounted() {
    while (this.proprioList.length > 0) {
      this.proprioList.pop()
    }
    axios
      .get('/API/proprietaire/all', {
        headers: { authorization: `Bearer: ${this.$store.state.token}` }
      })
      .then((response) => {
        response.data.forEach((row) => this.proprioList.push(row))
        this.proprioList.sort((proprio1, proprio2) => {
          if (proprio1.nom > proprio2.nom) {
            return 1
          } else {
            return -1
          }
        })
      })
      .catch((err) => (this.error = err))
  }
}
</script>
