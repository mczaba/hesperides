<template>
  <v-card class="px-10 component mt-10">
    <v-card-title class="px-0">
      <h3>
        Créer un compte
      </h3>
    </v-card-title>
    <v-form ref="form">
      <v-text-field :rules="loginRule" v-model="login" label="login" />
      <v-text-field :rules="mailRule" v-model="mail" label="Email" />
      <v-select
        :items="selectList"
        :rules="requiredRule"
        v-model="permissions"
        label="Permissions"
      ></v-select>
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
      permissions: '',
      selectList: ['Admin', 'Gestionnaire', 'Consultant'],
      error: null,
      success: null,
      requiredRule: [
        (v) =>
          v.length >= 1 || 'Vous devez renseigner les permissions du compte'
      ],
      loginRule: [
        (v) => v.length >= 5 || 'Le login doit comporter au moins 5 caractères'
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
        fd.append('permissions', this.permissions)
        axios
          .post('/API/auth/createaccount', fd, {
            headers: { authorization: `Bearer: ${this.$store.state.token}` }
          })
          .then((response) => {
            if (response.status === 200) {
              this.success = response.data
              this.$refs.form.resetValidation()
              this.permissions = ''
              this.mail = ''
              this.login = ''
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
