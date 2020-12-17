<template>
  <div class="double-container">
    <div class="side-container">
      <SideBar/>
    </div>
    <div class="main-container">
      <div class="room-container">
        <div v-for="(messageRoom, i) in messageRooms" :key="i" class="message-box">
          <router-link :to="`/mypage/direct/${messageRoom.id}`" class="router-link">
            <div class="reserver-name">{{ messageRoom.reserver_name }}</div>
            <div class="message-content">
              <div class="latest-message">{{ messageRoom.latest_message }}</div>
              <div class="message-date">{{ messageRoom.update_date }}</div>
            </div>
          </router-link>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import axios from 'axios';
import SideBar from '@/components/SideBar.vue';

const hostName = 'localhost:3000';
const message_room_path = '/api/message_rooms';

export default {
  components: {
    SideBar
  },
  data() {
    return {
      messageRooms: []
    }
  },
  methods: {
    getMessageRoom: function() {
      axios.get(
        `http://${hostName}${message_room_path}`,
        {
          params: {
            user_id: this.$store.getters.id,
          }
        }
      )
      .then((response) => {
        console.log(response.data);
        this.messageRooms = response.data;
      })
      .catch(function(error) {
        console.log(error);
      });
    }
  },
  mounted() {
    this.getMessageRoom();
  }
}
</script>

<style scoped lang="scss">
.message-box {
  width: 90%;
  border: 1px solid;
  margin: 10px auto;
  .reserver-name {
    font-size: 20px;
    font-weight: bold;
    padding: 5px;

  }
  .message-content{
    display: flex;
    justify-content: space-between;
    margin-left: 20px;
    .latest-message {
      font-size: 14px;
      color: #333;
    }
    .message-date {
      font-size: 12px;
      color: #888;
    }
  }
}

.router-link {
  text-decoration: none;
  color: #333;
}
</style>