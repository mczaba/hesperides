<template>
  <div class="component">
    <div v-if="entreprise">
      <h2>Details de l'entreprise</h2>
      <v-card class="px-2 py-3 mb-2" flat>
        <div class="caption grey--text">Nom :</div>
        <div>{{ entreprise.nom }}</div>
        <div class="caption grey--text">Type :</div>
        <div>{{ entreprise.type }}</div>
        <div v-if="entreprise.adresse" class="caption grey--text">
          Adresse :
        </div>
        <div v-if="entreprise.adresse">{{ entreprise.adresse }}</div>

        <div class="caption grey--text">Téléphone(s) :</div>
        <div id="telephone">{{ entreprise.telephone }}</div>
        <v-btn v-if="user.gestionnaire" @click="goToEdit" class="primary mt-3">
          Editer l'entreprise
        </v-btn>
      </v-card>
    </div>
  </div>
</template>

<script>
import axios from 'axios'

export default {
  middleware: 'consult',
  data() {
    return {
      entreprise: null,
      error: null
    }
  },
  computed: {
    user() {
      return this.$store.state.user
    }
  },
  mounted() {
    axios
      .get(
        `${process.env.API_URL || ''}/API/entreprise/details/${
          this.$route.params.id
        }`,
        {
          headers: { authorization: `Bearer: ${this.$store.state.token}` }
        }
      )
      .then((response) => {
        this.entreprise = response.data
      })
      .catch((error) => (this.error = error))
  },
  methods: {
    goToEdit() {
      this.$router.push(`/entreprise/${this.entreprise.Id}/edit`)
    }
  }
}
</script>

<style lang="scss" scoped>
#telephone {
  white-space: pre-wrap;
}

.text-center,
h2,
h3 {
  text-align: center;
}
h2 {
  margin-bottom: 15px;
}
</style>
