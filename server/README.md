#### NODE EXPRESS MONGO-DB User Authentication Aand CRUD RESTFUL BACKNED

This backend is build using mongoDB Node Express for the CRUD Operations. Packages used in this backend are as follows

  - Mongoose
  - Express.js
  - Passport
  - Jsonwebtoken
  - Bcrypt.js
  - Mongoose Paginate v2
  - Multer
  - Passport-jwt
  - ESM
  - Lodash

#### PACKAGE ENVIRONMENT SETUP

##### Set Environment Variables in the .dotenv file
- PORT (Port on which applciation will run eg. 5000)
- DB (MongoDB localhost URI or Mongodb cluster URI to connect with dat)
- BASEURL (Base Url of the server or Domain)
- SECRET (Application Secret to set the password)

```sh
$ git clone https://github.com/nandymandy1/node-express-flutter-react-native-react-vue.git
$ mv node-express-flutter-react-native-react-vue auth-playlist && cd auth-playlist && cd server
$ npm i
$ npm run dev (For Development)
$ npm start (For Production)
```

#### API's

- To Register a new user
`@URL: /api/users/register`
`Content-Type: application/json`
```javascript
    @REQUEST JOSN DATA:{ 
        username: <String>, 
        password: <String>, 
        email: <Stirng>,
        name: <String>,
        source: <String>
    }
    @RESPONSE JSON DATA:{
        message: "Hurray! your account is created successfully. You are now ready to go.",
        token: "Bearer <token>"
    }
```

- To Authenticate an user
`@URL: /api/users/authenticate`
`Content-Type: application/json`
```javascript
    @REQUEST JOSN DATA:{ 
        username: <String>, 
        password: <String>
    }
    @RESPONSE JSON DATA:{
        message: "Hurray! You are now logged in.",
        token: "Bearer <token>"
    }
```

License
----

MIT
