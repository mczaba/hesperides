<template>
  <v-container column justify-center class="mt-6" width="800px">
    <h1 class="subheading">Liste des comptes</h1>
    <v-layout class="my-5" column>
      <v-card
        v-for="account in accountList"
        :key="account.Id"
        class="px-10 py-3 mb-2"
        max-width="800px"
        flat
      >
        <v-layout row wrap align-center>
          <v-flex xs5>
            <div class="caption grey--text">Login</div>
            <div>{{ account.login }}</div>
          </v-flex>
          <v-flex xs3>
            <div class="caption grey--text">admin</div>
            <v-icon>{{ account.admin ? 'mdi-check' : 'mdi-close' }}</v-icon>
          </v-flex>
          <v-flex xs3>
            <div class="caption grey--text">Gestionnaire</div>
            <v-icon>{{
              account.gestionnaire ? 'mdi-check' : 'mdi-close'
            }}</v-icon>
          </v-flex>
          <v-flex xs1>
            <v-btn @click.stop="dialog = true" icon>
              <v-icon>mdi-delete</v-icon>
            </v-btn>
            <v-dialog v-model="dialog" max-width="600px">
              <v-card class="px-10 py-4">
                <v-card-title class="px-0 justify-center">
                  <p class="subheading">
                    Êtes vous sûr de vouloir supprimer le compte
                    {{ account.login }} ?
                  </p>
                </v-card-title>
                <v-card-actions class="justify-center">
                  <v-btn @click="deleteUser(account.Id)" class="primary"
                    >Oui</v-btn
                  >
                  <v-btn @click="dialog = false" class="primary">Non</v-btn>
                </v-card-actions>
                <p v-if="error" class="error--text">{{ error }}</p>
              </v-card>
            </v-dialog>
          </v-flex>
        </v-layout>
      </v-card>
    </v-layout>
  </v-container>
</template>

<script>
import axios from 'axios'

export default {
  middleware: 'admin',
  data() {
    return {
      accountList: [],
      dialog: false,
      error: null
    }
  },
  mounted() {
    this.init()
  },
  methods: {
    init() {
      while (this.accountList.length > 0) {
        this.accountList.pop()
      }
      axios
        .get('/API/auth/all', {
          headers: { authorization: `Bearer: ${this.$store.state.token}` }
        })
        .then((response) => {
          response.data.forEach((row) => this.accountList.push(row))
        })
        .catch((err) => console.log(err))
    },
    deleteUser(id) {
      axios
        .delete(`/API/auth/${id}`, {
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
