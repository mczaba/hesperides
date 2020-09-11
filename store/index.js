export const state = () => ({
  token: null,
  user: null
})

export const getters = {
  token: () => state.token,
  user: () => state.user
}

export const mutations = {
  logIn: (state, payload) => {
    state.token = payload.token
    state.user = payload.user
    // localStorage.setItem(
    //   "token",
    //   JSON.stringify({
    //     token: payload.token,
    //     expire: moment().add(4, "m")
    //   })
    // );
  },
  logOut: (state) => {
    state.token = ''
    state.user = null
    // localStorage.removeItem("token");
  }
}

// const actions = {
//   logIn: ({ commit, state }, payload) => {
//     commit('logIn', payload)
//     interval = setInterval(() => {
//       axios
//         .get(`${process.env.VUE_APP_API_ADRESS}/users/refresh`, {
//           headers: { authorization: `Bearer: ${state.token}` }
//         })
//         .then((response) => {
//           commit('logIn', {
//             token: response.data.token,
//             username: response.data.username,
//             admin: response.data.admin
//           })
//         })
//     }, 240000)
//   },
//   logOut: ({ commit }) => {
//     commit('logOut')
//     clearInterval(interval)
//   }
// }
