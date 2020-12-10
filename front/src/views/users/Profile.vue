<template>
  <div class="double-container">
    <div class="side-container">
      <SideBar/>
    </div>
    <div class="main-container">
      <form v-on:submit.prevent="updateProfile">
        <div class="form-item">
          <p>
            ユーザ名
          </p>
          <input type="text" v-model="user.name">
        </div>
        <div>
          <div class="form-item">
            <p>
              プロフィール
            </p>
            <textarea v-model="user.profile"></textarea>
          </div>
        </div>
        <button class="button-default">変更する</button>
      </form>
    </div>
  </div>
</template>

<script>
import axios from 'axios';
import SideBar from "@/components/SideBar.vue";

const hostName = 'localhost:3000';
const profile_path = '/api/users/profile';
const upd_profile_path = '/api/users';

export default {
  components: {
    SideBar
  },
  data() {
    return {
      user: {}
    }
  },
  methods: {
    // プロフィール情報の取得
    getProfile: function() {
      axios.get(
        `http://${hostName}${profile_path}`,
        {
          params: {
            uid: this.$store.getters.uid,
          }
        }
      )
      .then((response) => {
        this.user   = response.data
      })
      .catch(function(error) {
        console.log(error);
      });
    },
    // プロフィールの更新
    updateProfile: function() {
      axios.put(
        `http://${hostName}${upd_profile_path}/${this.$store.getters.id}`,
        {
          user: {
            name:    this.user.name,
            profile: this.user.profile
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
  },
  created: function() {
    this.getProfile();
  }
}
</script>

<style lang="scss" scoped>
</style>