<template>
  <v-card class="px-10 py-3 mb-2" flat>
    <v-row wrap justify="center">
      <v-flex class="mb-2" xs6 md3>
        <div class="caption grey--text">Nom</div>
        <div>{{ proprio.nom }}</div>
      </v-flex>
      <v-flex class="mb-2" xs6 md3>
        <div class="caption grey--text">Prénom</div>
        <div>{{ proprio.prenom }}</div>
      </v-flex>
      <v-flex class="mb-2" xs12 md4>
        <div v-if="proprio.societe" class="caption grey--text">Société</div>
        <div>{{ proprio.societe }}</div>
      </v-flex>
      <v-flex class="mb-2" xs6 md2>
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
    proprio: {
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
      this.$router.push(`/proprietaire/${this.proprio.Id}/details`)
    },
    goToEdit() {
      this.$router.push(`/proprietaire/${this.proprio.Id}/edit`)
    },
    deleteProp() {
      this.$emit('deleteProp', this.proprio)
    }
  }
}
</script>
