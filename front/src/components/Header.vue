<template>
  <header>
    <router-link to="/" class="main-title">INST_APP</router-link>
    <div class="header-menus">
      <div v-if="!$store.getters.email" class="header-menus">
        <router-link to="/signup" class="sign-btn">新規会員登録</router-link>
        <router-link to="/signin" class="sign-btn">ログイン</router-link>
      </div>
      <div v-else class="header-menus">
        <router-link to="/instructor/new" class="sign-btn">講師として登録</router-link>
        <button type="submit" @click="logout" class="sign-btn">ログアウト</button>
        <router-link to="/mypage" class="user-name">{{ $store.getters.email }}</router-link>
      </div>
    </div>
  </header>
</template>

<script>
import axios from 'axios';

const hostName = 'localhost:3000';
const sign_out_path = '/api/v1/auth/sign_out'

export default {
  methods: {
    logout: function() {
      // API側にてログアウトを行う
      axios.delete(
        `http://${hostName}${sign_out_path}`,
        {
          data: {
            "uid":          this.$store.getters.uid,
            "access-token": this.$store.getters.token,
            "client":       this.$store.getters.client
          }
        }
      )
      .then((response) => {
        console.log(response);
        // FRONT側のユーザ情報を削除
        this.$store.dispatch("logout");
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
header{
  width: 100%;
  height: 60px;
  background: #333;
  display: flex;
  justify-content: space-between;
  color: #FFF;
  .main-title {
    text-align: left;
    line-height: 60px;
    padding: 0 20px;
    color: #FFF;
    font-size: 30px;
    text-decoration: none;
  }
  .header-menus {
    margin-right: 30px;
    display: flex;
    justify-content: flex-end;
    .sign-btn {
      display: block;
      text-decoration: none;
      color:#FFF;
      font-size: 12px;
      font-weight: bold;
      background: #13b1c0;
      border: 1px solid;
      margin: 0 10px;
      margin-top: 15px;
      padding: 0 10px;
      border-radius: 5px;
      height: 30px;
      line-height: 30px;
      cursor: pointer;
    }
    .user-name {
      font-size: 16px;
      padding-top: 15px;
      text-decoration: none;
      color: #FFF;
    }
  }
}
</style>
