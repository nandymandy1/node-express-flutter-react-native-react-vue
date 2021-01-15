import api from '@/service';
import { AuthState, AuthGetter, User } from './authInterface';

const state: AuthState = {
    user: null,
    auth: false,
    token: localStorage.getItem('token') || '',
};

const getters: AuthGetter = {
    user: (state): User => state.user,
    isAuth: (state): boolean => state.auth
};

const actions = {
    async loginAction({ commit }, user: any) {
        try {
            let { data } = await api.post('/users/authenticate', user);
            commit(data);
        } catch (err) {

        }
    },
    // async registerAction() { },
    // async logoutAction() { }
};
const mutations = {

};

export default {
    state,
    getters,
    actions,
    mutations,
    namespaced: true,
}