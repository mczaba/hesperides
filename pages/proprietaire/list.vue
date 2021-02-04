<template>
  <div class="component">
    <h1 class="subheading my-5">Liste des propriétaires</h1>
    <v-card class="pb-3 mb-5">
      <v-card-title>Filtres</v-card-title>
      <v-row no-gutters align="center" justify="space-around">
        <v-text-field
          v-model="filter.nom"
          label="Nom"
          class="shrink filterInput"
        />
        <v-text-field
          v-model="filter.prenom"
          label="Prénom"
          class="shrink filterInput"
        />
        <v-text-field
          v-model="filter.societe"
          label="Société"
          class="shrink filterInput"
        />
        <v-btn @click="resetFilters" class="primary"
          >Réinitialiser les filtres</v-btn
        >
      </v-row>
    </v-card>
    <h2 v-if="getError" class="error--text">{{ getError }}</h2>
    <template v-else>
      <prop-card
        v-for="proprio in pageList"
        :key="proprio.Id"
        :proprio="proprio"
        @deleteProp="launchDialog"
        delete-button
      ></prop-card>
      <v-card v-if="pageList.length === 0" class="pa-3 mb-2">
        Aucun propriétaire ne correspond à vos critères
      </v-card>
      <page-controls
        :list="proprioListFiltered"
        :maxPage="maxPage"
        :pageInput.sync="pageInput"
        @next="nextPage"
        @previous="previousPage"
        @update="pageInput = $event"
      />
    </template>
    <v-dialog v-model="dialog" max-width="600px">
      <v-card class="px-10">
        <v-card-title class="px-0">
          <p class="text-wrap">
            Êtes vous sûr de vouloir supprimer le compte
            {{ dialogProprietaire.nom }} {{ dialogProprietaire.prenom }}?
          </p>
        </v-card-title>
        <v-card-actions class="justify-center">
          <v-btn
            @click="deleteProprietaire(dialogProprietaire.Id)"
            class="primary"
            >Oui</v-btn
          >
          <v-btn @click="dialog = false" class="primary">Non</v-btn>
        </v-card-actions>
        <p v-if="deleteError" class="error--text">{{ deleteError }}</p>
      </v-card>
    </v-dialog>
  </div>
</template>

<script>
import axios from 'axios'
import { paginationMixin } from '../../assets/mixins'
import propCard from '../../components/cards/proprioCardList'
import pageControls from '../../components/pageControls'

export default {
  middleware: 'consult',
  components: {
    propCard,
    pageControls
  },
  mixins: [paginationMixin('proprioListFiltered', 7)],
  data() {
    return {
      filter: {
        nom: '',
        prenom: '',
        societe: ''
      },
      proprioList: [],
      dialog: false,
      dialogProprietaire: { nom: '', Id: 0 },
      getError: null,
      deleteError: null
    }
  },
  computed: {
    proprioListFiltered() {
      return this.proprioList.filter((proprio) => {
        if (this.filter.nom.length >= 3) {
          if (
            !proprio.nom.toLowerCase().includes(this.filter.nom.toLowerCase())
          ) {
            return false
          }
        }
        if (this.filter.prenom.length >= 3) {
          if (
            !proprio.prenom
              .toLowerCase()
              .includes(this.filter.prenom.toLowerCase())
          ) {
            return false
          }
        }
        if (this.filter.societe.length >= 3) {
          if (!proprio.societe) {
            return false
          } else if (
            !proprio.societe
              .toLowerCase()
              .includes(this.filter.societe.toLowerCase())
          ) {
            return false
          }
        }

        return true
      })
    }
  },
  watch: {
    proprioListFiltered: {
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
    this.$store.commit('pages/setProp', this.currentPage)
  },
  methods: {
    init() {
      while (this.proprioList.length > 0) {
        this.proprioList.pop()
      }
      axios
        .get(`${process.env.API_URL || ''}/API/proprietaire/all`, {
          headers: { authorization: `Bearer: ${this.$store.state.token}` }
        })
        .then((response) => {
          if (response.status === 200) {
            response.data.forEach((row) => this.proprioList.push(row))
            this.proprioList.sort((proprio1, proprio2) => {
              if (proprio1.nom > proprio2.nom) {
                return 1
              } else {
                return -1
              }
            })
            setTimeout(() => {
              this.currentPage = this.$store.state.pages.proprietaire
            }, 1)
          } else {
            this.getError = response.data
          }
        })
        .catch((err) => (this.getError = err))
    },
    resetFilters() {
      this.filter.nom = ''
      this.filter.prenom = ''
      this.filter.societe = ''
    },
    launchDialog(account) {
      this.dialog = true
      this.dialogProprietaire = account
    },
    deleteProprietaire(id) {
      axios
        .delete(`${process.env.API_URL || ''}/API/proprietaire/${id}`, {
          headers: { authorization: `Bearer: ${this.$store.state.token}` }
        })
        .then((response) => {
          this.dialog = false
          this.init()
        })
        .catch((err) => (this.deleteError = err))
    }
  }
}
</script>
