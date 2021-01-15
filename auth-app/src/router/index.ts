import { createRouter, createWebHistory, RouteRecordRaw } from 'vue-router';
import DashboardRoutes from './Dashboard';
import PublicRoutes from './Public';
import AuthRoutes from './Auth';

const routes: Array<RouteRecordRaw> = [
  ...PublicRoutes,
  AuthRoutes,
  DashboardRoutes
]
const router = createRouter({
  routes,
  history: createWebHistory(process.env.BASE_URL)
})

export default router
