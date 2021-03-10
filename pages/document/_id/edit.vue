<template>
  <v-card class="px-10 component mt-10">
    <v-card-title class="px-0">
      <h3>Editer un document</h3>
    </v-card-title>
    <v-form ref="form">
      <v-text-field
        :rules="requiredRule"
        v-model="title"
        label="Titre (requis)"
      />
      <v-select
        :items="selectListType"
        :rules="requiredRule"
        v-model="type"
        label="Type de document (requis)"
      ></v-select>
      <v-textarea v-model="observation" label="Observations"></v-textarea>
      <entreprise-search @entreprisePicked="setEntreprise" />
      <v-card v-if="entreprise" class="indigo white--text mb-3">
        <v-card-title>Entreprise actuelle :</v-card-title>
        <v-card-text class="white--text">{{ entreprise.nom }}</v-card-text>
      </v-card>
      <p v-if="error" class="error--text">{{ error }}</p>
      <p v-if="success" class="success--text">{{ success }}</p>
      <v-btn @click="submit" class="primary my-6">Editer le document</v-btn>
    </v-form>
  </v-card>
</template>

<script>
import axios from 'axios'
import entrepriseSearch from '../../../components/entrepriseSearch'

export default {
  middleware: 'docPost',
  components: {
    entrepriseSearch
  },
  data() {
    return {
      selectListType: ['Facture', 'Devis', 'Contrat', 'Autre'],
      title: '',
      type: '',
      observation: '',
      entreprise: null,
      currentFile: null,
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
  mounted() {
    axios
      .get(
        `${process.env.API_URL || ''}/API/document/${this.$route.params.id}`,
        {
          headers: { authorization: `Bearer: ${this.$store.state.token}` }
        }
      )
      .then((response) => {
        if (response.status === 200) {
          this.title = response.data.title
          this.type = response.data.type
          this.observation = response.data.observation || ''
          return axios.get(
            `${process.env.API_URL || ''}/API/entreprise/details/${
              response.data.entrepriseId
            }`,
            {
              headers: { authorization: `Bearer: ${this.$store.state.token}` }
            }
          )
        }
      })
      .then((response) => {
        this.entreprise = response.data
      })
      .catch((error) => {
        this.error = error
      })
  },
  methods: {
    setEntreprise(event) {
      this.entreprise = event
    },
    addDest() {
      this.destinataires.push(this.destinataireInput)
      this.destinataireInput = ''
    },
    toggleFav(fav) {
      if (this.destinatairesFav.includes(fav.email)) {
        const index = this.destinatairesFav.indexOf(fav.email)
        this.destinatairesFav.splice(index, 1)
      } else {
        this.destinatairesFav.push(fav.email)
      }
    },
    upload(event) {
      this.currentFile = event
    },
    submit() {
      if (!this.entreprise) {
        this.error = 'Vous devez sélectionner une entreprise'
      } else if (this.$refs.form.validate()) {
        this.error = null
        this.success = null
        const fd = new FormData()
        fd.append('title', this.title)
        fd.append('entreprise', this.entreprise.Id)
        fd.append('type', this.type)
        if (this.observation) {
          fd.append('observation', this.observation)
        }
        axios
          .post(
            `${process.env.API_URL || ''}/API/document/${
              this.$route.params.id
            }/edit`,
            fd,
            {
              headers: { authorization: `Bearer: ${this.$store.state.token}` }
            }
          )
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
