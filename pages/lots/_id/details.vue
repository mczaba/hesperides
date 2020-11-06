<template>
  <div>
    <div id="lot-details" v-if="lot">
      <h2>Détails du lot</h2>
      <v-card class="px-2 mb-16 py-3 mb-2">
        <div class="caption grey--text">Numéro :</div>
        <div>{{ lot.numero }}</div>
        <div class="caption grey--text">Tantième :</div>
        <div>{{ lot.tantieme }}</div>
        <div v-if="lot.batiment" class="caption grey--text">Batiment :</div>
        <div v-if="lot.batiment">{{ lot.batiment }}</div>
        <div class="caption grey--text">Etage :</div>
        <div>{{ lot.etage }}</div>
        <div v-if="lot.porte" class="caption grey--text">Porte :</div>
        <div v-if="lot.porte">{{ lot.porte }}</div>
        <div v-if="lot.orientation" class="caption grey--text">
          Orientation :
        </div>
        <div v-if="lot.orientation">{{ lot.orientation }}</div>
        <div class="caption grey--text">Type :</div>
        <div>{{ lot.type }}</div>
        <div v-if="lot.observation" class="caption grey--text">
          Observation :
        </div>
        <div v-if="lot.observation">{{ lot.observation }}</div>
      </v-card>
    </div>
    <div id="prop-details" v-if="proprietaire">
      <h2>Propriétaire du lot</h2>
      <prop-card :proprio="proprietaire"></prop-card>
    </div>
    <div v-if="locataire">
      <h2>Locataire du lot</h2>
      <locataire-card :locataire="locataire"></locataire-card>
    </div>
  </div>
</template>

<script>
import axios from 'axios'
import propCard from '../../../components/cards/proprioCardList'
import locataireCard from '../../../components/cards/locataireCardList'

export default {
  middleware: 'consult',
  components: {
    propCard,
    locataireCard
  },
  data() {
    return {
      lot: null,
      proprietaire: null,
      locataire: null
    }
  },
  mounted() {
    axios
      .get(`${process.env.API_URL}/API/lots/details/${this.$route.params.id}`, {
        headers: { authorization: `Bearer: ${this.$store.state.token}` }
      })
      .then((response) => {
        this.lot = response.data
        return axios.get(
          `${process.env.API_URL}/API/proprietaire/details/${this.lot.proprietaire}`,
          {
            headers: { authorization: `Bearer: ${this.$store.state.token}` }
          }
        )
      })
      .then((response) => {
        this.proprietaire = response.data
        return axios.get(
          `${process.env.API_URL}/API/locataire/lot/${this.lot.numero}`,
          {
            headers: { authorization: `Bearer: ${this.$store.state.token}` }
          }
        )
      })
      .then((response) => {
        this.locataire = response.data
      })
      .catch((error) => {
        this.error = error
      })
  }
}
</script>
