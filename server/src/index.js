import cors from 'cors';
import { join } from 'path';
import express from 'express';
import mongoose from 'mongoose';
import passport from 'passport';
import { json } from 'body-parser';
import { DB, PORT } from './config';
import { success, error } from 'consola';

const app = express();

// API Routes Imports
import userApis from './apis/users';
import postApis from './apis/posts';
import imageApis from './apis/images';

require("./middlewares/auth-middleware");

// Apply Middlewares
app.use(
    json()
);
app.use(
    cors()
);
app.use(
    passport.initialize()
);
app.use(
    express.static(
        join(__dirname, './uploads')
    )
);

app.use('/api/users', userApis);
app.use('/api/posts', postApis);
app.use('/api/images', imageApis);


const startApp = async () => {
    try {
        await mongoose.connect(DB, {
            useNewUrlParser: true,
            useFindAndModify: false,
            useUnifiedTopology: true,
        });
        success(`DATABASE CONNECTED SUCCESSFULLY.`);
        app.listen(PORT, () => success(`SERVER STARTED ON PORT ${PORT}`));
    } catch (err) {
        error(`UNABLE TO START SERVER ${err.message}`);
    }
}

startApp();