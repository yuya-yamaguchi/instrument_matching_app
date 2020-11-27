import { createRouter, createWebHistory } from 'vue-router'
import Home from '@/views/Home.vue'
import Signup from '@/views/Signup.vue'
import Signin from '@/views/Signin.vue'
import NewBoard from '@/views/NewBoard.vue'
import ShowBoard from '@/views/ShowBoard.vue'

const routes = [
  {
    path: '/',
    name: 'Home',
    component: Home
  },
  {
    path: '/signup',
    name: 'Signup',
    component: Signup
  },
  {
    path: '/signin',
    name: 'Signin',
    component: Signin
  },
  {
    path: '/newboard',
    name: 'NewBoard',
    component: NewBoard
  },
  {
    path: '/boards/:id',
    name: 'ShowBoard',
    component: ShowBoard
  }
]

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes
})

export default router
