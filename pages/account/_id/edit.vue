<template>
  <v-card class="px-10 component mt-10">
    <v-card-title class="px-0">
      <h3>Changer les permissions du compte {{ login }}</h3>
    </v-card-title>
    <v-form ref="form">
      <v-select
        :items="selectList"
        :rules="requiredRule"
        v-model="permissions"
        label="Permissions"
      ></v-select>
      <p v-if="error" class="error--text">{{ error }}</p>
      <p v-if="success" class="success--text">{{ success }}</p>
      <v-btn @click="submit" class="primary my-6"
        >Changer les permissions</v-btn
      >
    </v-form>
  </v-card>
</template>

<script>
import axios from 'axios'

export default {
  middleware: 'admin',
  data() {
    return {
      login: '',
      permissions: '',
      selectList: ['Admin', 'Gestionnaire', 'Consultant'],
      error: null,
      success: null,
      requiredRule: [
        (v) =>
          v.length >= 1 || 'Vous devez renseigner les permissions du compte'
      ]
    }
  },
  mounted() {
    axios
      .get(`${process.env.API_URL}/API/auth/details/${this.$route.params.id}`, {
        headers: { authorization: `Bearer: ${this.$store.state.token}` }
      })
      .then((response) => {
        this.login = response.data.login
        if (response.data.admin) {
          this.permissions = 'Admin'
        } else if (response.data.gestionnaire) {
          this.permissions = 'Gestionnaire'
        } else {
          this.permissions = 'Consultant'
        }
      })
      .catch((error) => (this.error = error))
  },
  methods: {
    submit() {
      if (this.$refs.form.validate()) {
        this.error = null
        this.success = null
        const fd = new FormData()
        fd.append('permissions', this.permissions)
        axios
          .post(
            `${process.env.API_URL}/API/auth/changepermissions/${this.$route.params.id}`,
            fd,
            {
              headers: { authorization: `Bearer: ${this.$store.state.token}` }
            }
          )
          .then((response) => {
            if (response.status === 200) {
              this.success = response.data
              this.$refs.form.resetValidation()
            } else {
              this.error = response.data
            }
          })
          .catch((err) => (this.error = err))
      }
    }
  }
}
</script>
