<template>
  <div v-if="proprio" class="component">
    <v-layout id="lotList" row wrap justify-space-around>
      <div id="left-div">
        <h2>Details du propriétaire</h2>
        <v-card class="px-2 mb-16 py-3 mb-2" max-width="400px">
          <v-layout column wrap class="px-4">
            <v-flex xs6>
              <div class="caption grey--text">Nom :</div>
              <div>{{ proprio.nom }}</div>
            </v-flex>
            <v-flex xs6>
              <div class="caption grey--text">Prénom :</div>
              <div>{{ proprio.prenom }}</div>
            </v-flex>
            <v-flex v-if="proprio.societe" xs12>
              <div class="caption grey--text">Société :</div>
              <div>{{ proprio.societe }}</div>
            </v-flex>
            <v-flex xs12>
              <div v-if="proprio.adresse" class="caption grey--text">
                Adresse :
              </div>
              <div>{{ proprio.adresse }}</div>
            </v-flex>
            <v-flex xs12 md6>
              <div v-if="proprio.telephone" class="caption grey--text">
                Téléphone :
              </div>
              <div>{{ proprio.telephone }}</div>
            </v-flex>
            <v-flex xs12 md6>
              <div v-if="proprio.mobile" class="caption grey--text">
                Mobile :
              </div>
              <div>{{ proprio.mobile }}</div>
            </v-flex>
            <v-flex xs12>
              <div v-if="proprio.mail" class="caption grey--text">Email :</div>
              <div>{{ proprio.mail }}</div>
            </v-flex>
            <v-flex xs12>
              <div class="caption grey--text">Résident :</div>
              <div>{{ proprio.resident ? 'Oui' : 'Non' }}</div>
            </v-flex>
            <v-btn
              v-if="user.gestionnaire"
              @click="goToEdit(proprio.Id)"
              class="primary"
            >
              Editer le propriétaire
            </v-btn>
          </v-layout>
        </v-card>
      </div>

      <div id="lots-display">
        <h2>Lots appartenant à {{ proprio.nom }} {{ proprio.prenom }}</h2>
        <v-expansion-panels multiple accordion class="mt-4">
          <v-expansion-panel
            v-for="lot in lots"
            :key="lot.numero"
            class="px-2 py-2 mr-2"
            flat
            style="max-width: 400px"
          >
            <v-expansion-panel-header>
              <v-layout row wrap class="px-4">
                <v-flex xs4>
                  <div class="caption grey--text">Lot numéro :</div>
                  <div>{{ lot.numero }}</div>
                </v-flex>
                <v-flex xs4>
                  <div class="caption grey--text text-center">Type :</div>
                  <div class="text-center">{{ lot.type }}</div>
                </v-flex>
                <v-flex xs4>
                  <div class="caption grey--text text-right">Tantièmes :</div>
                  <div class="text-right">{{ lot.tantieme }}</div>
                </v-flex>
              </v-layout>
            </v-expansion-panel-header>
            <v-expansion-panel-content>
              <v-layout row wrap class="px-4">
                <v-flex xs6 md6>
                  <div class="caption grey--text">Batiment :</div>
                  <div>{{ lot.batiment ? lot.batiment : 'non renseigné' }}</div>
                </v-flex>
                <v-flex xs6 md6>
                  <div class="caption grey--text">Etage :</div>
                  <div>{{ lot.etage }}</div>
                </v-flex>
                <v-flex xs6 md6>
                  <div class="caption grey--text">Porte :</div>
                  <div>{{ lot.porte ? lot.porte : 'non renseigné' }}</div>
                </v-flex>
                <v-flex xs6 md6>
                  <div class="caption grey--text">Orientation :</div>
                  <div>
                    {{ lot.orientation ? lot.orientation : 'non renseigné' }}
                  </div>
                </v-flex>
                <v-flex v-if="lot.observation" xs12>
                  <div class="caption grey--text">Observation :</div>
                  <div>{{ lot.observation }}</div>
                </v-flex>
              </v-layout>
            </v-expansion-panel-content>
          </v-expansion-panel>
        </v-expansion-panels>
        <h3 class="mt-3">Total des tantièmes : {{ tantieme }}</h3>
      </div>
    </v-layout>
  </div>
</template>

<script>
import axios from 'axios'

export default {
  middleware: 'consult',
  data() {
    return {
      proprio: null,
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
    axios
      .get(`/API/proprietaire/details/${this.$route.params.id}`, {
        headers: { authorization: `Bearer: ${this.$store.state.token}` }
      })
      .then((response) => {
        this.proprio = response.data
        return axios.get(`/API/proprietaire/lots/${this.$route.params.id}`)
      })
      .then((response) => {
        response.data.forEach((lot) => this.lots.push(lot))
      })
      .catch((error) => (this.error = error))
  },
  methods: {
    goToEdit(id) {
      this.$router.push(`/proprietaire/edit/${id}`)
    }
  }
}
</script>

<style lang="scss" scoped>
#lotList {
  margin-top: 20px;
}
#lots-display {
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
