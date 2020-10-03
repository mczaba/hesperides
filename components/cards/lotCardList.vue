<template>
  <v-card class="pa-3 mb-2" flat>
    <v-row no-gutters>
      <v-col cols="10">
        <v-row no-gutters wrap align="center">
          <v-col class="my-1" cols="6" md="3">
            <div class="caption grey--text">Numéro</div>
            <div>{{ lot.numero }}</div>
          </v-col>
          <v-col class="my-1" cols="6" md="3">
            <div class="caption grey--text">Etage</div>
            <div>{{ lot.etage }}</div>
          </v-col>
          <v-col class="my-1" cols="6" md="3">
            <div class="caption grey--text">Type</div>
            <div>{{ lot.type }}</div>
          </v-col>
          <v-col v-if="lot.batiment" class="my-1" cols="6" md="3">
            <div class="caption grey--text">Batiment</div>
            <div>{{ lot.batiment }}</div>
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
              @click="deleteProp"
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
    lot: {
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
      this.$router.push(`/lots/${this.lot.numero}/details`)
    },
    goToEdit() {
      this.$router.push(`/lots/${this.lot.numero}/edit`)
    },
    deleteProp() {
      this.$emit('deleteLot', this.lot)
    }
  }
}
</script>
