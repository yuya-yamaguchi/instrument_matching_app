import { createStore } from 'vuex'
import createPersistedState from 'vuex-persistedstate'
import auth from './modules/auth'

export default createStore({
  modules: {
    auth
  },
  // strict: true,
  plugins: [createPersistedState({
    key: 'UserInfo',
    paths: ['auth'],
    storage: window.sessionStorage
  })]
})
