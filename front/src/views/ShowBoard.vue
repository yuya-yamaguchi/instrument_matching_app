<template>
  <div class="double-container">
    <div class="side-container">
      <img src="../assets/logo.png">
      <p class="user-name">{{ board.username }}</p>
    </div>
    <div class="main-container">
      <h3 class="main-title">{{ board.title }}</h3>
      <div>
        <p class="sub-title">できること</p>
        <p class="explain-text">{{ board.detail }}</p>
      </div>
    </div>
  </div>
</template>

<script>
import axios from 'axios';

const hostName = 'localhost:3000';
const path = '/api/boards'

export default {
  data() {
    return {
      board: []
    }
  },
  methods: {
    getBoard: function(){
      axios.get(`http://${hostName}${path}/${this.$route.params.id}`)
      .then((response) => {
        this.board = response.data;
      })
      .catch(function(error) {
        console.log(error);
      });
    }
  },
  created: function() {
    this.getBoard();
  }
}
</script>

<style scoped lang="scss">
img {
  display: block;
  width: 50%;
  margin: 0 auto;
}
</style>