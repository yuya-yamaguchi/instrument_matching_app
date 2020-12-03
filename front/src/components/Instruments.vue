<template>
  <div class="popular-instrument">
    <div class="popular-instrument--each">
      <h3>ギター</h3>
      <div class="mentors-box">
        <div class="mentors-card" v-for="(board, i) in boards" :key="i">
          <img src="../assets/logo.png">
          <p class="mentors-card--title">
            {{ board.title }}
          </p>
          <p class="mentors-card--explain">
            {{ board.explain }}
          </p>
          <div class="mentors-card--user">
            <div class="mentors-card--user--img">
              <img src="../assets/logo.png">
            </div>
            <p class="mentors-card--user--name">
              テストユーザ
            </p>
          </div>
        </div>
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
      boards: []
    }
  },
  methods: {
    getBoards: function(){
      axios.get(`http://${hostName}${path}`)
      .then((response) => {
        this.boards = response.data;
      })
      .catch(function(error) {
        console.log(error);
      });
    }
  },
  mounted: function() {
    this.getBoards();
  }
}
</script>

<style scoped, lang="scss">
.popular-instrument {
  &--each{
    margin: 0 auto;
    h3 {
      font-size: 30px;
    }
    .mentors-box {
      display: flex;
      justify-content:  flex-start;
      .mentors-card {
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
          margin: 10px 0;
        }
        &--explain {
          font-size: 12px;
        }
        &--user {
          display: flex;
          justify-content: flex-start;
          margin: 10px 0;
          &--img {
            width: 20%;
          }
          &--name {
            
          }
        }
      }
    }
  }
}
</style>