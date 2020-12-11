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
      <button :disabled="applied" @click="applyBoard()" class="button-default" :class="{ activeClass: applied }">{{ applyBtnText }}</button>
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
      board: [],
      // computedを利用する?
      applyBtnText: "この募集に申し込む",
      applied: false
    }
  },
  methods: {
    getBoard: function(){
      axios.get(
        `http://${hostName}${path}/${this.$route.params.id}`,
        {
          params: {
            user_id: this.$store.getters.id
          }
        }
      )
      .then((response) => {
        console.log(response);
        this.board = response.data.board;
        this.applied = response.data.applied;
        if ( this.applied ) {
          this.applyBtnText = "申し込み済"
        }
      })
      .catch(function(error) {
        console.log(error);
      });
    },
    // 募集への申し込み
    applyBoard: function() {
      axios.post(
        `http://${hostName}${path}/${this.$route.params.id}/apply`,
        {
          user_id: this.$store.getters.id
        }
      )
      .then(() => {
        console.log("募集");
        this.applied = true;
        this.applyBtnText = "申し込み済"
      })
      .catch(function(error) {
        console.log(error);
      });
    },
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

.activeClass {
  background: gray;
  cursor: not-allowed;
}
</style>