import { createRouter, createWebHistory } from 'vue-router'
import Home from '@/views/Home.vue'
import Signup from '@/views/Signup.vue'
import Signin from '@/views/Signin.vue'
// import NewBoard from '@/views/NewBoard.vue'
import InstructorNew from '@/views/instructor/New.vue'
// import ShowBoard from '@/views/ShowBoard.vue'
import InstructorShow from '@/views/instructor/Show.vue'
import Mypage from '@/views/Mypage.vue'
import MypageProfile from '@/views/users/Profile.vue'
import UserShow from '@/views/users/Show.vue'
import DirectIndex from '@/views/direct/Index.vue'
import DirectShow from '@/views/direct/Show.vue'

const routes = [
  // ホーム画面
  {
    path: '/',
    name: 'Home',
    component: Home
  },
  // 新規会員登録画面
  {
    path: '/signup',
    name: 'Signup',
    component: Signup
  },
  // ログイン画面
  {
    path: '/signin',
    name: 'Signin',
    component: Signin
  },
  // 講師登録画面
  {
    path: '/instructor/new',
    name: 'InstructorNew',
    component: InstructorNew
  },
  // 講師詳細画面
  {
    path: '/instructors/:id',
    name: 'InstructorShow',
    component: InstructorShow
  },
  {
  // マイページ
    path: '/mypage',
    name: 'Mypage',
    component: Mypage
  },
  {
  // マイページプロフィール編集
    path: '/mypage/profile',
    name: 'MypageProfile',
    component: MypageProfile
  },
  // ユーザ詳細画面
  {
    path: '/users/:id',
    name: 'User',
    component: UserShow,
  },
  // メッセージ一覧
  {
    path: '/mypage/direct',
    name: 'DirectIndex',
    component: DirectIndex,
  },
  // メッセージ詳細
  {
    path: '/mypage/direct/:id',
    name: 'DirectShow',
    component: DirectShow,
  }
]

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes
})

export default router
