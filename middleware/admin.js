export default function({ store, error }) {
  if (!store.state.user) {
    error({
      message: "Vous n'avez pas l'autorisation de visiter cette page",
      statusCode: 403
    })
  }
}
