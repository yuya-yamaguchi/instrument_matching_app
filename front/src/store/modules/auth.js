const state = {
  email:  '',
  token:  '',
  uid:    '',
  client: ''
};

const getters = {
  email:  state => state.email,
  token:  state => state.token,
  uid:    state => state.uid,
  client: state => state.client
}

const mutations = {
  // login (state, payload) {
  //   state.token = payload;
  // },
  logout (state) {
    state.email  = null;
    state.token  = null;
    state.uid    = null;
    state.client = null;
  },
  updateUser(state, user) {
    state.email  = user.email;
    state.token  = user.token;
    state.uid    = user.uid;
    state.client = user.client;
  }
}

const actions = {
  updateUser(context, user) {
    context.commit('updateUser', user);
  },
  logout(context) {
    context.commit('logout');
  }
}

export default {
  // namespaced: true,
  state,
  getters,
  mutations,
  actions
};