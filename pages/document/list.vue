<template>
  <div class="component">
    <h1 class="subheading my-5">Liste des documents</h1>
    <v-card class="pb-3 mb-5">
      <v-card-title>Filtres</v-card-title>
      <v-row no-gutters align="center" justify="space-around">
        <v-select
          :items="selectTypeList"
          v-model="filter.type"
          label="Type"
          class="shrink filterInput"
        >
        </v-select>
        <v-text-field
          v-model="filter.year"
          label="Année"
          class="shrink filterInput"
        />
        <v-text-field
          v-model="entrepriseInput"
          @change="getEnteprisesId"
          label="Nom"
          class="shrink filterInput"
        />
        <v-select
          :items="selectStatusList"
          v-model="filter.status"
          label="Statut"
          class="shrink filterInput"
        >
        </v-select>
        <v-btn @click="resetFilters" class="primary"
          >Réinitialiser les filtres</v-btn
        >
      </v-row>
    </v-card>
    <h3 v-if="error" class="error--text mb-2">{{ error }}</h3>
    <document-card
      @error="errorHandle"
      @reload="init"
      @deleteDoc="launchDialog"
      v-for="(document, i) in pageList"
      :key="i"
      :document="document"
    />
    <v-card v-if="pageList.length === 0" class="pa-3 mb-2">
      Aucun document ne correspond à vos critères
    </v-card>
    <page-controls
      :list="documentListFiltered"
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
            Êtes vous sûr de vouloir supprimer le document
            {{ dialogDocument.title }}?
          </p>
        </v-card-title>
        <v-card-actions class="justify-center">
          <v-btn @click="deleteDocument(dialogDocument.Id)" class="primary"
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

import documentCard from '../../components/cards/documentCard'
import pageControls from '../../components/pageControls'

export default {
  middleware: 'docConsult',
  components: {
    documentCard,
    pageControls
  },
  mixins: [paginationMixin('documentListFiltered', 7)],
  data() {
    return {
      documentList: [],
      error: null,
      entrepriseInput: '',
      entrepriseFilter: [],
      filter: {
        type: '',
        status: '',
        year: ''
      },
      selectTypeList: ['', 'Facture', 'Devis'],
      selectStatusList: ['', 'A Traiter', 'Traité'],
      dialogDocument: { title: '', Id: 0 },
      dialog: false
    }
  },
  computed: {
    documentListFiltered() {
      return this.documentList.filter((document) => {
        if (this.filter.type) {
          if (document.type !== this.filter.type) {
            return false
          }
        }
        if (this.entrepriseFilter.length > 0) {
          if (!this.entrepriseFilter.includes(document.entrepriseId)) {
            return false
          }
        }
        if (this.filter.status) {
          const filter = this.filter.status === 'Traité'
          if (document.status !== filter) {
            return false
          }
        }
        if (this.filter.year) {
          if (this.filter.year !== document.postedat.substring(0, 4)) {
            return false
          }
        }
        return true
      })
    }
  },
  watch: {
    documentListFiltered: {
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
    getEnteprisesId() {
      this.entrepriseFilter = []
      if (this.entrepriseInput) {
        this.entrepriseFilter.push(-1)
        axios
          .get(
            `${process.env.API_URL || ''}/API/entreprise/search/${
              this.entrepriseInput
            }`,
            {
              headers: { authorization: `Bearer: ${this.$store.state.token}` }
            }
          )
          .then((response) => {
            response.data.forEach((row) => this.entrepriseFilter.push(row.Id))
          })
      }
    },
    init() {
      while (this.documentList.length > 0) {
        this.documentList.pop()
      }
      axios
        .get(`${process.env.API_URL || ''}/API/document/all`, {
          headers: { authorization: `Bearer: ${this.$store.state.token}` }
        })
        .then((response) => {
          response.data.forEach((row) => this.documentList.push(row))
        })
        .catch((error) => (this.error = error))
    },
    errorHandle(event) {
      this.error = event
    },
    resetFilters() {
      this.filter.status = ''
      this.filter.type = ''
      this.entrepriseFilter.length = 0
      this.entrepriseInput = ''
    },
    launchDialog(doc) {
      this.dialog = true
      this.dialogDocument = doc
    },
    deleteDocument(id) {
      axios
        .delete(`${process.env.API_URL || ''}/API/document/${id}/delete`, {
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
