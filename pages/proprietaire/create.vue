<template>
  <v-card class="px-10 component mt-10">
    <v-card-title class="px-0">
      <h3>
        Créer un propriétaire
      </h3>
    </v-card-title>
    <v-form ref="form">
      <v-text-field :rules="requiredRule" v-model="nom" label="Nom" />
      <v-text-field v-model="prenom" label="Prénom" />
      <v-select
        :items="selectListCivilite"
        :rules="requiredRule"
        v-model="civilite"
        label="Civilité"
      ></v-select>
      <v-text-field v-model="adresse" label="Adresse" />
      <v-text-field v-model="telephone" label="Téléphone" />
      <v-text-field v-model="mobile" label="Mobile" />
      <v-text-field :rules="mailRule" v-model="mail" label="Email" />
      <v-select
        :items="selectListBatiment"
        :rules="requiredRule"
        v-model="batiment"
        label="Batiment"
      ></v-select>
      <v-checkbox v-model="resident" label="Résident"></v-checkbox>
      <v-textarea v-model="observations" label="Observations"></v-textarea>
      <v-text-field v-model="societe" label="Société" />
      <p v-if="error" class="error--text">{{ error }}</p>
      <p v-if="success" class="success--text">{{ success }}</p>
      <v-btn @click="submit" class="primary my-6">Créer le propriétaire</v-btn>
    </v-form>
  </v-card>
</template>

<script>
import axios from 'axios'

export default {
  middleware: 'admin',
  data() {
    return {
      nom: '',
      prenom: '',
      civilite: '',
      adresse: '',
      telephone: '',
      mobile: '',
      mail: '',
      batiment: '',
      resident: false,
      observations: '',
      societe: '',
      selectListBatiment: ['A', 'B', 'C', 'D'],
      selectListCivilite: ['Monsieur', 'Madame'],
      error: null,
      success: null,
      requiredRule: [(v) => v.length >= 1 || 'Vous devez renseigner ce champ'],
      loginRule: [
        (v) => v.length >= 5 || 'Le login doit comporter au moins 5 caractères'
      ],
      mailRule: [
        (v) =>
          v.length < 1 ||
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
        fd.append('nom', this.nom)
        if (this.prenom) {
          fd.append('prenom', this.prenom)
        }
        fd.append('civilite', this.civilite)
        fd.append('adresse', this.adresse)
        if (this.telephone) {
          fd.append('telephone', this.telephone)
        }
        if (this.mobile) {
          fd.append('mobile', this.mobile)
        }
        if (this.mail) {
          fd.append('mail', this.mail)
        }
        fd.append('batiment', this.batiment)
        fd.append('resident', this.resident)
        if (this.observations) {
          fd.append('observations', this.observations)
        }
        if (this.societe) {
          fd.append('societe', this.societe)
        }
        axios
          .post('/API/proprietaire/create', fd, {
            headers: { authorization: `Bearer: ${this.$store.state.token}` }
          })
          .then((response) => {
            if (response.status === 200) {
              this.success = response.data
              this.$refs.form.resetValidation()
              this.nom = ''
              this.prenom = ''
              this.civilite = ''
              this.adresse = ''
              this.telephone = ''
              this.mobile = ''
              this.mail = ''
              this.batiment = ''
              this.resident = false
              this.observations = ''
              this.societe = ''
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
