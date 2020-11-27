export const state = () => ({
  proprietaire: 0,
  locataire: 0,
  lot: 0
})

export const mutations = {
  setProp: (state, payload) => {
    state.proprietaire = payload
  },
  setLot: (state, payload) => {
    state.lot = payload
  },
  setLoc: (state, payload) => {
    state.locataire = payload
  }
}
