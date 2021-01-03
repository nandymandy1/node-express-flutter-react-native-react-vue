import { Router } from 'express';
import { User } from '../models';
import { hash, compare } from 'bcryptjs';
import { validationResult } from "express-validator";
import { RES_EXCEPTION } from '../helpers/exceptions';
import { issueToken, userAuth, serializeUser } from '../helpers/auth';
import { RegisterUserValidator, LoginUserValidator } from '../validators';

const router = Router();

router.post('/register', RegisterUserValidator, async (req, res) => {
    try {
        const errors = validationResult(req);
        if (!errors.isEmpty()) {
            throw new RES_EXCEPTION(errors, 400)
        }

        let { username, email, password } = req.body;
        let user = await User.findOne({ username });
        if (user) {
            throw new RES_EXCEPTION(
                'Username already taken. Please try with some different username.',
                403
            );
        }
        user = await User.findOne({ email });
        if (user) {
            throw new RES_EXCEPTION(
                'Email is already registered. Did you forget your password. Please try resetting it.',
                403
            );
        }
        user = new User(req.body);
        user.password = await hash(password, 10);
        let result = await user.save();
        let token = await issueToken(result);
        return res
            .status(202)
            .json({
                token: `Bearer ${token}`,
                message: 'Hurray! your account is created successfully. You are now ready to go.'
            });
    } catch (err) {
        console.log(err);
        return res
            .status(err.status)
            .json({
                message: err.message
            });
    }
});

router.post('/authenticate', LoginUserValidator, async (req, res) => {
    try {
        const errors = validationResult(req);
        if (!errors.isEmpty()) {
            throw new RES_EXCEPTION(errors, 400)
        }

        let { username, password } = req.body;
        let user = await User.findOne({ username });
        if (!user) {
            throw new RES_EXCEPTION(
                'Username not found.',
                404
            );
        }
        let isMatch = await compare(password, user.password);
        if (!isMatch) {
            throw new RES_EXCEPTION(
                'Incorrect password.',
                404
            );
        }
        let token = await issueToken(user);
        return res
            .status(202)
            .json({
                token: `Bearer ${token}`,
                message: 'Hurray! You are now logged in.'
            });
    } catch (err) {
        return res
            .status(err.status)
            .json({
                message: err.message
            });
    }
});

router.get('/authenticate', userAuth, async (req, res) =>
    res.status(200).json(serializeUser(req.user))
);

export default router;