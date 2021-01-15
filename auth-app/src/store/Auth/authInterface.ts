import { AuthMutationTypes } from './types';

export interface User {
    id: string;
    name: string;
    email: string;
    username: string;
};

export interface AuthState {
    user: any;
    auth: boolean;
    token: string;
};

export interface AuthGetter {
    user(state: AuthState): User;
    isAuth(state: AuthState): boolean;
};

export interface AuthAction {

};

export type CounterMutationsTypes<S = AuthState> = {
    [AuthMutationTypes.LOGIN_USER](state: S, payload: any): void;
    [AuthMutationTypes.LOGOUT_USER](state: S): void;
};