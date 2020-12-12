<template>
  <div class="home">
    <div class="home-head">
      <p>いつでも相談できる<br>メンターを見つけよう</p>
    </div>
    <div class="app-explain">
      <p>楽器を「教えたい人」と「やりたい人」を繋ぐプラットフォーム</p>
    </div>
    <div class="instructor-list">
      <Instructors v-if="instructors!=''" :instructors-prop="instructors"/>
    </div>
  </div>
</template>

<script>
import axios from 'axios';
import Instructors from "@/components/Instructors.vue";

const hostName = 'localhost:3000';
const path = '/api/instructors'

export default {
  components: {
    Instructors
  },
  data() {
    return {
      instructors: []
    }
  },
  methods: {
    getInstructors: function(){
      axios.get(`http://${hostName}${path}`)
      .then((response) => {
        this.instructors = response.data;
      })
      .catch(function(error) {
        console.log(error);
      });
    }
  },
  created: function() {
    this.getInstructors();
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