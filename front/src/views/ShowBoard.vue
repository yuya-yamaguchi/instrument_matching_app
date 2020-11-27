<template>
  <div>
    {{ board.id }}
    {{ board.title }}
    {{ board.username }}
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
  mounted: function() {
    this.getBoard();
  }
}
</script>
