<template>
  <div class="component">
    <h1 class="subheading my-5">Liste des lots</h1>
    <v-card>
      <v-card-title>Filtres</v-card-title>
      <v-row justify-space-around>
        <v-text-field
          v-model.number="filter.numero"
          label="Numéro"
          class="shrink"
        >
        </v-text-field>
        <v-spacer></v-spacer>
        <v-select
          :items="selectBatimentList"
          v-model="filter.batiment"
          label="Batiment"
          class="shrink"
        >
        </v-select>
        <v-spacer></v-spacer>
        <v-select
          :items="selectTypesList"
          v-model="filter.type"
          label="Type"
          class="shrink"
        >
        </v-select>
      </v-row>
    </v-card>
    <v-col class="my-5 px-0">
      <v-card v-for="lot in pageList" :key="lot.numero" class="pa-3 mb-2" flat>
        <v-row align-center>
          <v-flex xs6 md3>
            <div class="caption grey--text">Numéro</div>
            <div>{{ lot.numero }}</div>
          </v-flex>
          <v-flex v-if="lot.batiment" xs6 md3>
            <div class="caption grey--text">Batiment</div>
            <div>{{ lot.batiment }}</div>
          </v-flex>
          <v-flex xs6 md3>
            <div class="caption grey--text">Etage</div>
            <div>{{ lot.etage }}</div>
          </v-flex>
          <v-flex xs5 md2>
            <div class="caption grey--text">Type</div>
            <div>{{ lot.type }}</div>
          </v-flex>
          <v-flex xs1>
            <v-btn v-if="user.gestionnaire" @click="goToEdit(lot.numero)" icon>
              <v-icon>mdi-pencil</v-icon>
            </v-btn>
          </v-flex>
        </v-row></v-card
      >
    </v-col>
    <div class="pageControlWrapper">
      <v-layout
        id="pageControl"
        class="shrink"
        justify-space-around
        align-center
      >
        <v-btn @click="previousPage" class="primary pageButton">
          <v-icon>mdi-chevron-left</v-icon>
        </v-btn>
        <div class="inputWrapper">
          <v-text-field
            v-model="pageInput"
            label="page"
            class="pageInput"
          ></v-text-field>
          <span> / {{ maxPage + 1 }}</span>
        </div>
        <v-btn @click="nextPage" class="primary pageButton">
          <v-icon>mdi-chevron-right</v-icon>
        </v-btn>
      </v-layout>
    </div>
  </div>
</template>

<script>
import axios from 'axios'
import { paginationMixin } from '../../assets/mixins'

export default {
  middleware: 'consult',
  mixins: [paginationMixin('lotsListFiltered', 7)],
  data() {
    return {
      lotsList: [],
      filter: {
        numero: null,
        batiment: '',
        type: ''
      },
      selectBatimentList: ['A', 'B', 'C', 'D'],
      selectTypesList: [
        'Studio',
        '2 pièces',
        '3 pièces',
        'Grenier',
        'Cave',
        'Box',
        'Parking',
        'Chambre'
      ],
      error: null
    }
  },
  computed: {
    lotsListFiltered() {
      return this.lotsList.filter((lot) => {
        if (this.filter.numero) {
          if (lot.numero !== this.filter.numero) {
            return false
          }
        }
        if (this.filter.batiment) {
          if (!lot.batiment) {
            return false
          } else if (
            !lot.batiment.split(' ')[1].includes(this.filter.batiment)
          ) {
            return false
          }
        }
        if (this.filter.type) {
          if (!lot.type.slice(3).includes(this.filter.type.toLowerCase())) {
            return false
          }
        }
        return true
      })
    },
    user() {
      return this.$store.state.user
    }
  },
  watch: {
    lotsListFiltered: {
      deep: true,
      handler() {
        this.currentPage = 0
      }
    }
  },
  mounted() {
    this.init()
  },
  methods: {
    init() {
      while (this.lotsList.length > 0) {
        this.lotsList.pop()
      }
      axios
        .get('/API/lots/all', {
          headers: { authorization: `Bearer: ${this.$store.state.token}` }
        })
        .then((response) => {
          response.data.forEach((row) => this.lotsList.push(row))
          this.lotsList.sort((lots1, lots2) => {
            if (lots1.numero > lots2.numero) {
              return 1
            } else {
              return -1
            }
          })
        })
        .catch((err) => (this.error = err))
    },
    goToEdit(id) {
      this.$router.push(`/lots/edit/${id}`)
    }
  }
}
</script>

<style lang="scss" scoped>
.v-card {
  .row {
    margin: 0;
    padding: 0 16px;
  }
}
.pageButton {
  min-width: 30px !important;
  width: 30px;
}
#pageControl {
  width: 200px;
  height: 35px;
}
.pageInput {
  width: 27px !important;
}
.inputWrapper {
  display: flex;
  align-items: center;
  height: 100%;
  span {
    transform: translateY(-4px);
  }
}
.pageControlWrapper {
  display: flex;
  justify-content: center;
}
.active {
  background-color: #1c446a !important;
}
</style>
