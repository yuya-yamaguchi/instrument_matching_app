import { createRouter, createWebHistory } from 'vue-router'
import Home from '@/views/Home.vue'
import Signup from '@/views/Signup.vue'
import Signin from '@/views/Signin.vue'
// import NewBoard from '@/views/NewBoard.vue'
import InstructorNew from '@/views/instructor/New.vue'
import ShowBoard from '@/views/ShowBoard.vue'
import Mypage from '@/views/Mypage.vue'
import MypageProfile from '@/views/users/Profile.vue'
import UserShow from '@/views/users/Show.vue'

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
  // 掲示板詳細画面
  {
    path: '/boards/:id',
    name: 'ShowBoard',
    component: ShowBoard
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
  }
]

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes
})

export default router
