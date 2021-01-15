import Auth from '@/views/auth/index.vue';

export default {
    name: 'Auth',
    path: '/auth',
    component: Auth,
    redirect: '/auth/login',
    children: [
        {
            path: 'login',
            name: "Login",
            component: () => import('@/views/auth/Login.vue')
        },
        {
            path: 'register',
            name: "Register",
            component: () => import('@/views/auth/Register.vue')
        }
    ]
};