import { createStore } from 'vuex'

export default createStore({
  state: {
    userEmail: ""
  },
  mutations: {
    updateUser(state, user) {
      state.userEmail = user.userEmail;
    }
  },
  actions: {
    auth(context, user) {
      context.commit('updateUser', user);
    }
  },
  modules: {
  }
})
