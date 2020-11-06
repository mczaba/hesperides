<template>
  <v-layout column justify-center align-center>
    <v-flex xs12 sm8 md6>
      <v-card class="pa-4 mt-16">
        <v-card-title class="justify-center">
          <h3>Réinitialiser le mot de passe</h3>
        </v-card-title>
        <p>
          Entrez votre login ci dessous pour réinitialiser votre mot de passe
        </p>
        <v-form ref="form">
          <v-text-field
            v-model="login"
            :rules="loginRules"
            label="login"
          ></v-text-field>
          <p v-if="error" class="error--text">{{ error }}</p>
          <p v-if="success" class="success--text">{{ success }}</p>
          <v-btn @click="submit" class="primary"
            >Réinitialiser son mot de passe</v-btn
          >
        </v-form>
      </v-card>
    </v-flex>
  </v-layout>
</template>

<script>
import axios from 'axios'

export default {
  data() {
    return {
      login: '',
      error: null,
      success: null,
      loginRules: [(v) => v.length >= 1 || 'Veuillez renseigner ce champ']
    }
  },
  methods: {
    submit() {
      if (this.$refs.form.validate()) {
        const fd = new FormData()
        fd.append('login', this.login)
        axios
          .post(`${process.env.API_URL}/API/auth/resetpass`, fd)
          .then((response) => {
            if (response.status === 200) {
              this.success = response.data
            } else {
              this.error = response.data
            }
          })
          .catch((error) => (this.error = error))
      }
    }
  }
}
</script>
