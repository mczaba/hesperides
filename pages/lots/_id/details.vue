<template>
  <v-col wrap space-around>
    <div id="lot-details" v-if="lot">
      <h2>Détails du lot</h2>
      <v-card class="px-2 mb-16 py-3 mb-2">
        <v-col wrap class="px-4">
          <v-flex xs6>
            <div class="caption grey--text">Numéro :</div>
            <div>{{ lot.numero }}</div>
          </v-flex>
          <v-flex xs6>
            <div class="caption grey--text">Tantième :</div>
            <div>{{ lot.tantieme }}</div>
          </v-flex>
          <v-flex v-if="lot.batiment" xs6>
            <div class="caption grey--text">Batiment :</div>
            <div>{{ lot.batiment }}</div>
          </v-flex>
          <v-flex xs6>
            <div class="caption grey--text">Etage :</div>
            <div>{{ lot.etage }}</div>
          </v-flex>
          <v-flex v-if="lot.porte" xs6>
            <div class="caption grey--text">Porte :</div>
            <div>{{ lot.porte }}</div>
          </v-flex>
          <v-flex v-if="lot.orientation" xs6>
            <div class="caption grey--text">Orientation :</div>
            <div>{{ lot.orientation }}</div>
          </v-flex>
          <v-flex xs12>
            <div class="caption grey--text">Type :</div>
            <div>{{ lot.type }}</div>
          </v-flex>
          <v-flex v-if="lot.observation" xs12>
            <div class="caption grey--text">Observation :</div>
            <div>{{ lot.observation }}</div>
          </v-flex>
        </v-col>
      </v-card>
    </div>
    <div id="prop-details" v-if="proprietaire">
      <h2>Propriétaire du lot</h2>
      <prop-card :proprio="proprietaire"></prop-card>
    </div>
  </v-col>
</template>

<script>
import axios from 'axios'
import propCard from '../../../components/cards/proprioCardList'

export default {
  middleware: 'consult',
  components: {
    propCard
  },
  data() {
    return {
      lot: null,
      proprietaire: null
    }
  },
  mounted() {
    axios
      .get(`/API/lots/details/${this.$route.params.id}`, {
        headers: { authorization: `Bearer: ${this.$store.state.token}` }
      })
      .then((response) => {
        this.lot = response.data
        return axios.get(
          `/API/proprietaire/details/${response.data.proprietaire}`,
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
  }
}
</script>
