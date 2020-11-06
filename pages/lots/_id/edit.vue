<template>
  <v-card class="px-10 component mt-10">
    <v-card-title class="px-0">
      <h3>Modifier le lot numéro {{ numero }}</h3>
    </v-card-title>
    <v-form ref="form">
      <v-select
        :items="selectListEtage"
        :rules="requiredRule"
        v-model="etage"
        label="Etage (requis)"
      ></v-select>
      <v-select
        :items="selectListType"
        :rules="requiredRule"
        v-model="type"
        label="Type (requis)"
      ></v-select>
      <v-text-field
        :rules="requiredRule"
        v-model="tantieme"
        label="Tantiemes (requis)"
        type="number"
      />
      <v-select
        :items="selectListBatiment"
        v-model="batiment"
        label="Batiment"
      ></v-select>
      <v-text-field v-model="porte" label="Porte" type="number" />
      <v-select
        :items="selectListOrientation"
        v-model="orientation"
        label="Orientation"
      ></v-select>
      <v-textarea v-model="observation" label="Observations"></v-textarea>
      <prop-search @propPicked="propPicked" />
      <v-card v-if="proprietaire" class="primary white--text mb-3">
        <v-card-title>Propriétaire actuel :</v-card-title>
        <v-card-text class="white--text"
          >{{ proprietaire.nom }} {{ proprietaire.prenom }}</v-card-text
        >
      </v-card>
      <p v-if="error" class="error--text">{{ error }}</p>
      <p v-if="success" class="success--text">{{ success }}</p>
      <v-btn @click="submit" class="primary my-6">Modifier le lot</v-btn>
    </v-form>
  </v-card>
</template>

<script>
import axios from 'axios'
import propSearch from '../../../components/propSearch'

export default {
  middleware: 'gestonnaire',
  components: {
    propSearch
  },
  data() {
    return {
      numero: '',
      batiment: '',
      etage: '',
      porte: '',
      orientation: '',
      type: '',
      observation: '',
      tantieme: '',
      proprietaire: null,
      selectListBatiment: ['A', 'B', 'C', 'D'],
      selectListEtage: [
        'Rez de chaussée',
        'Premier étage',
        'Deuxième étage',
        'Troisième étage',
        'Quatrième étage',
        'Premier sous-sol',
        'Second sous-sol'
      ],
      selectListType: [
        'Studio',
        '2 pièces',
        '3 pièces',
        'Grenier',
        'Cave',
        'Box',
        'Parking',
        'Chambre'
      ],
      selectListOrientation: ['gauche', 'droite', 'face'],
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
  computed: {
    batimentFull() {
      return `Batiment ${this.batiment}`
    }
  },
  mounted() {
    axios
      .get(`${process.env.API_URL}/API/lots/details/${this.$route.params.id}`, {
        headers: { authorization: `Bearer: ${this.$store.state.token}` }
      })
      .then((response) => {
        this.numero = response.data.numero
        this.batiment = response.data.batiment || ''
        this.etage = response.data.etage
        this.porte = response.data.porte || ''
        this.orientation = response.data.orientation || ''
        this.type = response.data.type
        this.tantieme = response.data.tantieme.toString()
        this.observation = response.data.observation || ''
        return axios.get(
          `${process.env.API_URL}/API/proprietaire/details/${response.data.proprietaire}`,
          {
            headers: { authorization: `Bearer: ${this.$store.state.token}` }
          }
        )
      })
      .then((response) => {
        this.proprietaire = response.data
      })
      .catch((error) => {
        this.error = error
      })
  },
  methods: {
    propPicked(value) {
      this.proprietaire = value
      if (this.error === 'Vous devez choisir un propriétaire') {
        this.error = null
      }
    },
    submit() {
      this.error = null
      this.success = null
      if (!this.proprietaire) {
        this.error = 'Vous devez choisir un propriétaire'
      } else if (this.$refs.form.validate()) {
        const fd = new FormData()
        fd.append('etage', this.etage)
        fd.append('type', this.type)
        fd.append('tantieme', this.tantieme)
        fd.append('proprietaire', this.proprietaire.Id)
        if (this.batiment) {
          fd.append('batiment', this.batimentFull)
        }
        if (this.porte) {
          fd.append('porte', this.porte)
        }
        if (this.orientation) {
          fd.append('orientation', this.orientation)
        }
        if (this.observation) {
          fd.append('observation', this.observation)
        }
        axios
          .post(
            `${process.env.API_URL}/API/lots/edit/${this.$route.params.id}`,
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
