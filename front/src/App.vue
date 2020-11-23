<template>
  <div id="nav">
    <Header></Header>
    <div class="main-flame">
      <router-view/>
    </div>
    <Footer></Footer>
  </div>
</template>

<script>
import Header from "@/components/Header.vue";
import Footer from "@/components/Footer.vue";
import "./assets/reset.css";

export default {
  components: {
    Header,
    Footer
  }
}
</script>

<style scoped, lang="scss">
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  color: #2c3e50;
}

.main-flame{
  width: 90%;
  margin: 0 auto;
}

#nav a.router-link-exact-active {
  color: #42b983;
}
</style>
