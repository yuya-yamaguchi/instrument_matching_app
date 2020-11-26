<template>
  <header>
    <router-link to="/" class="main-title">INST_APP</router-link>
    <div class="header-menus">
      <router-link to="/signup" class="header-menu">新規会員登録</router-link>
      <router-link to="/signin" class="header-menu">ログイン</router-link>
    </div>
  </header>
</template>

<script>

</script>

<style scoped, lang="scss">
header{
  width: 100%;
  height: 60px;
  background: #333;
  display: flex;
  justify-content: space-between;
  .main-title {
    text-align: left;
    line-height: 60px;
    padding: 0 20px;
    color: #FFF;
    font-size: 30px;
    text-decoration: none;
  }
  .header-menus {
    margin-right: 30px;
    display: flex;
    justify-content: flex-end;
    .header-menu {
      display: block;
      text-decoration: none;
      color:#FFF;
      font-size: 12px;
      font-weight: bold;
      background: #13b1c0;
      border: 1px solid;
      margin: 0 10px;
      margin-top: 15px;
      padding: 0 10px;
      border-radius: 5px;
      height: 30px;
      line-height: 30px;
    }
  }
}
</style>
