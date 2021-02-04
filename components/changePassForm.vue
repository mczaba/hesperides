<template>
  <div>
    <v-list-item @click.stop="showPopup">
      <v-list-item-title>Changer son mot de passe</v-list-item-title>
    </v-list-item>
    <v-dialog v-model="dialog" max-width="600px">
      <v-card class="px-10">
        <v-card-title class="px-0">
          <h3>
            Changer de mot de passe
          </h3>
        </v-card-title>
        <v-form ref="form">
          <v-text-field
            :rules="requiredRule"
            v-model="password"
            :append-icon="show1 ? 'mdi-eye' : 'mdi-eye-off'"
            :type="show1 ? 'text' : 'password'"
            @click:append="show1 = !show1"
            label="mot de passe actuel"
          ></v-text-field>
          <v-text-field
            :rules="passRule"
            v-model="newPassword"
            :append-icon="show1 ? 'mdi-eye' : 'mdi-eye-off'"
            :type="show1 ? 'text' : 'password'"
            @click:append="show1 = !show1"
            label="nouveau mot de passe"
          ></v-text-field>
          <v-text-field
            :rules="passRule"
            v-model="passwordConf"
            :append-icon="show1 ? 'mdi-eye' : 'mdi-eye-off'"
            :type="show1 ? 'text' : 'password'"
            @click:append="show1 = !show1"
            label="confirmer le mot de passe"
          ></v-text-field>
          <p v-if="error" class="error--text">{{ error }}</p>
          <p v-if="success" class="success--text">{{ success }}</p>
          <v-btn @click="submit" class="primary my-6"
            >Changer de mot de passe</v-btn
          >
        </v-form>
      </v-card>
    </v-dialog>
  </div>
</template>

<script>
import axios from 'axios'
export default {
  data() {
    return {
      newPassword: '',
      passwordConf: '',
      password: '',
      show1: false,
      error: null,
      dialog: false,
      success: null,
      requiredRule: [(v) => v.length >= 1 || 'Veuillez renseigner ce champ'],
      passRule: [
        (v) =>
          v.length >= 6 || 'Le mot de passe doit contenir au moins 6 caractères'
      ]
    }
  },
  methods: {
    showPopup() {
      this.dialog = true
      this.$emit('clicked')
    },
    submit() {
      if (this.$refs.form.validate()) {
        this.error = null
        this.success = null
        const fd = new FormData()
        fd.append('password', this.password)
        fd.append('newPassword', this.newPassword)
        fd.append('passwordConf', this.passwordConf)
        axios
          .post(`${process.env.API_URL || ''}/API/auth/changepassword`, fd, {
            headers: { authorization: `Bearer: ${this.$store.state.token}` }
          })
          .then((response) => {
            if (response.status === 200) {
              this.success = response.data
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
