<template>
  <div class="component">
    <div v-if="locataire">
      <h2>Details du Locataire</h2>
      <v-card class="px-2 py-3 mb-2" flat>
        <div class="caption grey--text">Nom :</div>
        <div>{{ locataire.nom }}</div>
        <div v-if="locataire.prenom" class="caption grey--text">Prénom :</div>
        <div v-if="locataire.prenom">{{ locataire.prenom }}</div>
        <div v-if="locataire.telephone" class="caption grey--text">
          Téléphone :
        </div>
        <div v-if="locataire.telephone">{{ locataire.telephone }}</div>
        <div v-if="locataire.mobile" class="caption grey--text">
          Mobile :
        </div>
        <div v-if="locataire.mobile">{{ locataire.mobile }}</div>
        <div v-if="locataire.mail" class="caption grey--text">Email :</div>
        <div v-if="locataire.mail">{{ locataire.mail }}</div>
        <v-btn v-if="user.gestionnaire" @click="goToEdit" class="primary">
          Editer le locataire
        </v-btn>
      </v-card>
    </div>
    <div v-if="lot">
      <h2>Lot :</h2>
      <lot-card :lot="lot"></lot-card>
    </div>
    <div v-if="proprietaire">
      <h2>Propriétaire :</h2>
      <prop-card :proprio="proprietaire"></prop-card>
    </div>
  </div>
</template>

<script>
import axios from 'axios'
import propCard from '../../../components/cards/proprioCardList'
import lotCard from '../../../components/cards/lotCardList'

export default {
  middleware: 'consult',
  components: {
    propCard,
    lotCard
  },
  data() {
    return {
      locataire: null,
      proprietaire: null,
      lot: null,
      error: null
    }
  },
  computed: {
    user() {
      return this.$store.state.user
    }
  },
  mounted() {
    axios
      .get(`/API/locataire/details/${this.$route.params.id}`, {
        headers: { authorization: `Bearer: ${this.$store.state.token}` }
      })
      .then((response) => {
        this.locataire = response.data
        return axios.get(
          `/API/proprietaire/details/${this.locataire.idproprio}`,
          {
            headers: { authorization: `Bearer: ${this.$store.state.token}` }
          }
        )
      })
      .then((response) => {
        this.proprietaire = response.data
        return axios.get(`/API/lots/details/${this.locataire.lot}`, {
          headers: { authorization: `Bearer: ${this.$store.state.token}` }
        })
      })
      .then((response) => {
        this.lot = response.data
      })
      .catch((error) => (this.error = error))
  },
  methods: {
    goToEdit() {
      this.$router.push(`/locataire/${this.locataire.Id}/edit`)
    }
  }
}
</script>

<style lang="scss" scoped>
.text-center,
h2,
h3 {
  text-align: center;
}
h2 {
  margin-bottom: 15px;
}
</style>
