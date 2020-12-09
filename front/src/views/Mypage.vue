<template>
  <div class="single-container">
    <div class="mypage-user-icon">
      <img src="../assets/logo.png">
      <p class="main-title">{{ user.name }}</p>
    </div>
    <div class="my-boards">
      <p class="my-boards--title sub-title">メンターとして掲載した募集</p>
      <div class="my-boards--contents">
        <Instruments v-if="boards!=''" :boards-prop="boards"></Instruments>
      </div>
    </div>
  </div>
</template>

<script>
import axios from 'axios';
import Instruments from "@/components/Instruments.vue";

const hostName = 'localhost:3000';
const mypage_path = '/api/users/mypage';

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
    getMypageInfo: function() {
      axios.get(
        `http://${hostName}${mypage_path}`,
        {
          params: {
            uid: this.$store.getters.uid
          }
        }
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
    this.getMypageInfo();
  }
}
</script>

<style scoped lang="scss">
.mypage-user-icon {
  text-align: center;
  border: 1px solid #333;
}
</style>