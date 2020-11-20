<template>
  <div class="component">
    <h1 class="subheading my-5">Liste des documents</h1>
    <p v-if="error" class="error--text">{{ error }}</p>
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
    <div v-if="pageList.length > 0" class="pageControlWrapper mt-7">
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

export default {
  middleware: 'gestionnaire',
  components: {
    documentCard
  },
  mixins: [paginationMixin('documentListFiltered', 7)],
  data() {
    return {
      documentList: [],
      error: null,
      filter: {
        type: '',
        status: ''
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
        if (this.filter.status) {
          const filter = this.filter.status === 'Traité'
          if (document.status !== filter) {
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
    init() {
      while (this.documentList.length > 0) {
        this.documentList.pop()
      }
      axios
        .get(`${process.env.API_URL}/API/document/all`, {
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
      this.fitler.status = ''
      this.filter.type = ''
    },
    launchDialog(doc) {
      console.log('delete')
      this.dialog = true
      this.dialogDocument = doc
    },
    deleteDocument(id) {
      axios
        .delete(`${process.env.API_URL}/API/document/${id}/delete`, {
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
