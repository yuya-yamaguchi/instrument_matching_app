<template>
  <div class="instructors-container">
    <div class="posted-instructor" v-for="(instructor, i) in instructors" :key="i">
      <img src="../assets/logo.png">
      <p class="posted-instructor--title">
        <router-link :to="`/instructors/${instructor.id}`">{{ instructor.title }}</router-link>
      </p>
      <p class="posted-instructor--detail">
        {{ instructor.details }}
      </p>
      <div class="mentors-card--user">
        <div class="posted-instructor--user--img">
          <img src="../assets/logo.png">
        </div>
        <p class="posted-instructor--user--name">
          <router-link :to="`/users/${instructor.user_id}`">{{ instructor.user_name }}</router-link>
        </p>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  props: {
    instructorsProp: {}
  },
  data() {
    return {
      instructors: this.instructorsProp
    }
  }
}
</script>

<style lang="scss" scoped>
.instructors-container {
  display: flex;
  justify-content: flex-start;
  flex-wrap: wrap;
  .posted-instructor {
    width: 240px;
    height: 350px;
    box-shadow: 10px 10px 10px rgba(70, 70, 70, 0.2);
    background: #FFF;
    margin: 20px;
    padding: 10px;
    img {
      display: block;
      width: 80%;
      margin: 0 auto;
      background: #333;
    }
    &--title {
      font-size: 20px;
      font-weight: bold;
      margin: 10px 0;
      a {
        text-decoration: none;
        color: #2c3e50;
      }
    }
    &--detail {
      font-size: 12px;
    }
    &--user {
      display: flex;
      justify-content: flex-start;
      margin: 10px 0;
      &--img {
        width: 20%;
      }
    }
  }
}
</style>