<template>
  <div>
    <v-btn @click.stop="dialog = true" class="primary">Connexion</v-btn>
    <v-dialog v-model="dialog" max-width="600px">
      <v-card class="px-10 py-5">
        <v-card-title class="px-0">
          <h3>
            login
          </h3>
        </v-card-title>
        <v-form ref="form">
          <v-text-field
            :rules="requiredRule"
            v-model="login"
            @keydown="inputEnter"
            label="login"
          />
          <v-text-field
            :rules="requiredRule"
            v-model="password"
            :append-icon="show1 ? 'mdi-eye' : 'mdi-eye-off'"
            :type="show1 ? 'text' : 'password'"
            @keydown="inputEnter"
            @click:append="show1 = !show1"
            label="mot de passe"
          ></v-text-field>
          <p v-if="error" class="error--text">{{ error }}</p>
          <v-btn @click="submit" class="primary my-3">connexion</v-btn>
        </v-form>
        <NuxtLink to="/password-reset">
          Mot de passe oublié ?
        </NuxtLink>
      </v-card>
    </v-dialog>
  </div>
</template>

<script>
import axios from 'axios'
export default {
  data() {
    return {
      dialog: false,
      login: '',
      password: '',
      show1: false,
      error: null,
      requiredRule: [(v) => v.length >= 1 || 'Veuillez renseigner ce champ']
    }
  },
  methods: {
    inputEnter(event) {
      if (event.key === 'Enter') {
        this.submit()
      }
    },
    submit() {
      if (this.$refs.form.validate()) {
        this.error = null
        const fd = new FormData()
        fd.append('login', this.login)
        fd.append('password', this.password)
        axios
          .post(`${process.env.API_URL}/API/auth/login`, fd)
          .then((response) => {
            if (response.status === 200) {
              const payload = {
                token: response.data.token,
                user: response.data.user
              }
              this.$store.dispatch('logIn', payload)
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
