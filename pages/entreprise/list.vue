<template>
  <div class="component">
    <h1 class="subheading my-5">Liste des entreprises</h1>
    <v-text-field
      v-model="nameFilter"
      label="Filtrer par nom"
      outlined
    ></v-text-field>
    <ent-card
      v-for="entreprise in pageList"
      :key="entreprise.Id"
      :entreprise="entreprise"
      @deleteEntreprise="launchDialog"
      delete-button
    />
    <v-card v-if="pageList.length === 0" class="pa-3 mb-2">
      Aucune entreprise ne correspond à vos critères
    </v-card>
    <page-controls
      :list="entrepriseListFiltered"
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
            Êtes vous sûr de vouloir supprimer l'entreprise
            {{ dialogEntreprise.nom }} ?
          </p>
        </v-card-title>
        <v-card-actions class="justify-center">
          <v-btn @click="deleteEntreprise(dialogEntreprise.Id)" class="primary"
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
import entCard from '../../components/cards/entrepriseCard'
import pageControls from '../../components/pageControls'

export default {
  middleware: 'consult',
  components: {
    entCard,
    pageControls
  },
  mixins: [paginationMixin('entrepriseListFiltered', 7)],
  data() {
    return {
      nameFilter: '',
      entrepriseList: [],
      dialog: false,
      dialogEntreprise: { nom: '', Id: 0 },
      error: null
    }
  },
  computed: {
    entrepriseListFiltered() {
      return this.entrepriseList.filter((entreprise) => {
        return (
          entreprise.nom
            .toLowerCase()
            .includes(this.nameFilter.toLowerCase()) ||
          !(this.nameFilter.length >= 3)
        )
      })
    }
  },
  mounted() {
    this.init()
  },
  beforeDestroy() {
    this.$store.commit('pages/setEnt', this.currentPage)
  },
  methods: {
    init() {
      this.entrepriseList.length = 0
      axios
        .get(`${process.env.API_URL || ''}/API/entreprise/all`, {
          headers: { authorization: `Bearer: ${this.$store.state.token}` }
        })
        .then((response) => {
          response.data.forEach((row) => this.entrepriseList.push(row))
          this.entrepriseList.sort((entreprise1, entreprise2) => {
            if (entreprise1.nom > entreprise2.nom) {
              return 1
            } else {
              return -1
            }
          })
          setTimeout(() => {
            this.currentPage = this.$store.state.pages.entreprise
          }, 1)
        })
        .catch((err) => (this.error = err))
    },
    launchDialog(entreprise) {
      this.dialog = true
      this.dialogEntreprise = entreprise
    },
    deleteEntreprise(id) {
      axios
        .delete(`${process.env.API_URL || ''}/API/entreprise/${id}`, {
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
