<template>
  <div class="double-container">
    <div class="side-container">
      <SideBar/>
    </div>
    <div class="main-container">
      <div id="messages-container">
        <div v-for="(message, i) in messages" :key="i">
          <div v-if="message.user_id==$store.getters.id" class="my-message">
            <div>
              <div class="my-message--text">
                {{ message.text }}
              </div>
              <div class="my-message--date">
                {{ message.date }}
              </div>
            </div>
          </div>
          <div v-else class="reserver-message">
            <div>
              <div class="reserver-message--text">
                {{ message.text }}
              </div>
              <div class="reserver-message--date">
                {{ message.date }}
              </div>
            </div>
          </div>
        </div>
        <div v-for="(sendMessage, j) in sendMessages" :key="j" class="my-message">
          <div>
            <div class="my-message--text">
              {{ sendMessage.text }}
            </div>
            <div class="my-message--date">
              {{ sendMessage.date }}
            </div>
          </div>
        </div>
      </div>
      <div class="input-message-container">
        <form v-on:submit.prevent="postMessage()">
          <textarea v-model="message"></textarea>
          <button>送信</button>
        </form>
      </div>
    </div>
  </div>
</template>

<script>
import axios from 'axios';
import SideBar from '@/components/SideBar.vue';

const hostName = 'localhost:3000';
const message_path = '/api/message_rooms';

// obj.scrollTop = obj.scrollHeight;

export default {
  components: {
    SideBar
  },
  data() {
    return {
      messages: [],
      message:  "",
      sendMessages: []
    }
  },
  methods: {
    getMessages: function() {
      axios.get(
        `http://${hostName}${message_path}/${this.$route.params.id}`,
        {
          params: {
            user_id: this.$store.getters.id
          }
        }
      )
      .then((response) => {
        this.messages = response.data;
      })
      .catch(function(error) {
        console.log(error);
      });
    },
    postMessage: function() {
      axios.post(
        `http://${hostName}${message_path}/${this.$route.params.id}/messages`,
        {
          user_id: this.$store.getters.id,
          message: {
            text: this.message
          }
        }
      )
      .then((response) => {
        this.sendMessages.push(response.data);
      })
      .catch(function(error) {
        console.log(error);
      });
    }
  },
  mounted() {
    this.getMessages();
  },
  updated() {
    var obj = document.getElementById("messages-container");
    obj.scrollTop = obj.scrollHeight;
    obj.scrollTo(0, obj.scrollTop);
  }
}
</script>

<style scoped lang="scss">
#messages-container {
  height: calc(100vh - 350px);
  overflow-y: scroll;
  .reserver-message {
    margin-top: 10px;
    display: flex;
    justify-content: flex-start;
    &--text {
      white-space: pre-wrap;
      padding: 5px;
      border: 1px solid;
      border-radius: 10px;
      font-size: 14px;
      background: #FFF;
    }
    &--date {
      font-size: 10px;
      color: #888;
    }
  }
  .my-message {
    margin-top: 10px;
    display: flex;
    justify-content: flex-end;
    &--text {
      white-space: pre-wrap;
      padding: 5px;
      border: 1px solid;
      border-radius: 10px;
      font-size: 14px;
      background: #FFF;
    }
    &--date {
      font-size: 10px;
      color: #888;
    }
  }
}

.input-message-container {
  bottom: 0;
  width: 90%;
  margin: 0 auto;
  form {
    display: flex;
    justify-content: space-between;
    textarea {
      width: 90%;
      min-height: 80px;
      font-size: 14px;
      padding: 5px;
    }
    button {
      border-radius: 10%;
      width: 50px;
      margin: 5px;
    }
  }
}
</style>