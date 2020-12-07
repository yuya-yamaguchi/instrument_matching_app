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
      <button type="submit" class="sign-up-button">ログインする</button>
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
      users: [],
      user: {}
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
        console.log(response.headers['access-token']);
        this.$store.dispatch(
          "updateUser",
          {
            email:  response.data.data.email,
            token:  response.headers['access-token'],
            uid:    response.headers['uid'],
            client: response.headers['client']
          }
        );
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
