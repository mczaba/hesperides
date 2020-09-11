export default function({ store, error }) {
  if (!store.state.user) {
    error({
      message: "Vous n'avez pas l'aurotisation de visiter cette page",
      statusCode: 403
    })
  }
}
