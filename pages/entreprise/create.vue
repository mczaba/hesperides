<template>
  <v-card class="px-10 component mt-10">
    <v-card-title class="px-0">
      <h3>Créer une entreprise</h3>
    </v-card-title>
    <v-form ref="form">
      <v-text-field :rules="requiredRule" v-model="nom" label="Nom (requis)" />
      <v-text-field
        :rules="requiredRule"
        v-model="type"
        label="Type (requis)"
      />
      <v-textarea v-model="adresse" label="Adresse"></v-textarea>
      <v-textarea
        :rules="requiredRule"
        v-model="telephone"
        label="Téléphone(s) (requis)"
      ></v-textarea>
      <p v-if="error" class="error--text">{{ error }}</p>
      <p v-if="success" class="success--text">{{ success }}</p>
      <v-btn @click="submit" class="primary my-6">Créer l'entreprise</v-btn>
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
      adresse: '',
      telephone: '',
      type: '',
      error: null,
      success: null,
      requiredRule: [(v) => v.length >= 1 || 'Vous devez renseigner ce champ'],
      mailRule: [
        (v) =>
          v.length < 1 ||
          /^[a-z0-9._-]+@[a-z0-9._-]{2,}\.[a-z]{2,4}$/.test(v) ||
          'Veuillez renseigner une adresse valide'
      ]
    }
  },
  methods: {
    setEntreprise(event) {
      this.entreprise = event.Id
    },
    submit() {
      if (this.$refs.form.validate()) {
        this.error = null
        this.success = null
        const fd = new FormData()
        fd.append('nom', this.nom)
        fd.append('type', this.type)
        if (this.adresse) {
          fd.append('adresse', this.adresse)
        }
        fd.append('telephone', this.telephone)
        axios
          .post(`${process.env.API_URL || ''}/API/entreprise/create`, fd, {
            headers: { authorization: `Bearer: ${this.$store.state.token}` }
          })
          .then((response) => {
            if (response.status === 200) {
              this.success = response.data
              this.$refs.form.resetValidation()
              this.nom = ''
              this.adresse = ''
              this.telephone = ''
              this.type = ''
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
