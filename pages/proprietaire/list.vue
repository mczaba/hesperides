<template>
  <div class="component">
    <h1 class="subheading my-5">Liste des propriétaires</h1>
    <v-text-field
      v-model="nameFilter"
      label="Filtrer par nom"
      outlined
    ></v-text-field>
    <v-layout class="my-5" column>
      <v-card
        v-for="proprio in proprioListFiltered"
        :key="proprio.Id"
        class="px-10 py-3 mb-2"
        flat
      >
        <v-layout row wrap align-center>
          <v-flex xs4>
            <div class="caption grey--text">Nom</div>
            <div>{{ proprio.nom }}</div>
          </v-flex>
          <v-flex xs4 md3>
            <div class="caption grey--text">Prénom</div>
            <div>{{ proprio.prenom }}</div>
          </v-flex>
          <v-flex xs3>
            <div v-if="proprio.societe" class="caption grey--text">Société</div>
            <div>{{ proprio.societe }}</div>
          </v-flex>
          <v-flex xs1 md2>
            <v-btn @click="goTo(proprio.Id)" icon>
              <v-icon>mdi-account-details</v-icon>
            </v-btn>
            <v-btn v-if="user.gestionnaire" @click="goToEdit(proprio.Id)" icon>
              <v-icon>mdi-account-edit</v-icon>
            </v-btn>
            <v-btn
              v-if="user.gestionnaire"
              @click.stop="launchDialog(proprio)"
              icon
            >
              <v-icon>mdi-delete</v-icon>
            </v-btn>
          </v-flex>
        </v-layout>
      </v-card>
    </v-layout>
    <v-dialog v-model="dialog" max-width="600px">
      <v-card class="px-10">
        <v-card-title class="px-0">
          <p class="text-wrap">
            Êtes vous sûr de vouloir supprimer le compte
            {{ dialogProprietaire.nom }} {{ dialogProprietaire.prenom }}?
          </p>
        </v-card-title>
        <v-card-actions class="justify-center">
          <v-btn
            @click="deleteProprietaire(dialogProprietaire.Id)"
            class="primary"
            >Oui</v-btn
          >
          <v-btn @click="dialog = false" class="primary">Non</v-btn>
        </v-card-actions>
        <p v-if="error" class="error--text">{{ error }}</p>
      </v-card>
    </v-dialog>
  </div>
</template>

<script>
import axios from 'axios'

export default {
  middleware: 'consult',
  data() {
    return {
      nameFilter: '',
      proprioList: [],
      dialog: false,
      dialogProprietaire: { nom: '', Id: 0 },
      error: null
    }
  },
  computed: {
    proprioListFiltered() {
      return this.proprioList.filter((proprio) => {
        return (
          proprio.nom.toLowerCase().includes(this.nameFilter.toLowerCase()) ||
          !(this.nameFilter.length >= 3)
        )
      })
    },
    user() {
      return this.$store.state.user
    }
  },
  mounted() {
    this.init()
  },
  methods: {
    init() {
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
    },
    goTo(id) {
      this.$router.push(`/proprietaire/${id}`)
    },
    goToEdit(id) {
      this.$router.push(`/proprietaire/edit/${id}`)
    },
    launchDialog(account) {
      this.dialog = true
      this.dialogProprietaire = account
    },
    deleteProprietaire(id) {
      axios
        .delete(`/API/proprietaire/${id}`, {
          headers: { authorization: `Bearer: ${this.$store.state.token}` }
        })
        .then((response) => {
          this.dialog = false
          this.init()
        })
        .catch((err) => (this.error = err))
    }
  }
}
</script>
