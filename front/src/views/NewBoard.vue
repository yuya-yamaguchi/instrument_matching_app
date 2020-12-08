<template>
  <div class="default-container">
    <h3 class="sign-up-title">メンターとして登録する</h3>
    <form v-on:submit.prevent="boardCreate">
      <div class="form-item">
        <p>タイトル</p>
        <input type="text" v-model="title" placeholder="例：ギター教えます！">
      </div>
      <div class="form-textarea">
        <p>できること</p>
        <textarea v-model="detail" placeholder="例：ギターのメンターです！特にエレキギターが得意です！"></textarea>
      </div>
      <button class="sign-up-button" @click="boardCreate()">登録する</button>
    </form>
  </div>
</template>

<script>
import axios from 'axios';

const hostName = 'localhost:3000';
const path = '/api/boards'

export default {
  data() {
    return {
      title: "",
      detail: ""
    }
  },
  methods: {
    boardCreate: function(){
      axios.post(`http://${hostName}${path}`,
        {
          title: this.title,
          detail: this.detail
        }
      )
      .then(() => {
        this.$router.push({ 
          name: "Home"
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

.form-textarea {
  width: 80%;
  margin: 20px auto;
  text-align: center;
  p {
    text-align: left;
    font-size: 20px;
    margin: 5px;
  }
  textarea {
    width:  90%;
    padding: 5px;
    height: 200px;
  }
}
</style>