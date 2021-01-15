import axios from 'axios';
import { baseURL } from '../constants';

const api = axios.create({
    baseURL
});

export const setToken = (token: any) => {
    if (token) {
        api.defaults.headers['Authorization'] = token;
    } else {
        delete api.defaults.headers['Authorization'];
    }
}

export default api;