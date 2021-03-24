<template>
  <div>
    <v-row align-center>
      <v-text-field
        v-model="input"
        @keydown="keydown"
        :label="
          `Rechercher un ${type} (3 lettres minimum) ${
            type === 'proprietaire' ? '(requis)' : ''
          }`
        "
      ></v-text-field>
      <v-btn @click="search" class="primary">Chercher</v-btn>
    </v-row>
    <v-col id="result-list" v-if="resultList.length > 0">
      <v-card
        v-for="prop in resultList"
        :key="prop.Id"
        @click="pick(prop)"
        class="pa-3 mb-2 propResult"
      >
        <span>{{ prop.nom }} {{ prop.prenom }}</span>
      </v-card>
    </v-col>
    <v-card v-if="resultPicked" class="indigo white--text mb-3">
      <v-card-title>{{ type }} actuel :</v-card-title>
      <v-card-text class="white--text"
        >{{ resultPicked.nom }} {{ resultPicked.prenom }}</v-card-text
      >
    </v-card>
  </div>
</template>

<script>
import axios from 'axios'

export default {
  props: {
    resultPicked: {
      type: Object,
      default: null
    },
    type: {
      type: String,
      default: ''
    }
  },
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
          `${process.env.API_URL || ''}/API/${this.type}/search/${this.input}`,
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
    pick(prop) {
      this.$emit('propPicked', prop)
      this.clearResults()
    }
  }
}
</script>

<style lang="scss" scoped>
.propResult {
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
