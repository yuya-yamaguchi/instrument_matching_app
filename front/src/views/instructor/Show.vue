<template>
  <div class="double-container">
    <div class="side-container">
      <img src="@/assets/logo.png">
      <p class="user-name">{{ instructor.user_name }}</p>
    </div>
    <div class="main-container">
      <h3 class="main-title">{{ instructor.title }}</h3>
      <div>
        <p class="sub-title">できること</p>
        <p class="explain-text">{{ instructor.details }}</p>
      </div>
      <button @click="getReserve()">予約表を表示</button>
      <div v-if="reserveSettings.length!=0" class="sub-title">
        予約一覧
        <table>
          <tr>
            <th>日付</th>
            <th v-for="(reserve_day, i) in reserve_days" :key="i">
              {{ reserve_day }}
            </th>
          </tr>
          <tr v-for="(reserveSetting, j) in reserveSettings" :key="j">
            <td>{{ j }}:00</td>
            <template v-for="(r, k) in reserveSetting" :key="k">
              <td v-if="r.reservable_flg==true" @click="postReserve(r.week, r.hour)" class="reservable_culumn">
              </td>
              <td v-else class="no_reservable_culumn">
                
              </td>
            </template>
          </tr>
        </table>
      </div>
    </div>
  </div>
</template>

<script>
import axios from 'axios';

const hostName = 'localhost:3000';
const path = '/api/instructors';
const reserve_path = '/api/reserves';
var   today = new Date();
var   one_week = [];
// 本日日付から1週間を取得
for (var i=0; i < 7; i++) {
  one_week[i] = `${today.getMonth()+1} / ${today.getDate()}`;
  today.setDate(today.getDate() + 1);
}

export default {
  data() {
    return {
      instructor: {},
      reserveSettings: [],
      reserve_days: one_week
    }
  },
  methods: {
    getInstructor: function() {
      axios.get(
        `http://${hostName}${path}/${this.$route.params.id}`,
        {
          params: {
            user_id: this.$store.getters.id
          }
        }
      )
      .then((response) => {
        console.log(this.reserveSettings.length);
        this.instructor = response.data.instructor;
      })
      .catch(function(error) {
        console.log(error);
      });
    },
    getReserve: function() {
      axios.get(
        `http://${hostName}${reserve_path}`,
        {
          params: {
            instructor_id: this.$route.params.id
          }
        }
      )
      .then((response) => {
        this.reserveSettings = response.data.reserve_settings;
      })
      .catch(function(error) {
        console.log(error);
      });
    },
    postReserve: function(j, k) {
      var today = new Date();
      today.setDate(today.getDate() + j);
      console.log(k, j);
      console.log(`${today.getFullYear()}/${today.getMonth()+1}/${today.getDate()}`);
      axios.post(
        `http://${hostName}${reserve_path}`,
        {
          reserve: {
            date: `${today.getFullYear()}/${today.getMonth()+1}/${today.getDate()}`,
            user_id: this.$store.getters.id,
            instructor_id: this.instructor.id,
            week: j,
            hour: k
          }
        }
      )
      .then(() => {
        console.log("OK!!!")
      })
      .catch(function(error) {
        console.log(error);
      });
    }
  },
  mounted: function() {
    this.getInstructor();
  }
}
</script>

<style scoped lang="scss">
img {
  display: block;
  width: 50%;
  margin: 0 auto;
}

table {
  border: 1px solid #333;
}

th {
  border: 1px solid #333;
}

td {
  width: 50px;
  border: 1px solid #333;
}

.reservable_culumn {
  cursor: pointer;
  &:hover{
    background: lightgreen;
  }
}

.no_reservable_culumn {
  background: lightgray;
  text-align: center;
}
</style>