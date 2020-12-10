<template>
  <div class="single-container">
    <div class="user-icon">
      <img src="@/assets/logo.png">
      <p class="main-title">{{ user.name }}</p>
    </div>
    <div class="user-boards">
      <p class="user-boards--title sub-title">掲載している募集</p>
      <Instruments v-if="boards!=''" :boards-prop="boards"></Instruments>
    </div>
  </div>
</template>

<script>
import axios from 'axios';
import Instruments from "@/components/Instruments.vue";

const hostName = 'localhost:3000';
const users_show_path = '/api/users';

export default {
  components: {
    Instruments
  },
  data() {
    return {
      user: {},
      boards: []
    }
  },
  methods: {
    getUserInfo: function() {
      axios.get(
        `http://${hostName}${users_show_path}/${this.$route.params.id}`
      )
      .then((response) => {
        // FRONT側のユーザ情報を削除
        this.user   = response.data.user
        this.boards = response.data.boards
      })
      .catch(function(error) {
        console.log(error);
      });
    }
  },
  created: function() {
    this.getUserInfo();
  }
}
</script>

<style scoped lang="scss">
.user-icon {
  text-align: center;
  border: 1px solid #333;
}
</style>