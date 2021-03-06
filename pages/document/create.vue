<template>
  <v-card class="px-10 component mt-10">
    <v-card-title class="px-0">
      <h3>Ajouter un document</h3>
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
      <v-file-input
        ref="fileInput"
        @change="upload"
        prepend-icon="mdi-folder-multiple"
        accept="application/pdf"
      ></v-file-input>
      <entreprise-search @entreprisePicked="setEntreprise" />
      <v-card v-if="entreprise" class="indigo white--text mb-3">
        <v-card-title>Entreprise actuelle :</v-card-title>
        <v-card-text class="white--text">{{ entreprise.nom }}</v-card-text>
      </v-card>
      Prévenir par mail :
      <v-checkbox
        v-for="fav in favourites"
        :key="fav.nom"
        :label="fav.nom"
        @change="toggleFav(fav)"
      ></v-checkbox>
      <ul>
        <li v-for="(destinataire, i) in destinataires" :key="i">
          {{ destinataire }}
        </li>
      </ul>
      <v-row no-gutters align-center>
        <v-text-field
          v-model="destinataireInput"
          :rules="mailRule"
          label="Nouveau destinataire"
        />
        <v-btn @click="addDest" class="primary">Ajouter le destinataire</v-btn>
      </v-row>
      <p v-if="error" class="error--text">{{ error }}</p>
      <p v-if="success" class="success--text">{{ success }}</p>
      <v-btn @click="submit" class="primary my-6">Ajouter le document</v-btn>
    </v-form>
  </v-card>
</template>

<script>
import axios from 'axios'
import entrepriseSearch from '../../components/entrepriseSearch'

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
      destinataires: [],
      destinatairesFav: [],
      favourites: [],
      observation: '',
      destinataireInput: '',
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
      .get(`${process.env.API_URL || ''}/API/favourite/all`, {
        headers: { authorization: `Bearer: ${this.$store.state.token}` }
      })
      .then((response) => {
        if (response.status === 200) {
          response.data.forEach((row) => this.favourites.push(row))
        }
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
        const destinatairesString = this.destinataires
          .concat(this.destinatairesFav)
          .join(';')
        const fd = new FormData()
        fd.append('title', this.title)
        fd.append('entreprise', this.entreprise.Id)
        fd.append('type', this.type)
        fd.append('document', this.currentFile, this.currentFile.name)
        fd.append('mail', destinatairesString)
        if (this.observation) {
          fd.append('observation', this.observation)
        }
        axios
          .post(`${process.env.API_URL || ''}/API/document/create`, fd, {
            headers: { authorization: `Bearer: ${this.$store.state.token}` }
          })
          .then((response) => {
            if (response.status === 200) {
              this.success = response.data
              this.$refs.form.resetValidation()
              this.$refs.fileInput.value = null
              this.title = ''
              this.type = ''
              this.observation = ''
              this.entreprise = null
              this.currentFile = {}
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
