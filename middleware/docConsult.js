export default function({ store, error }) {
  if (!store.state.user) {
    error({
      message: "Vous n'avez pas l'autorisation de visiter cette page",
      statusCode: 403
    })
  } else if (
    !store.state.user.documentPost &&
    !store.state.user.documentModif
  ) {
    error({
      message: "Vous n'avez pas l'autorisation de visiter cette page",
      statusCode: 403
    })
  }
}
