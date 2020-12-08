<template>
  <div class="sign-up-container">
    <h3 class="sign-up-title">新規会員登録</h3>
    <form v-on:submit.prevent="signUp">
      <div class="form-item">
        <p>ユーザ名</p>
        <input type="text" v-model="userName" placeholder="ユーザ名">
      </div>
      <div class="form-item">
        <p>メールアドレス</p>
        <input type="text" v-model="email" placeholder="inst@gmail.com">
      </div>
      <div class="form-item">
        <p>パスワード</p>
        <input type="password" v-model="password">
      </div>
      <div class="form-item">
        <p>確認用パスワード</p>
        <input type="password" v-model="passwordConfirmation">
      </div>
      <button class="sign-up-button" @click="signUp()">会員登録する</button>
    </form>
  </div>
</template>

<script>
import axios from 'axios';

const hostName = 'localhost:3000';
const path = '/api/v1/auth'

export default {
  data() {
    return {
      userName: "",
      email: "",
      password: "",
      passwordConfirmation: "",
      users: []
    }
  },
  methods: {
    signUp: function(){
      axios.post(`http://${hostName}${path}`,
        {name: this.userName,
         email: this.email,
         password: this.password,
         password_confirmation: this.passwordConfirmation
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

<style scoped, lang="scss">
.sign-up-container{
  width: 700px;
  margin: 50px auto;
  padding: 30px 0;
  box-shadow: 10px 10px 10px rgba(70, 70, 70, 0.2);
  background: burlywood;
}

.sign-up-title{
  font-size: 30px;
  text-align: center;
  padding: 40px 0;

}

.form-item{
  width:  80%;
  margin: 20px auto;
  text-align: center;
  p {
    text-align: left;
    font-size: 20px;
    margin: 5px;
  }
  input {
    width: 90%;
    padding: 5px;
  }
}

.sign-up-button {
  display: block;
  margin: 20px auto;
  padding: 10px 30px;
  border-radius: 20px;
  font-size: 20px;
  background: wheat;
}

</style>