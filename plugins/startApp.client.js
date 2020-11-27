import moment from 'moment'

export default function(context) {
  if (localStorage.getItem('auth')) {
    const auth = JSON.parse(localStorage.getItem('auth'))
    if (!moment().isAfter(auth.expire)) {
      context.store.commit('logIn', auth)
    }
  }
}
