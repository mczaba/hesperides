<template>
  <v-card class="px-10 component mt-10">
    <v-card-title class="px-0">
      <h3>Créer un compte</h3>
    </v-card-title>
    <v-form ref="form">
      <v-text-field :rules="loginRule" v-model="login" label="login" />
      <v-text-field :rules="mailRule" v-model="mail" label="Email" />
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
      <v-btn @click="submit" class="primary my-6">Créer le compte</v-btn>
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
      mail: '',
      admin: false,
      gestionnaire: false,
      documentPost: false,
      documentModif: false,
      error: null,
      success: null,
      requiredRule: [
        (v) =>
          v.length >= 1 || 'Vous devez renseigner les permissions du compte'
      ],
      loginRule: [
        (v) => v.length >= 5 || 'Le login doit comporter au moins 5 caractères',
        (v) => !v.includes(' ') || "Le login ne peut comporter d'espaces"
      ],
      mailRule: [
        (v) => v.length >= 1 || 'Veuillez renseigner ce champ',
        (v) =>
          /^[a-z0-9._-]+@[a-z0-9._-]{2,}\.[a-z]{2,4}$/.test(v) ||
          'Veuillez renseigner une adresse valide'
      ]
    }
  },
  methods: {
    submit() {
      if (this.$refs.form.validate()) {
        this.error = null
        this.success = null
        const fd = new FormData()
        fd.append('login', this.login)
        fd.append('email', this.mail)
        fd.append('admin', this.admin)
        fd.append('gestionnaire', this.gestionnaire)
        fd.append('documentPost', this.documentPost)
        fd.append('documentModif', this.documentModif)
        axios
          .post(`${process.env.API_URL || ''}/API/auth/createaccount`, fd, {
            headers: { authorization: `Bearer: ${this.$store.state.token}` }
          })
          .then((response) => {
            if (response.status === 200) {
              this.success = response.data
              this.$refs.form.resetValidation()
              this.mail = ''
              this.login = ''
              this.admin = false
              this.gestionnaire = false
              this.documentModif = false
              this.documentPost = false
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
