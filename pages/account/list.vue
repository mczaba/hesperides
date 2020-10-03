<template>
  <v-container column justify-center class="mt-6 component" width="800px">
    <h1 class="subheading mb-5">Liste des comptes</h1>
    <account-card
      v-for="account in accountList"
      :key="account.Id"
      :account="account"
      @deleteAccount="launchDialog"
    ></account-card>
    <v-dialog v-model="dialog" max-width="600px">
      <v-card class="px-10">
        <v-card-title class="px-0">
          <p>
            Êtes vous sûr de vouloir supprimer le compte
            {{ dialogUser.login }} ?
          </p>
        </v-card-title>
        <v-card-actions class="justify-center">
          <v-btn @click="deleteUser(dialogUser.Id)" class="primary">Oui</v-btn>
          <v-btn @click="dialog = false" class="primary">Non</v-btn>
        </v-card-actions>
        <p v-if="error" class="error--text">{{ error }}</p>
      </v-card>
    </v-dialog>
  </v-container>
</template>

<script>
import axios from 'axios'
import accountCard from '../../components/cards/userCardList'

export default {
  middleware: 'admin',
  components: {
    accountCard
  },
  data() {
    return {
      accountList: [],
      dialog: false,
      dialogUser: { login: '', Id: 0 },
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
        .catch((err) => (this.error = err))
    },
    launchDialog(account) {
      this.dialog = true
      this.dialogUser = account
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
