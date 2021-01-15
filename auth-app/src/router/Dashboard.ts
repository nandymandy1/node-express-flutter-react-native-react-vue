import Dashboard from '@/views/dashboard/index.vue';

export default {
    name: 'Dashboard',
    path: '/dashboard',
    component: Dashboard,
    redirect: '/dashboard/user',
    children: [
        {
            path: 'user',
            name: "userHome",
            component: () => import('@/views/dashboard/Home.vue')
        },
        {
            path: 'profile',
            name: "userProfile",
            component: () => import('@/views/dashboard/Profile.vue')
        }
    ]
};