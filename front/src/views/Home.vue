<template>
  <div class="home">
    <div class="home-head">
      <p>いつでも相談できる<br>メンターを見つけよう</p>
    </div>
    <div class="app-explain">
      <p>楽器を「教えたい人」と「やりたい人」を繋ぐプラットフォーム</p>
    </div>
    <Instruments></Instruments>
  </div>
</template>

<script>
import Instruments from "@/components/Instruments.vue";

export default {
  components: {
    Instruments
  }
}
</script>

<style scoped, lang="scss">

.home-head {
  font-size: 40px;
  padding: 60px 0;
}

.app-explain {
  font-size: 30px;
  font-weight: bold;
  padding: 60px 0;
}
</style>