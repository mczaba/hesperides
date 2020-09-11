<template>
  <v-app>
    <v-navigation-drawer v-if="user" fixed app class="pt-6">
      <v-layout column>
        <h2 class="text-center mb-6">{{ user.login }}</h2>
        <v-list>
          <v-list-item v-if="user.admin" to="/account-list" router exact>
            <v-list-item-action>
              <v-icon>mdi-account-multiple</v-icon>
            </v-list-item-action>
            <v-list-item-content>
              <v-list-item-title>Liste des comptes</v-list-item-title>
            </v-list-item-content>
          </v-list-item>
          <v-list-item v-if="user.admin" to="/account-create" router exact>
            <v-list-item-action>
              <v-icon>mdi-account-plus</v-icon>
            </v-list-item-action>
            <v-list-item-content>
              <v-list-item-title>Créer un compte</v-list-item-title>
            </v-list-item-content>
          </v-list-item>
          <v-list-item
            v-for="(item, i) in items"
            :key="i"
            :to="item.to"
            router
            exact
          >
            <v-list-item-action>
              <v-icon>{{ item.icon }}</v-icon>
            </v-list-item-action>
            <v-list-item-content>
              <v-list-item-title v-text="item.title" />
            </v-list-item-content>
          </v-list-item>
        </v-list>
      </v-layout>
    </v-navigation-drawer>
    <v-app-bar fixed app>
      <v-btn @click="switchTheme" icon>
        <v-icon>{{ themeButtonIcon }}</v-icon>
      </v-btn>
      <v-spacer />
      <v-menu v-if="user" v-model="showMenu" offset-y>
        <v-btn slot="activator" @click="showMenu = true" text
          >{{ user.login }}<v-icon>mdi-chevron-down</v-icon></v-btn
        >
        <v-list>
          <change-mail @clicked="showMenu = false" />
          <change-pass @clicked="showMenu = false" />
          <v-list-item @click="logout">
            <v-list-item-title>Se déconnecter</v-list-item-title>
          </v-list-item>
        </v-list>
      </v-menu>
    </v-app-bar>
    <v-main class="secondary">
      <v-container>
        <nuxt />
      </v-container>
    </v-main>
  </v-app>
</template>

<script>
import changeMail from '../components/changeMailForm'
import changePass from '../components/changePassForm'

export default {
  components: {
    changeMail,
    changePass
  },
  data() {
    return {
      items: [
        {
          icon: 'mdi-apps',
          title: 'Welcome',
          to: '/'
        },
        {
          icon: 'mdi-chart-bubble',
          title: 'Inspire',
          to: '/inspire'
        }
      ],
      showMenu: false
    }
  },
  computed: {
    themeButtonIcon() {
      return this.$vuetify.theme.dark ? 'mdi-brightness-7' : 'mdi-brightness-2'
    },
    user() {
      return this.$store.state.user
    }
  },
  methods: {
    switchTheme() {
      this.$vuetify.theme.dark = !this.$vuetify.theme.dark
    },
    callFunction(functionName) {
      this[functionName]()
    },
    logout() {
      this.$store.commit('logOut')
      this.showMenu = false
    }
  }
}
</script>
