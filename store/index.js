import moment from 'moment'

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
  },
  logOut: (state) => {
    state.token = ''
    state.user = null
  }
}

export const actions = {
  logIn: ({ commit, state }, payload) => {
    localStorage.setItem(
      'auth',
      JSON.stringify({
        token: payload.token,
        user: payload.user,
        expire: moment().add(24, 'h')
      })
    )
    commit('logIn', payload)
  },
  startApp: ({ commit, state }, payload) => {
    if (process.client) {
      if (localStorage.getItem('auth')) {
        const auth = JSON.parse(localStorage.getItem('auth'))
        if (!moment().isAfter(auth.expire)) {
          commit('logIn', auth)
        }
      }
    }
  },
  logOut: ({ commit }) => {
    localStorage.removeItem('auth')
    commit('logOut')
  }
}
