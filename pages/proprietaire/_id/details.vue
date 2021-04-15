<template>
  <div v-if="proprio" class="component">
    <v-row wrap justify="space-between">
      <v-col cols="12" lg="4">
        <h2>Details du propriétaire</h2>
        <v-card class="px-2 mb-16 py-3 mb-2">
          <div class="caption grey--text">Nom :</div>
          <div>{{ proprio.nom }}</div>
          <div v-if="proprio.prenom" class="caption grey--text">Prénom :</div>
          <div v-if="proprio.prenom">{{ proprio.prenom }}</div>
          <div class="caption grey--text">Civilité :</div>
          <div>{{ proprio.civilite }}</div>
          <div v-if="proprio.societe" class="caption grey--text">Société :</div>
          <div v-if="proprio.societe">{{ proprio.societe }}</div>
          <div v-if="proprio.adresse" class="caption grey--text">Adresse :</div>
          <div>{{ proprio.adresse }}</div>
          <div v-if="proprio.telephone" class="caption grey--text">
            Téléphone :
          </div>
          <div v-if="proprio.telephone">{{ proprio.telephone }}</div>
          <div v-if="proprio.mobile" class="caption grey--text">Mobile :</div>
          <div v-if="proprio.mobile">{{ proprio.mobile }}</div>
          <div v-if="proprio.mail" class="caption grey--text">Email :</div>
          <div v-if="proprio.mail">{{ proprio.mail }}</div>
          <div class="caption grey--text">Résident :</div>
          <div>{{ proprio.resident ? 'Oui' : 'Non' }}</div>
          <div class="caption grey--text">Batiment :</div>
          <div>{{ proprio.batiment }}</div>
          <template v-if="proprio.observations">
            <div class="caption grey--text">Observations :</div>
            <div id="observations">{{ proprio.observations }}</div>
          </template>
          <v-btn
            v-if="user.gestionnaire"
            @click="goToEdit"
            class="primary mt-3"
          >
            Editer le propriétaire
          </v-btn>
        </v-card>
      </v-col>
      <v-col cols="12" lg="4">
        <h2 v-if="locataires.length > 0">Locataires du propriétaire</h2>
        <locataire-card
          v-for="locataire in locataires"
          :locataire="locataire"
          :key="locataire.Id"
        ></locataire-card>
      </v-col>
      <v-col cols="12" lg="4" align="center">
        <h2>Lots de ce propriétaire</h2>
        <v-expansion-panels multiple accordion class="mt-4">
          <v-expansion-panel
            v-for="lot in lots"
            :key="lot.numero"
            class="px-2 py-2 mr-2"
            flat
          >
            <v-expansion-panel-header>
              <v-row wrap class="px-4">
                <v-col cols="4">
                  <div class="caption grey--text">Lot numéro :</div>
                  <div>{{ lot.numero }}</div>
                </v-col>
                <v-col cols="4">
                  <div class="caption grey--text text-center">Type :</div>
                  <div class="text-center">{{ lot.type }}</div>
                </v-col>
                <v-col cols="4">
                  <div class="caption grey--text text-right">Tantièmes :</div>
                  <div class="text-right">{{ lot.tantieme }}</div>
                </v-col>
              </v-row>
            </v-expansion-panel-header>
            <v-expansion-panel-content>
              <v-row wrap class="px-4">
                <v-col cols="6">
                  <div class="caption grey--text">Batiment :</div>
                  <div>{{ lot.batiment ? lot.batiment : 'non renseigné' }}</div>
                </v-col>
                <v-col cols="6">
                  <div class="caption grey--text">Etage :</div>
                  <div>{{ lot.etage }}</div>
                </v-col>
                <v-col cols="6">
                  <div class="caption grey--text">Porte :</div>
                  <div>{{ lot.porte ? lot.porte : 'non renseigné' }}</div>
                </v-col>
                <v-col cols="6">
                  <div class="caption grey--text">Orientation :</div>
                  <div>
                    {{ lot.orientation ? lot.orientation : 'non renseigné' }}
                  </div>
                </v-col>
                <v-col v-if="lot.observation" xs12>
                  <div class="caption grey--text">Observation :</div>
                  <div>{{ lot.observation }}</div>
                </v-col>
              </v-row>
            </v-expansion-panel-content>
          </v-expansion-panel>
        </v-expansion-panels>
        <h3 class="mt-3">Total des tantièmes : {{ tantieme }}</h3>
      </v-col>
    </v-row>
  </div>
</template>

<script>
import axios from 'axios'
import locataireCard from '../../../components/cards/locataireCardList'

export default {
  middleware: 'consult',
  components: {
    locataireCard
  },
  data() {
    return {
      proprio: null,
      locataires: [],
      lots: [],
      error: null
    }
  },
  computed: {
    tantieme() {
      let tantieme = 0
      this.lots.forEach((lot) => {
        tantieme += lot.tantieme
      })
      return tantieme
    },
    user() {
      return this.$store.state.user
    }
  },
  mounted() {
    const locList = []
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
        this.proprio = response.data
        if (this.proprio.observations) {
          this.proprio.observations.replace(/\\n/g, '<br/>')
        }
        return axios.get(
          `${process.env.API_URL || ''}/API/proprietaire/lots/${
            this.$route.params.id
          }`,
          {
            headers: { authorization: `Bearer: ${this.$store.state.token}` }
          }
        )
      })
      .then((response) => {
        response.data.forEach((lot) => {
          this.lots.push(lot)
          if (lot.locataire && !locList.includes(lot.locataire))
            locList.push(lot.locataire)
        })
        const promiseArray = locList.map((id) =>
          axios.get(
            `${process.env.API_URL || ''}/API/locataire/details/${id}`,
            {
              headers: { authorization: `Bearer: ${this.$store.state.token}` }
            }
          )
        )
        return axios.all(promiseArray)
      })
      .then((response) => {
        response.forEach((request) => {
          if (request.data.Id) this.locataires.push(request.data)
        })
      })
      .catch((error) => (this.error = error))
  },
  methods: {
    goToEdit() {
      this.$router.push(`/proprietaire/${this.proprio.Id}/edit`)
    }
  }
}
</script>

<style lang="scss" scoped>
#observations {
  white-space: pre-wrap;
}

#lotList {
  margin-top: 20px;
}
.v-col {
  max-width: 90%;
  margin: auto;
}
.text-right {
  text-align: right;
}
.text-center,
h2,
h3 {
  text-align: center;
}
h2 {
  margin-bottom: 15px;
}
.v-expansion-panels {
  max-width: 500px;
}
.v-expansion-panel-header {
  padding: 0 3px;
}
</style>
