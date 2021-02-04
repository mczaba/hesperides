<template>
  <v-card class="px-10 component mt-10">
    <v-card-title class="px-0">
      <h3>
        Créer un locataire
      </h3>
    </v-card-title>
    <v-form ref="form">
      <v-text-field :rules="requiredRule" v-model="nom" label="Nom (requis)" />
      <v-text-field v-model="prenom" label="Prénom" />
      <v-text-field v-model="telephone" label="Téléphone" />
      <v-text-field v-model="mobile" label="Mobile" />
      <v-text-field :rules="mailRule" v-model="mail" label="Email" />
      <v-textarea v-model="observation" label="Observations"></v-textarea>
      <v-text-field
        :rules="lotRule"
        v-model.number="lot"
        label="Numéro de lot (requis)"
        type="number"
      />
      <v-card v-if="proprietaire" class="indigo white--text mb-3">
        <v-card-title>Propriétaire actuel :</v-card-title>
        <v-card-text class="white--text"
          >{{ proprietaire.nom }} {{ proprietaire.prenom }}</v-card-text
        >
      </v-card>
      <p v-if="error" class="error--text">{{ error }}</p>
      <p v-if="success" class="success--text">{{ success }}</p>
      <v-btn @click="submit" class="primary my-6">Créer le locataire</v-btn>
    </v-form>
  </v-card>
</template>

<script>
import axios from 'axios'

export default {
  middleware: 'gestionnaire',
  data() {
    return {
      nom: '',
      prenom: '',
      telephone: '',
      mobile: '',
      mail: '',
      observation: '',
      lot: 0,
      error: null,
      success: null,
      requiredRule: [(v) => v.length >= 1 || 'Vous devez renseigner ce champ'],
      lotRule: [(v) => v > 0 || 'Vous devez renseigner ce champ'],
      mailRule: [
        (v) =>
          v.length < 1 ||
          /^[a-z0-9._-]+@[a-z0-9._-]{2,}\.[a-z]{2,4}$/.test(v) ||
          'Veuillez renseigner une adresse valide'
      ]
    }
  },
  methods: {
    submit() {
      if (this.$refs.form.validate()) {
        this.error = null
        this.success = null
        const fd = new FormData()
        fd.append('nom', this.nom)
        fd.append('lot', this.lot)
        if (this.prenom) {
          fd.append('prenom', this.prenom)
        }
        if (this.telephone) {
          fd.append('telephone', this.telephone)
        }
        if (this.mobile) {
          fd.append('mobile', this.mobile)
        }
        if (this.mail) {
          fd.append('mail', this.mail)
        }
        if (this.observation) {
          fd.append('observation', this.observation)
        }
        axios
          .post(`${process.env.API_URL || ''}/API/locataire/create`, fd, {
            headers: { authorization: `Bearer: ${this.$store.state.token}` }
          })
          .then((response) => {
            if (response.status === 200) {
              this.success = response.data
              this.$refs.form.resetValidation()
              this.nom = ''
              this.prenom = ''
              this.lot = ''
              this.telephone = ''
              this.mobile = ''
              this.mail = ''
              this.proprio = null
              this.observation = ''
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
