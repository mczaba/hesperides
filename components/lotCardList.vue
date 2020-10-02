<template>
  <v-card class="px-10 py-3 mb-2" flat>
    <v-row wrap justify="center">
      <v-flex class="mb-2" xs6 md3>
        <div class="caption grey--text">Numéro</div>
        <div>{{ lot.numero }}</div>
      </v-flex>
      <v-flex class="mb-2" xs6 md3>
        <div class="caption grey--text">Etage</div>
        <div>{{ lot.etage }}</div>
      </v-flex>
      <v-flex class="mb-2" xs6 md2>
        <div class="caption grey--text">Type</div>
        <div>{{ lot.type }}</div>
      </v-flex>
      <v-flex v-if="lot.batiment" class="mb-2" xs6 md2>
        <div class="caption grey--text">Batiment</div>
        <div>{{ lot.batiment }}</div>
      </v-flex>
      <v-flex class="mb-2" xs8 md2>
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
      </v-flex>
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

<style lang="scss" scoped>
.v-card {
  .row {
    margin: 0 !important;
    padding: 0 16px !important;
  }
}
</style>
