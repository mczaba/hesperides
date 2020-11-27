<template>
  <v-card class="pa-3 mb-2" flat>
    <v-row no-gutters wrap align="center">
      <v-col cols="10">
        <v-row no-gutters>
          <v-col class="my-1" cols="12" md="6">
            <v-row no-gutters>
              <v-col cols="12">
                <div class="caption grey--text">Login</div>
                <div>{{ account.login }}</div>
              </v-col>
              <v-col class="my-1" cols="12">
                <div class="caption grey--text">Dernière connexion</div>
                <div>{{ lastSeenFormatted }}</div>
              </v-col>
            </v-row>
          </v-col>
          <v-col class="my-1" cols="12" md="6">
            <v-row no-gutters>
              <v-col class="my-1" cols="6">
                <div class="caption grey--text">Admin</div>
                <v-icon>{{ account.admin ? 'mdi-check' : 'mdi-close' }}</v-icon>
              </v-col>
              <v-col class="my-1" cols="6">
                <div class="caption grey--text">Gestionnaire</div>
                <v-icon>{{
                  account.gestionnaire ? 'mdi-check' : 'mdi-close'
                }}</v-icon>
              </v-col>
              <v-col class="my-1" cols="6">
                <div class="caption grey--text">Doc Post</div>
                <v-icon>{{
                  account.documentPost ? 'mdi-check' : 'mdi-close'
                }}</v-icon>
              </v-col>
              <v-col class="my-1" cols="6">
                <div class="caption grey--text">Doc Modif</div>
                <v-icon>{{
                  account.documentModif ? 'mdi-check' : 'mdi-close'
                }}</v-icon>
              </v-col>
            </v-row>
          </v-col>
        </v-row>
      </v-col>
      <v-col cols="2">
        <v-btn
          v-if="user.admin && !account.admin"
          @click="goToEdit"
          class="primary--text"
          icon
        >
          <v-icon>mdi-pencil</v-icon>
        </v-btn>
        <v-btn v-if="!account.admin" @click="deleteAccount" icon>
          <v-icon class="primary--text">mdi-delete</v-icon>
        </v-btn>
      </v-col>
    </v-row>
  </v-card>
</template>

<script>
import moment from 'moment'
moment.locale('fr')

export default {
  props: {
    account: {
      type: Object,
      default: null
    }
  },
  computed: {
    lastSeenFormatted() {
      if (!this.account.lastSeen) {
        return "Ne s'est pas encore connecté"
      }
      return moment
        .utc(this.account.lastSeen.replace('-', ''), 'YYYYMMDD h:mm:ss')
        .fromNow()
    },
    user() {
      return this.$store.state.user
    }
  },
  methods: {
    deleteAccount() {
      this.$emit('deleteAccount', this.account)
    },
    goToEdit() {
      this.$router.push(`/account/${this.account.Id}/edit`)
    }
  }
}
</script>
