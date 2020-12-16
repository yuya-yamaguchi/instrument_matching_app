<template>
  <div id="overlay">
    <div class="message-container">
      <button @click="closeMessage()" class="close-button">×</button>
      <div v-if="messageRoom.length==0" class="form-item">
        <p>メッセージで相談する</p>
        <textarea v-model="message" class="messageBox" placeholder="気になることを相談してみましょう！"></textarea>
        <button @click="sendMessage()" class="button-default">送信する</button>
      </div>
      <div v-else class="send-complete">
        <p class="sub-title">メッセージを送信しました</p>
      </div>
    </div>
  </div>
</template>

<script>
import axios from 'axios';

const hostName = 'localhost:3000';
const message_path = '/api/message_rooms';

export default {
  data() {
    return {
      message: "",
      messageRoom: []
    }
  },
  methods: {
    closeMessage: function() {
      this.message = "";
      this.messageRoom = [];
      this.$emit('from-child')
    },
    sendMessage: function() {
      axios.post(
        `http://${hostName}${message_path}`,
        {
          user_id: this.$store.getters.id,
          instructor_id: this.$route.params.id,
          message: {
            text: this.message
          }
        }
      )
      .then((response) => {
        this.messageRoom = response.data;
      })
      .catch(function(error) {
        console.log(error);
      });
    }
  }
}
</script>

<style scoped>
#overlay {
  z-index:1;
  position:fixed;
  top:0;
  left:0;
  width:100%;
  height:100%;
  background-color:rgba(0,0,0,0.5);
  display: flex;
  align-items: center;
  justify-content: center;
}

.message-container {
  z-index: 2;
  width: 70%;
  height: 70%;
  margin: 0 auto;
  background: #FFF;
}

.messageBox {
  min-height: 300px;
}

.send-complete {
  text-align: center;
}
</style>