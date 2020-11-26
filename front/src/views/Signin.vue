<template>
  <div class="sign-up-container">
    <h3 class="sign-up-title">ログイン</h3>
    <form v-on:submit.prevent="signIn">
      <div class="form-item">
        <p>メールアドレス</p>
        <input type="text" v-model="email" placeholder="inst@gmail.com">
      </div>
      <div class="form-item">
        <p>パスワード</p>
        <input type="password" v-model="password">
      </div>
      <button class="sign-up-button" @click="signIn()">ログインする</button>
    </form>
  </div>
</template>

<script>
import axios from 'axios';

const hostName = 'localhost:3000';
const path = '/api/v1/auth/sign_in'

export default {
  data() {
    return {
      email: "",
      password: "",
      loginFaild: false,
      users: []
    }
  },
  methods: {
    signIn: function(){
      axios.post(`http://${hostName}${path}`,
        {
          email: this.email,
          password: this.password
        }
      )
      .then((response) => {
        console.log(response.data);
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

