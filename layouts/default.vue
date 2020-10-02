<template>
  <v-app>
    <v-navigation-drawer
      v-if="user"
      v-model="drawer"
      fixed
      app
      mobile-breakpoint="800"
      bottom
      class="pt-6 primary white--text"
    >
      <v-layout column>
        <h2 class="text-center mb-6">
          Connecté en tant que : {{ user.login }}
        </h2>
        <v-list v-if="user.admin">
          <v-list-item
            v-for="(item, i) in adminRoutes"
            :key="i"
            :to="item.to"
            router
            exact
          >
            <v-list-item-action>
              <v-icon class="white--text">{{ item.icon }}</v-icon>
            </v-list-item-action>
            <v-list-item-content class="white--text">
              <v-list-item-title v-text="item.title" />
            </v-list-item-content>
          </v-list-item>
        </v-list>
        <v-list v-if="user.gestionnaire">
          <v-list-item
            v-for="(item, i) in gestionnaireRoutes"
            :key="i"
            :to="item.to"
            router
            exact
          >
            <v-list-item-action>
              <v-icon class="white--text">{{ item.icon }}</v-icon>
            </v-list-item-action>
            <v-list-item-content class="white--text">
              <v-list-item-title v-text="item.title" />
            </v-list-item-content>
          </v-list-item>
        </v-list>
        <v-list>
          <v-list-item
            v-for="(item, i) in authRoutes"
            :key="i"
            :to="item.to"
            router
            exact
          >
            <v-list-item-action>
              <v-icon class="white--text">{{ item.icon }}</v-icon>
            </v-list-item-action>
            <v-list-item-content class="white--text">
              <v-list-item-title v-text="item.title" />
            </v-list-item-content>
          </v-list-item>
        </v-list>
      </v-layout>
    </v-navigation-drawer>
    <v-app-bar fixed app>
      <v-btn v-if="mobileView && user" @click.stop="drawer = !drawer" icon
        ><v-icon>mdi-menu</v-icon></v-btn
      >
      <v-btn @click="switchTheme" icon>
        <v-icon>{{ themeButtonIcon }}</v-icon>
      </v-btn>
      <v-spacer />
      <v-menu v-if="user" offset-y>
        <template v-slot:activator="{ on, attrs }">
          <v-btn v-bind="attrs" v-on="on" text
            >{{ user.login }}<v-icon>mdi-chevron-down</v-icon></v-btn
          >
        </template>
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
      <v-container id="content">
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
      authRoutes: [
        {
          icon: 'mdi-account-multiple',
          title: 'Liste des propriétaires',
          to: '/proprietaire/list'
        },
        {
          icon: 'mdi-tag',
          title: 'Liste des lots',
          to: '/lots/list'
        }
      ],
      adminRoutes: [
        {
          icon: 'mdi-account-multiple',
          title: 'Liste des comptes',
          to: '/account/list'
        },
        {
          icon: 'mdi-account-plus',
          title: 'Créer un compte',
          to: '/account/create'
        }
      ],
      gestionnaireRoutes: [
        {
          icon: 'mdi-account-plus',
          title: 'Ajouter un propriétaire',
          to: '/proprietaire/create'
        },
        {
          icon: 'mdi-tag-plus',
          title: 'Ajouter un lot',
          to: '/lots/create'
        }
      ],
      drawer: true,
      windowWidth: null
    }
  },
  computed: {
    themeButtonIcon() {
      return this.$vuetify.theme.dark ? 'mdi-brightness-7' : 'mdi-brightness-2'
    },
    user() {
      return this.$store.state.user
    },
    mobileView() {
      return this.windowWidth < 800
    }
  },
  mounted() {
    // eslint-disable-next-line nuxt/no-env-in-hooks
    if (process.client) {
      this.windowWidth = window.innerWidth
      this.drawer = window.innerWidth > 800
      window.addEventListener('resize', () => {
        this.windowWidth = window.innerWidth
      })
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
      this.$router.push('/')
    }
  }
}
</script>

<style lang="scss">
.component {
  width: 75%;
  margin: auto;
  min-width: 400px;
}
#mobile-nav-button {
  position: absolute;
  bottom: 5px;
  right: 5px;
}
.v-card__text,
.v-card__title {
  word-break: normal; /* maybe !important  */
}
@media screen and (max-width: 400px) {
  .component {
    width: 100%;
    min-width: auto;
  }
}
</style>
