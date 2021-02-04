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
      <v-file-input
        ref="fileInput"
        @change="upload"
        prepend-icon="mdi-file-pdf"
        accept="application/pdf"
      ></v-file-input>
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
export default {
  middleware: 'docPost',
  data() {
    return {
      selectListType: ['Facture', 'Devis'],
      title: '',
      type: '',
      destinataires: [],
      destinatairesFav: [],
      favourites: [],
      destinataireInput: '',
      currentFile: null,
      error: null,
      success: null,
      requiredRule: [(v) => v.length >= 1 || 'Vous devez renseigner ce champ']
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
      if (this.$refs.form.validate()) {
        this.error = null
        this.success = null
        const destinatairesString = this.destinataires
          .concat(this.destinatairesFav)
          .join(';')
        const fd = new FormData()
        fd.append('title', this.title)
        fd.append('type', this.type)
        fd.append('document', this.currentFile, this.currentFile.name)
        fd.append('mail', destinatairesString)
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
