<template>
  <div>
    <fav-create @createdfav="init" />
    <h1 class="my-4">Liste des destinataires favoris</h1>
    <v-card v-for="fav in favList" :key="fav.nom" class="mb-2 px-5">
      <v-row>
        <v-col class="my-1" cols="5">
          <div class="caption grey--text">Nom</div>
          <div>{{ fav.nom }}</div>
        </v-col>
        <v-col class="my-1" cols="5">
          <div class="caption grey--text">Email</div>
          <div>{{ fav.email }}</div>
        </v-col>
        <v-col class="my-1" cols="2">
          <v-btn @click="launchDialog(fav)" class="primary--text" icon>
            <v-icon>mdi-delete</v-icon>
          </v-btn>
        </v-col>
      </v-row>
    </v-card>
    <v-dialog v-model="dialog" max-width="600px">
      <v-card class="px-10 pb-2">
        <v-card-title class="px-0">
          <p>
            Êtes vous sûr de vouloir supprimer le destinataire
            {{ dialogFav.nom }} de vos favoris ?
          </p>
        </v-card-title>
        <p v-if="error" class="error--text">{{ error }}</p>
        <v-card-actions class="justify-center">
          <v-btn @click="deleteFav" class="primary">Oui</v-btn>
          <v-btn @click="dialog = false" class="primary">Non</v-btn>
        </v-card-actions>
      </v-card>
    </v-dialog>
  </div>
</template>

<script>
import axios from 'axios'
import favCreate from '../components/favouriteCreate'
export default {
  middleware: 'admin',
  components: {
    favCreate
  },
  data() {
    return {
      favList: [],
      dialog: false,
      dialogFav: { nom: '', Id: 0 },
      error: null
    }
  },
  mounted() {
    this.init()
  },
  methods: {
    init() {
      while (this.favList.length > 0) {
        this.favList.pop()
      }
      axios
        .get(`${process.env.API_URL}/API/favourite/all`, {
          headers: { authorization: `Bearer: ${this.$store.state.token}` }
        })
        .then((response) => {
          if (response.status === 200) {
            response.data.forEach((row) => this.favList.push(row))
          } else {
            this.error = response.data
          }
        })
        .catch((err) => (this.error = err))
    },
    launchDialog(fav) {
      this.dialog = true
      this.dialogFav = fav
    },
    deleteFav() {
      axios
        .delete(`${process.env.API_URL}/API/favourite/${this.dialogFav.Id}`, {
          headers: { authorization: `Bearer: ${this.$store.state.token}` }
        })
        .then((response) => {
          if (response.status === 200) {
            this.dialog = false
            this.init()
          } else {
            this.error = response.data
          }
        })
        .catch((err) => (this.error = err))
    }
  }
}
</script>
