<template>
  <v-card class="pa-3 mb-2" flat>
    <v-row no-gutters wrap align="center">
      <v-col cols="10">
        <v-row no-gutters>
          <v-col class="my-1" cols="12" md="6">
            <div class="caption grey--text">Login</div>
            <div>{{ account.login }}</div>
          </v-col>
          <v-col class="my-1" cols="6" md="3">
            <div class="caption grey--text">Admin</div>
            <v-icon>{{ account.admin ? 'mdi-check' : 'mdi-close' }}</v-icon>
          </v-col>
          <v-col class="my-1" cols="6" md="3">
            <div class="caption grey--text">Gestionnaire</div>
            <v-icon>{{
              account.gestionnaire ? 'mdi-check' : 'mdi-close'
            }}</v-icon>
          </v-col>
        </v-row>
      </v-col>
      <v-col cols="2">
        <v-btn @click="deleteAccount" icon>
          <v-icon class="primary--text">mdi-delete</v-icon>
        </v-btn>
      </v-col>
    </v-row>
  </v-card>
</template>

<script>
export default {
  props: {
    account: {
      type: Object,
      default: null
    }
  },
  methods: {
    deleteAccount() {
      this.$emit('deleteAccount', this.account)
    }
  }
}
</script>
