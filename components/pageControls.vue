<template>
  <div v-if="list.length > 0" class="pageControlWrapper mt-7">
    <v-layout id="pageControl" class="shrink" justify-space-around align-center>
      <v-btn @click="$emit('previous')" class="primary pageButton">
        <v-icon>mdi-chevron-left</v-icon>
      </v-btn>
      <div class="inputWrapper">
        <v-text-field
          v-model="pageInputLoc"
          @keyup="$emit('update', pageInputLoc)"
          label="page"
          class="pageInput"
        ></v-text-field>
        <span> / {{ maxPage + 1 }}</span>
      </div>
      <v-btn @click="$emit('next')" class="primary pageButton">
        <v-icon>mdi-chevron-right</v-icon>
      </v-btn>
    </v-layout>
  </div>
</template>

<script>
export default {
  props: {
    list: {
      type: Array,
      default: null
    },
    maxPage: {
      type: Number,
      default: 0
    },
    pageInput: {
      type: Number,
      default: 1
    }
  },
  data() {
    return {
      pageInputLoc: this.pageInput
    }
  },
  watch: {
    pageInput() {
      this.pageInputLoc = this.pageInput
    }
  }
}
</script>

<style lang="scss" scoped>
.pageButton {
  min-width: 30px !important;
  width: 30px;
}
#pageControl {
  width: 200px;
  height: 35px;
}
.pageInput {
  width: 27px !important;
}
.inputWrapper {
  display: flex;
  align-items: center;
  height: 100%;
  span {
    transform: translateY(-4px);
  }
}
.pageControlWrapper {
  display: flex;
  justify-content: center;
}
</style>
