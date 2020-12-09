<template>
  <div class="boards-container">
    <div class="posted-board" v-for="(board, i) in boards" :key="i">
      <img src="../assets/logo.png">
      <p class="posted-board--title">
        <router-link :to="`/boards/${board.id}`">{{ board.title }}</router-link>
      </p>
      <p class="posted-board--detail">
        {{ board.detail }}
      </p>
      <div class="mentors-card--user">
        <div class="posted-board--user--img">
          <img src="../assets/logo.png">
        </div>
        <p class="posted-board--user--name">
          {{ board.username }}
        </p>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  props: {
    boardsProp: {}
  },
  data() {
    return {
      boards: this.boardsProp
    }
  }
}
</script>

<style lang="scss" scoped>
.boards-container {
  display: flex;
  justify-content: flex-start;
  flex-wrap: wrap;
  .posted-board {
    width: 240px;
    height: 350px;
    box-shadow: 10px 10px 10px rgba(70, 70, 70, 0.2);
    background: #FFF;
    margin: 20px;
    padding: 10px;
    img {
      display: block;
      width: 80%;
      margin: 0 auto;
      background: #333;
    }
    &--title {
      font-size: 20px;
      font-weight: bold;
      margin: 10px 0;
      a {
        text-decoration: none;
        color: #2c3e50;
      }
    }
    &--detail {
      font-size: 12px;
    }
    &--user {
      display: flex;
      justify-content: flex-start;
      margin: 10px 0;
      &--img {
        width: 20%;
      }
    }
  }
}
</style>