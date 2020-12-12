<template>
  <div class="default-container">
    <h3 class="sign-up-title">講師として登録する</h3>
    <form v-on:submit.prevent="instructorCreate">
      <div class="form-item">
        <p>タイトル</p>
        <input type="text" v-model="title" placeholder="例：ギター教えます！">
      </div>
      <div class="form-item">
        <p>できること</p>
        <textarea v-model="details" placeholder="例：ギター講師をしています！特にエレキギターが得意です！"></textarea>
      </div>
      <button class="sign-up-button">登録する</button>
    </form>
  </div>
</template>

<script>
import axios from 'axios';

const hostName = 'localhost:3000';
const path = '/api/instructors'

export default {
  data() {
    return {
      title: "",
      details: ""
    }
  },
  methods: {
    instructorCreate: function(){
      axios.post(`http://${hostName}${path}`,
        {
          user_id: this.$store.getters.id,
          instructor: {
            title:   this.title,
            details: this.details
          }
        }
      )
      .then(() => {
        this.$router.push({ 
          name: "Mypage"
        })
      })
      .catch(function(error) {
        console.log(error);
      });
    }
  }
}
</script>

<style scoped, lang="scss">
.default-container {
  width: 700px;
  margin: 50px auto;
  padding: 30px 0;
  box-shadow: 10px 10px 10px rgba(70, 70, 70, 0.2);
  background: burlywood;
}
</style>