<template>
  <div class="double-container">
    <div class="side-container">
      <SideBar/>
    </div>
    <div class="main-container">
      <div class="mypage-user-icon">
        <img src="@/assets/logo.png">
        <p class="main-title">{{ user.name }}</p>
      </div>
      <div class="my-boards">
        <p class="my-boards--title sub-title">メンターとして掲載した募集</p>
        <div class="my-boards--contents">
          <Instruments v-if="boards!=''" :boards-prop="boards"/>
        </div>
      </div>
      <router-view></router-view>
    </div>
  </div>
</template>

<script>
import axios from 'axios';
import Instruments from "@/components/Instruments.vue";
import SideBar from "@/components/SideBar.vue";

const hostName = 'localhost:3000';
const mypage_path = '/api/users/mypage';

export default {
  components: {
    Instruments,
    SideBar
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