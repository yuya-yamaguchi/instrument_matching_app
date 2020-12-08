<template>
  <div class="all-container">
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
.all-container {
  display: flex;
  justify-content: space-between;
  margin: 50px 0;
  .side-container{
    width: 30%;
    background: wheat;
    box-sizing: border-box;
    padding: 10px;
    img {
      display: block;
      width: 50%;
      margin: 0 auto;
    }
  }
  .main-container{
    width: 65%;
    background: var(--main_color);
    box-sizing: border-box;
    padding: 10px;
  }
}
</style>