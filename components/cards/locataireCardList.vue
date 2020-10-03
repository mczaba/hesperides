<template>
  <v-card class="pa-3 mb-2" flat>
    <v-row no-gutters>
      <v-col cols="10">
        <v-row no-gutters wrap align="center">
          <v-col class="my-1" cols="6">
            <div class="caption grey--text">Nom</div>
            <div>{{ locataire.nom }}</div>
          </v-col>
          <v-col class="my-1" cols="6">
            <div class="caption grey--text">Prénom</div>
            <div>{{ locataire.prenom }}</div>
          </v-col>
        </v-row>
      </v-col>
      <v-col cols="2">
        <v-container fill-height>
          <v-row no-gutters align="center">
            <v-btn @click="goToView" class="primary--text" icon>
              <v-icon>mdi-clipboard-text</v-icon>
            </v-btn>
            <v-btn
              v-if="user.gestionnaire"
              @click="goToEdit"
              class="primary--text"
              icon
            >
              <v-icon>mdi-pencil</v-icon>
            </v-btn>
            <v-btn
              v-if="user.gestionnaire && deleteButton"
              @click="deleteLoc"
              class="primary--text"
              icon
            >
              <v-icon>mdi-delete</v-icon>
            </v-btn>
          </v-row>
        </v-container>
      </v-col>
    </v-row>
  </v-card>
</template>

<script>
export default {
  props: {
    locataire: {
      type: Object,
      default: null
    },
    deleteButton: {
      type: Boolean,
      default: false
    }
  },
  computed: {
    user() {
      return this.$store.state.user
    }
  },
  methods: {
    goToView() {
      this.$router.push(`/locataire/${this.locataire.Id}/details`)
    },
    goToEdit() {
      this.$router.push(`/locataire/${this.locataire.Id}/edit`)
    },
    deleteLoc() {
      this.$emit('deleteLoc', this.locataire)
    }
  }
}
</script>
