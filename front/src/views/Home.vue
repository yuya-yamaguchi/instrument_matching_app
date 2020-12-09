<template>
  <div class="home">
    <div class="home-head">
      <p>いつでも相談できる<br>メンターを見つけよう</p>
    </div>
    <div class="app-explain">
      <p>楽器を「教えたい人」と「やりたい人」を繋ぐプラットフォーム</p>
    </div>
    <div class="popular-instrument">
      <Instruments v-if="boards!=''" :boards-prop="boards"></Instruments>
    </div>
  </div>
</template>

<script>
import axios from 'axios';
import Instruments from "@/components/Instruments.vue";

const hostName = 'localhost:3000';
const path = '/api/boards'

export default {
  components: {
    Instruments
  },
  data() {
    return {
      boards: []
    }
  },
  methods: {
    getBoards: function(){
      axios.get(`http://${hostName}${path}`)
      .then((response) => {
        console.log(response.data);
        this.boards = response.data;
      })
      .catch(function(error) {
        console.log(error);
      });
    }
  },
  created: function() {
    this.getBoards();
  }
}
</script>

<style scoped, lang="scss">

.home-head {
  font-size: 40px;
  padding: 60px 0;
}

.app-explain {
  font-size: 30px;
  font-weight: bold;
  padding: 60px 0;
}
</style>