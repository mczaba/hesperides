<template>
  <div>
    <v-card class="px-10 py-5">
      <v-card-title><h3>Ajouter un destinataire favori</h3></v-card-title>
      <v-form ref="form">
        <v-text-field :rules="requiredRule" v-model="nom" label="nom" />
        <v-text-field :rules="mailRule" v-model="email" label="email" />
        <v-btn @click="submit" class="primary my-3"
          >Créer le destinataire</v-btn
        >
      </v-form>
      <h4 v-if="error" class="error--text">{{ error }}</h4>
      <h4 v-if="success" class="success--text">{{ success }}</h4>
    </v-card>
  </div>
</template>

<script>
import axios from 'axios'

export default {
  middleware: 'admin',
  data() {
    return {
      nom: '',
      email: '',
      requiredRule: [
        (v) =>
          v.length >= 1 || 'Vous devez renseigner les permissions du compte'
      ],
      mailRule: [
        (v) => v.length >= 1 || 'Veuillez renseigner ce champ',
        (v) =>
          /^[a-z0-9._-]+@[a-z0-9._-]{2,}\.[a-z]{2,4}$/.test(v) ||
          'Veuillez renseigner une adresse valide'
      ],
      error: null,
      success: null
    }
  },
  methods: {
    submit() {
      if (this.$refs.form.validate()) {
        this.error = null
        this.success = null
        const fd = new FormData()
        fd.append('nom', this.nom)
        fd.append('email', this.email)
        axios
          .post(`${process.env.API_URL || ''}/API/favourite/create`, fd, {
            headers: { authorization: `Bearer: ${this.$store.state.token}` }
          })
          .then((response) => {
            if (response.status === 200) {
              this.success = response.data
              this.$refs.form.resetValidation()
              this.email = ''
              this.nom = ''
              this.$emit('createdfav')
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
