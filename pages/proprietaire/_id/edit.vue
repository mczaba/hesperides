<template>
  <v-card class="px-10 component mt-10">
    <v-card-title class="px-0">
      <h3>Modifier le propriétaire</h3>
    </v-card-title>
    <v-form ref="form">
      <v-text-field :rules="requiredRule" v-model="nom" label="Nom (requis)" />
      <v-text-field v-model="prenom" label="Prénom" />
      <v-select
        :items="selectListCivilite"
        :rules="requiredRule"
        v-model="civilite"
        label="Civilité (requis)"
      ></v-select>
      <v-text-field
        v-model="adresse"
        :rules="requiredRule"
        label="Adresse (requis)"
      />
      <v-text-field v-model="telephone" label="Téléphone" />
      <v-text-field v-model="mobile" label="Mobile" />
      <v-text-field :rules="mailRule" v-model="mail" label="Email" />
      <v-select
        :items="selectListBatiment"
        :rules="requiredRule"
        v-model="batiment"
        label="Batiment (requis)"
      ></v-select>
      <v-checkbox v-model="resident" label="Résident"></v-checkbox>
      <v-textarea v-model="observations" label="Observations"></v-textarea>
      <v-text-field v-model="societe" label="Société" />
      <p v-if="error" class="error--text">{{ error }}</p>
      <p v-if="success" class="success--text">{{ success }}</p>
      <v-btn @click="submit" class="primary my-6"
        >Modifier le propriétaire</v-btn
      >
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
  mounted() {
    axios
      .get(
        `${process.env.API_URL || ''}/API/proprietaire/details/${
          this.$route.params.id
        }`,
        {
          headers: { authorization: `Bearer: ${this.$store.state.token}` }
        }
      )
      .then((response) => {
        this.nom = response.data.nom
        this.prenom = response.data.prenom || ''
        this.civilite = response.data.civilite
        this.adresse = response.data.adresse
        this.telephone = response.data.telephone || ''
        this.mobile = response.data.mobile || ''
        this.mail = response.data.mail || ''
        this.batiment = response.data.batiment
        this.resident = response.data.resident
        this.observations = response.data.observations || ''
        this.societe = response.data.societe || ''
      })
      .catch((error) => (this.error = error))
  },
  methods: {
    submit() {
      if (this.$refs.form.validate()) {
        this.error = null
        this.success = null
        const fd = new FormData()
        fd.append('nom', this.nom)
        fd.append('prenom', this.prenom)
        fd.append('civilite', this.civilite)
        fd.append('adresse', this.adresse)
        fd.append('telephone', this.telephone)
        fd.append('mobile', this.mobile)
        fd.append('mail', this.mail)
        fd.append('batiment', this.batiment)
        fd.append('resident', this.resident)
        fd.append('observations', this.observations)
        fd.append('societe', this.societe)
        axios
          .post(
            `${process.env.API_URL || ''}/API/proprietaire/edit/${
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
