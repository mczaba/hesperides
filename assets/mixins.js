export const paginationMixin = function(list, elementPerPage) {
  return {
    data() {
      return {
        currentPage: 0,
        elementPerPage
      }
    },
    computed: {
      maxPage() {
        return Math.floor((this[list].length - 1) / this.elementPerPage)
      },
      pages() {
        const pages = []
        for (let i = 0; i <= this.maxPage; i += 1) {
          pages.push(i)
        }
        return pages
      },
      pageList() {
        if (
          this.currentPage * this.elementPerPage + this.elementPerPage >
          this[list].length - 1
        ) {
          return this[list].slice(
            this.currentPage * this.elementPerPage,
            this[list].length
          )
        }
        return this[list].slice(
          this.currentPage * this.elementPerPage,
          this.currentPage * this.elementPerPage + this.elementPerPage
        )
      }
    },
    methods: {
      nextPage() {
        this.currentPage += 1
        if (this.currentPage > this.maxPage) {
          this.currentPage = 0
        }
      },
      previousPage() {
        this.currentPage -= 1
        if (this.currentPage < 0) {
          this.currentPage = this.maxPage
        }
      }
    }
  }
}
