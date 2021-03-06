<template>
  <div class="component">
    <h1 class="subheading my-5">Liste des locataires</h1>
    <v-text-field
      v-model="nameFilter"
      label="Filtrer par nom"
      outlined
    ></v-text-field>
    <loc-card
      v-for="locataire in pageList"
      :key="locataire.Id"
      :locataire="locataire"
      @deleteLoc="launchDialog"
      delete-button
    ></loc-card>
    <v-card v-if="pageList.length === 0" class="pa-3 mb-2">
      Aucun locataire ne correspond à vos critères
    </v-card>
    <page-controls
      :list="locataireListFiltered"
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
            Êtes vous sûr de vouloir supprimer le locataire
            {{ dialogLocataire.nom }} {{ dialogLocataire.prenom }}?
          </p>
        </v-card-title>
        <v-card-actions class="justify-center">
          <v-btn @click="deleteLocataire(dialogLocataire.Id)" class="primary"
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
import locCard from '../../components/cards/locataireCardList'
import pageControls from '../../components/pageControls'

export default {
  middleware: 'consult',
  components: {
    locCard,
    pageControls
  },
  mixins: [paginationMixin('locataireListFiltered', 7)],
  data() {
    return {
      nameFilter: '',
      locataireList: [],
      dialog: false,
      dialogLocataire: { nom: '', Id: 0 },
      error: null
    }
  },
  computed: {
    locataireListFiltered() {
      return this.locataireList.filter((locataire) => {
        return (
          locataire.nom.toLowerCase().includes(this.nameFilter.toLowerCase()) ||
          !(this.nameFilter.length >= 3)
        )
      })
    }
  },
  watch: {
    locataireListFiltered: {
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
    this.$store.commit('pages/setLoc', this.currentPage)
  },
  methods: {
    init() {
      while (this.locataireList.length > 0) {
        this.locataireList.pop()
      }
      axios
        .get(`${process.env.API_URL || ''}/API/locataire/all`, {
          headers: { authorization: `Bearer: ${this.$store.state.token}` }
        })
        .then((response) => {
          response.data.forEach((row) => this.locataireList.push(row))
          this.locataireList.sort((locataire1, locataire2) => {
            if (locataire1.nom > locataire2.nom) {
              return 1
            } else {
              return -1
            }
          })
          setTimeout(() => {
            this.currentPage = this.$store.state.pages.locataire
          }, 1)
        })
        .catch((err) => (this.error = err))
    },
    launchDialog(account) {
      this.dialog = true
      this.dialogLocataire = account
    },
    deleteLocataire(id) {
      axios
        .delete(`${process.env.API_URL || ''}/API/locataire/${id}`, {
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
