<template>
  <div>
    <v-list-item @click.stop="showPopup">
      <v-list-item-title>Changer son adresse mail</v-list-item-title>
    </v-list-item>
    <v-dialog v-model="dialog" max-width="600px">
      <v-card class="px-10">
        <v-card-title class="px-0">
          <h3>
            Changer d'adresse mail
          </h3>
        </v-card-title>
        <v-form ref="form">
          <v-text-field
            :rules="requiredRule"
            v-model="password"
            :append-icon="show1 ? 'mdi-eye' : 'mdi-eye-off'"
            :type="show1 ? 'text' : 'password'"
            @click:append="show1 = !show1"
            label="mot de passe"
          ></v-text-field>
          <v-text-field
            :rules="mailRule"
            v-model="mail"
            label="nouvelle adresse"
          />
          <v-text-field
            :rules="mailRule"
            v-model="mailConf"
            label="confirmer l'adresse mail"
          />
          <p v-if="error" class="error--text">{{ error }}</p>
          <p v-if="success" class="success--text">{{ success }}</p>
          <v-btn @click="submit" class="primary my-6">Changer d'adresse</v-btn>
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
      mail: '',
      mailConf: '',
      password: '',
      show1: false,
      error: null,
      dialog: false,
      success: null,
      requiredRule: [(v) => v.length >= 1 || 'Veuillez renseigner ce champ'],
      mailRule: [
        (v) => v.length >= 1 || 'Veuillez renseigner ce champ',
        (v) =>
          /^[a-z0-9._-]+@[a-z0-9._-]{2,}\.[a-z]{2,4}$/.test(v) ||
          'Veuillez renseigner une adresse valide'
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
        fd.append('newEmail', this.mail)
        fd.append('emailConf', this.mailConf)
        axios
          .post('/API/auth/changemail', fd, {
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
