<template>
  <div class="component">
    <h1 class="subheading my-5">Liste des lots</h1>
    <v-card class="pb-3 mb-5">
      <v-card-title>Filtres</v-card-title>
      <v-row no-gutters align="center" justify="space-around">
        <v-text-field
          v-model.number="filter.numero"
          label="Numéro"
          class="shrink filterInput"
        >
        </v-text-field>
        <v-select
          :items="selectEtageList"
          v-model="filter.etage"
          label="Etage"
          class="shrink filterInput"
        >
        </v-select>
        <v-select
          :items="selectTypesList"
          v-model="filter.type"
          label="Type"
          class="shrink filterInput"
        >
        </v-select>
        <v-select
          :items="selectBatimentList"
          v-model="filter.batiment"
          label="Batiment"
          class="shrink filterInput"
        >
        </v-select>
        <v-btn @click="resetFilters" class="primary"
          >Réinitialiser les filtres</v-btn
        >
      </v-row>
    </v-card>
    <lot-card
      v-for="lot in pageList"
      :key="lot.numero"
      :lot="lot"
      @deleteLot="launchDialog"
      delete-button
    ></lot-card>
    <v-card v-if="pageList.length === 0" class="pa-3 mb-2">
      Aucun lot ne correspond à vos critères
    </v-card>
    <page-controls
      :list="lotsListFiltered"
      :maxPage="maxPage"
      :pageInput.sync="pageInput"
      @next="nextPage"
      @previous="previousPage"
      @update="pageInput = $event"
    />
    <v-dialog v-model="dialog" max-width="600px">
      <v-card class="px-10">
        <v-card-title class="px-0">
          <p class="text-wrap">
            Êtes vous sûr de vouloir supprimer le lot
            {{ dialogLot.numero }} ?
          </p>
        </v-card-title>
        <v-card-actions class="justify-center">
          <v-btn @click="deleteLot(dialogLot.numero)" class="primary"
            >Oui</v-btn
          >
          <v-btn @click="dialog = false" class="primary">Non</v-btn>
        </v-card-actions>
        <p v-if="error" class="error--text">{{ error }}</p>
      </v-card>
    </v-dialog>
  </div>
</template>

<script>
import axios from 'axios'
import { paginationMixin } from '../../assets/mixins'
import lotCard from '../../components/cards/lotCardList'
import pageControls from '../../components/pageControls'

export default {
  middleware: 'consult',
  components: {
    lotCard,
    pageControls
  },
  mixins: [paginationMixin('lotsListFiltered', 7)],
  data() {
    return {
      lotsList: [],
      filter: {
        numero: null,
        batiment: '',
        type: '',
        etage: ''
      },
      selectBatimentList: ['', 'A', 'B', 'C', 'D'],
      selectTypesList: [
        '',
        'Studio',
        '2 pièces',
        '3 pièces',
        'Grenier',
        'Cave',
        'Box',
        'Parking',
        'Chambre'
      ],
      selectEtageList: [
        '',
        'Rez de chaussée',
        'Premier étage',
        'Deuxième étage',
        'Troisième étage',
        'Quatrième étage',
        'Premier sous-sol',
        'Second sous-sol'
      ],
      dialog: false,
      dialogLot: { numero: 0 },
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
          } else if (lot.batiment !== this.filter.batiment) {
            return false
          }
        }
        if (this.filter.type) {
          if (lot.type !== this.filter.type) {
            return false
          }
        }
        if (this.filter.etage) {
          if (lot.etage !== this.filter.etage) {
            return false
          }
        }
        return true
      })
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
  beforeDestroy() {
    this.$store.commit('pages/setLot', this.currentPage)
  },
  methods: {
    init() {
      while (this.lotsList.length > 0) {
        this.lotsList.pop()
      }
      axios
        .get(`${process.env.API_URL}/API/lots/all`, {
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
          setTimeout(() => {
            this.currentPage = this.$store.state.pages.lot
          }, 1)
        })
        .catch((err) => (this.error = err))
    },
    resetFilters() {
      this.filter.numero = null
      this.filter.batiment = ''
      this.filter.type = ''
      this.filter.etage = ''
    },
    launchDialog(lot) {
      this.dialog = true
      this.dialogLot = lot
    },
    deleteLot(id) {
      axios
        .delete(`${process.env.API_URL}/API/lots/${id}`, {
          headers: { authorization: `Bearer: ${this.$store.state.token}` }
        })
        .then((response) => {
          this.dialog = false
          this.init()
        })
        .catch((err) => (this.error = err))
    }
  }
}
</script>

<style lang="scss" scoped>
.filterInput {
  max-width: 170px !important;
}
</style>
