<template>
  <v-card class="px-10 component mt-10">
    <v-card-title class="px-0">
      <h3>Editer un locataire</h3>
    </v-card-title>
    <v-form ref="form">
      <v-text-field :rules="requiredRule" v-model="nom" label="Nom (requis)" />
      <v-text-field v-model="prenom" label="Prénom" />
      <v-text-field v-model="telephone" label="Téléphone" />
      <v-text-field v-model="mobile" label="Mobile" />
      <v-text-field :rules="mailRule" v-model="mail" label="Email" />
      <v-textarea v-model="observation" label="Observations"></v-textarea>
      <p v-if="error" class="error--text">{{ error }}</p>
      <p v-if="success" class="success--text">{{ success }}</p>
      <v-btn @click="submit" class="primary my-6">Modifier le locataire</v-btn>
    </v-form>
  </v-card>
</template>

<script>
import axios from 'axios'

export default {
  middleware: 'gestionnaire',
  data() {
    return {
      nom: '',
      prenom: '',
      telephone: '',
      mobile: '',
      mail: '',
      observation: '',
      error: null,
      success: null,
      requiredRule: [(v) => v.length >= 1 || 'Vous devez renseigner ce champ'],
      lotRule: [(v) => v > 0 || 'Vous devez renseigner ce champ'],
      mailRule: [
        (v) =>
          v.length < 1 ||
          /^[a-z0-9._-]+@[a-z0-9._-]{2,}\.[a-z]{2,4}$/.test(v) ||
          'Veuillez renseigner une adresse valide'
      ]
    }
  },
  mounted() {
    axios
      .get(
        `${process.env.API_URL || ''}/API/locataire/details/${
          this.$route.params.id
        }`,
        {
          headers: { authorization: `Bearer: ${this.$store.state.token}` }
        }
      )
      .then((response) => {
        this.nom = response.data.nom
        this.prenom = response.data.prenom || ''
        this.telephone = response.data.telephone || ''
        this.mobile = response.data.mobile || ''
        this.mail = response.data.mail || ''
        this.observation = response.data.observation || ''
      })
      .catch((error) => {
        this.error = error
      })
  },
  methods: {
    submit() {
      if (this.$refs.form.validate()) {
        this.error = null
        this.success = null
        const fd = new FormData()
        fd.append('nom', this.nom)
        fd.append('prenom', this.prenom)
        fd.append('telephone', this.telephone)
        fd.append('mobile', this.mobile)
        fd.append('mail', this.mail)
        fd.append('observation', this.observation)
        axios
          .post(
            `${process.env.API_URL || ''}/API/locataire/edit/${
              this.$route.params.id
            }`,
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
