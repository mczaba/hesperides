<template>
  <v-card class="pa-3 mb-2" flat>
    <v-row no-gutters>
      <v-col cols="10">
        <v-row no-gutters wrap align="center">
          <v-col class="my-1" cols="3">
            <div class="caption grey--text">Titre</div>
            <div>{{ document.title }}</div>
          </v-col>
          <v-col class="my-1" cols="3">
            <div class="caption grey--text">Type</div>
            <div>{{ document.type }}</div>
          </v-col>
          <v-col class="my-1" cols="3">
            <div class="caption grey--text">Ajouté le</div>
            <div>{{ date }}</div>
          </v-col>
          <v-col class="my-1" cols="3">
            <div
              :class="{
                'success--text': document.status,
                'error--text': !document.status
              }"
            >
              {{ document.status ? 'Traité' : 'A traiter' }}
            </div>
          </v-col>
        </v-row>
      </v-col>
      <v-col cols="2">
        <v-container fill-height>
          <v-row no-gutters align="center">
            <v-btn :href="url" target="_blank" class="primary--text" icon>
              <v-icon>mdi-file-pdf</v-icon>
            </v-btn>
            <v-btn @click="statusSwitch" class="primary--text" icon>
              <v-icon>{{
                document.status ? 'mdi-close-thick' : 'mdi-check-bold'
              }}</v-icon>
            </v-btn>
            <v-btn @click="deleteDoc" class="primary--text" icon>
              <v-icon>mdi-delete</v-icon>
            </v-btn>
          </v-row>
        </v-container>
      </v-col>
    </v-row>
  </v-card>
</template>

<script>
import axios from 'axios'
import moment from 'moment'
moment.locale('fr')

export default {
  props: {
    document: {
      type: Object,
      default: null
    }
  },
  computed: {
    date() {
      return moment(this.document.postedat).format('Do MMMM YYYY')
    },
    url() {
      return `${process.env.API_URL}/${this.document.filepath}`
    }
  },
  methods: {
    statusSwitch() {
      axios
        .get(`${process.env.API_URL}/API/document/${this.document.Id}/status`, {
          headers: { authorization: `Bearer: ${this.$store.state.token}` }
        })
        .then((response) => {
          if (response.status === 200) {
            this.$emit('reload')
          } else {
            this.$emit('error', response.data)
          }
        })
        .catch((error) => {
          if (
            error.toString() === 'Error: Request failed with status code 401'
          ) {
            error = "Vous n'avez pas l'autorisation nécessaire"
          }
          this.$emit('error', error)
        })
    },
    deleteDoc() {
      this.$emit('deleteDoc', this.document)
    }
  }
}
</script>
