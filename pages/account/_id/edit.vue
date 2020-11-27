<template>
  <v-card class="px-10 component mt-10">
    <v-card-title class="px-0">
      <h3>Changer les permissions du compte {{ login }}</h3>
    </v-card-title>
    <v-form ref="form">
      Permissions :
      <v-checkbox
        v-model="admin"
        label="Créer et modifier des comptes"
      ></v-checkbox>
      <v-checkbox
        v-model="gestionnaire"
        label="Modifier la base de données"
      ></v-checkbox>
      <v-checkbox
        v-model="documentPost"
        label="Poster des Documents"
      ></v-checkbox>
      <v-checkbox
        v-model="documentModif"
        label="Modifier le statut des documents"
      ></v-checkbox>
      <p v-if="error" class="error--text">{{ error }}</p>
      <p v-if="success" class="success--text">{{ success }}</p>
      <v-btn @click="submit" class="primary my-6"
        >Changer les permissions</v-btn
      >
    </v-form>
  </v-card>
</template>

<script>
import axios from 'axios'

export default {
  middleware: 'admin',
  data() {
    return {
      login: '',
      admin: false,
      gestionnaire: false,
      documentPost: false,
      documentModif: false,
      error: null,
      success: null,
      requiredRule: [
        (v) =>
          v.length >= 1 || 'Vous devez renseigner les permissions du compte'
      ]
    }
  },
  mounted() {
    axios
      .get(`${process.env.API_URL}/API/auth/details/${this.$route.params.id}`, {
        headers: { authorization: `Bearer: ${this.$store.state.token}` }
      })
      .then((response) => {
        this.login = response.data.login
        this.admin = response.data.admin
        this.gestionnaire = response.data.gestionnaire
        this.documentPost = response.data.documentPost
        this.documentModif = response.data.documentModif
      })
      .catch((error) => (this.error = error))
  },
  methods: {
    submit() {
      if (this.$refs.form.validate()) {
        this.error = null
        this.success = null
        const fd = new FormData()
        fd.append('admin', this.admin)
        fd.append('gestionnaire', this.gestionnaire)
        fd.append('documentPost', this.documentPost)
        fd.append('documentModif', this.documentModif)
        axios
          .post(
            `${process.env.API_URL}/API/auth/changepermissions/${this.$route.params.id}`,
            fd,
            {
              headers: { authorization: `Bearer: ${this.$store.state.token}` }
            }
          )
          .then((response) => {
            if (response.status === 200) {
              this.success = response.data
              this.$refs.form.resetValidation()
            } else {
              this.error = response.data
            }
          })
          .catch((err) => (this.error = err))
      }
    }
  }
}
</script>
