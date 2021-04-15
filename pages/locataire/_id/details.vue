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
        <div v-if="locataire.mobile" class="caption grey--text">Mobile :</div>
        <div v-if="locataire.mobile">{{ locataire.mobile }}</div>
        <div v-if="locataire.mail" class="caption grey--text">Email :</div>
        <div v-if="locataire.mail">{{ locataire.mail }}</div>
        <template v-if="locataire.observation">
          <div class="caption grey--text">Observations :</div>
          <div id="observations">{{ locataire.observation }}</div>
        </template>
        <v-btn v-if="user.gestionnaire" @click="goToEdit" class="primary mt-3">
          Editer le locataire
        </v-btn>
      </v-card>
    </div>
    <div v-if="propList.length > 0">
      <h2>Propriétaire(s) :</h2>
      <prop-card
        v-for="prop in propList"
        :key="prop.Id"
        :proprio="prop"
      ></prop-card>
    </div>
    <div v-if="lots.length > 0">
      <h2>Lot(s) :</h2>
      <lot-card v-for="lot in lots" :key="lot.numero" :lot="lot"></lot-card>
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
      propList: [],
      lots: [],
      error: null
    }
  },
  computed: {
    user() {
      return this.$store.state.user
    }
  },
  mounted() {
    const propList = []
    axios
      .get(
        `${process.env.API_URL || ''}/API/locataire/details/${
          this.$route.params.id
        }`,
        {
          headers: { authorization: `Bearer: ${this.$store.state.token}` }
        }
      )
      .then((response) => {
        this.locataire = response.data
        return axios.get(
          `${process.env.API_URL || ''}/API/lots/locataire/${
            this.locataire.Id
          }`,
          {
            headers: { authorization: `Bearer: ${this.$store.state.token}` }
          }
        )
      })
      .then((response) => {
        response.data.forEach((row) => {
          this.lots.push(row)
          if (!propList.includes(row.proprietaire))
            propList.push(row.proprietaire)
        })
        this.lots.sort((a, b) => a - b)
        const promiseArray = propList.map((id) =>
          axios.get(
            `${process.env.API_URL || ''}/API/proprietaire/details/${id}`,
            {
              headers: { authorization: `Bearer: ${this.$store.state.token}` }
            }
          )
        )
        return axios.all(promiseArray)
      })
      .then((response) => {
        response.forEach((request) => this.propList.push(request.data))
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
#observations {
  white-space: pre-wrap;
}

.text-center,
h2,
h3 {
  text-align: center;
}
h2 {
  margin-bottom: 15px;
}
</style>
