<template>
  <div class="double-container">
    <div class="side-container">
      <img src="@/assets/logo.png">
      <p class="user-name">{{ instructor.user_name }}</p>
    </div>
    <div class="main-container">
      <h3 class="main-title">{{ instructor.title }}</h3>
      <div>
        <p class="sub-title">できること</p>
        <p class="explain-text">{{ instructor.details }}</p>
      </div>
    </div>
  </div>
</template>

<script>
import axios from 'axios';

const hostName = 'localhost:3000';
const path = '/api/instructors'

export default {
  data() {
    return {
      instructor: {}
    }
  },
  methods: {
    getInstructor: function(){
      axios.get(
        `http://${hostName}${path}/${this.$route.params.id}`,
        {
          params: {
            user_id: this.$store.getters.id
          }
        }
      )
      .then((response) => {
        this.instructor = response.data.instructor;
      })
      .catch(function(error) {
        console.log(error);
      });
    }
  },
  mounted: function() {
    this.getInstructor();
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