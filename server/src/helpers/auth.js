import _ from 'lodash';
import passport from "passport";
import { SECRET } from '../config';
import { sign } from 'jsonwebtoken';

export const userAuth =
    passport.authenticate("jwt", { session: false });

export const serializeUser = (user) =>
    _.pick(user.toObject(), ['username', 'email', 'name', '_id']);

export const issueToken = async (user) =>
    await sign(serializeUser(user), SECRET, { expiresIn: '2 days' });
