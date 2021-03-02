<template>
  <div>
    <v-row align-center>
      <v-text-field
        v-model="input"
        @keydown="keydown"
        label="Rechercher une entreprise (3 lettres minimum) (requis)"
      ></v-text-field>
      <v-btn @click="search" class="primary">Chercher</v-btn>
    </v-row>
    <v-col id="result-list" v-if="resultList.length > 0">
      <v-card
        v-for="entreprise in resultList"
        :key="entreprise.Id"
        @click="pick(entreprise)"
        class="pa-3 mb-2 entrepriseResult"
      >
        <span>{{ entreprise.nom }}</span>
      </v-card>
    </v-col>
  </div>
</template>

<script>
import axios from 'axios'

export default {
  data() {
    return {
      input: null,
      resultList: []
    }
  },
  methods: {
    keydown(event) {
      if (event.key === 'Enter') {
        this.search()
      }
    },
    clearResults() {
      while (this.resultList.length > 0) {
        this.resultList.pop()
      }
    },
    search() {
      this.clearResults()
      axios
        .get(
          `${process.env.API_URL || ''}/API/entreprise/search/${this.input}`,
          {
            headers: { authorization: `Bearer: ${this.$store.state.token}` }
          }
        )
        .then((response) => {
          response.data.forEach((row) => this.resultList.push(row))
          this.resultList.sort((a, b) => {
            if (a.nom > b.nom) {
              return 1
            } else {
              return -1
            }
          })
        })
        .catch((err) => (this.error = err))
    },
    pick(entreprise) {
      this.$emit('entreprisePicked', entreprise)
      this.clearResults()
    }
  }
}
</script>

<style lang="scss" scoped>
.entrepriseResult {
  cursor: pointer;
  background-color: lighten(#3f51b5, 20%);
  &:hover {
    color: white;
    background-color: #3f51b5;
  }
}
</style>

<style lang="scss" scoped>
.row {
  margin: 0 !important;
}

#result-list {
  padding-left: 0 !important;
}
</style>
