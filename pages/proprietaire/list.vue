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
    <prop-card
      v-for="proprio in pageList"
      :key="proprio.Id"
      :proprio="proprio"
      @deleteProp="launchDialog"
      delete-button
    ></prop-card>
    <div class="pageControlWrapper mt-7">
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
        <p v-if="error" class="error--text">{{ error }}</p>
      </v-card>
    </v-dialog>
  </div>
</template>

<script>
import axios from 'axios'
import { paginationMixin } from '../../assets/mixins'
import propCard from '../../components/cards/proprioCardList'

export default {
  middleware: 'consult',
  components: {
    propCard
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
      error: null
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
  methods: {
    init() {
      while (this.proprioList.length > 0) {
        this.proprioList.pop()
      }
      axios
        .get('/API/proprietaire/all', {
          headers: { authorization: `Bearer: ${this.$store.state.token}` }
        })
        .then((response) => {
          response.data.forEach((row) => this.proprioList.push(row))
          this.proprioList.sort((proprio1, proprio2) => {
            if (proprio1.nom > proprio2.nom) {
              return 1
            } else {
              return -1
            }
          })
        })
        .catch((err) => (this.error = err))
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
        .delete(`/API/proprietaire/${id}`, {
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
