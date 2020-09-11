<template>
  <v-layout column justify-center align-center>
    <v-flex xs12 sm8 md6>
      <v-card class="pa-4 mt-16">
        <v-card-title class="headline justify-center">
          Bienvenue sur le site de la base de données des Héspérides
        </v-card-title>
        <v-card-text v-if="user" class="text-center">
          <p class="text-body-1">
            Vous êtes connectés en tant que {{ user.login }}
          </p>
        </v-card-text>
        <div v-else>
          <v-card-text class="text-center">
            <p class="text-body-1">
              Pour pouvoir consulter la base de données, connectez vous.
            </p>
          </v-card-text>
          <v-card-actions>
            <v-spacer />
            <login-form />
            <v-spacer />
          </v-card-actions>
        </div>
      </v-card>
    </v-flex>
  </v-layout>
</template>

<script>
import loginForm from '../components/loginForm'
export default {
  components: {
    loginForm
  },
  data() {
    return {
      dialog: false
    }
  },
  computed: {
    user() {
      return this.$store.state.user
    }
  }
}
</script>
