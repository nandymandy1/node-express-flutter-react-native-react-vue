import { config } from 'dotenv';
config();

export const DB = process.env.DB;
export const PORT = process.env.PORT;
export const SECRET = process.env.SECRET;
export const baseURL = process.env.BASEURL;