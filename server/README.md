## NODE EXPRESS MONGO-DB User Authentication And CRUD RESTFUL BACKNED

![Image of Codebook Inc](https://yt3.ggpht.com/a/AATXAJwCeZV8AMcRIyLOrJfWnJVhof9d5IUwUjRUKt6smuo=s900-c-k-c0x00ffffff-no-rj)

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
- SECRET (Application Secret to hash the password)

```sh
$ git clone https://github.com/nandymandy1/node-express-flutter-react-native-react-vue.git
$ mv node-express-flutter-react-native-react-vue auth-playlist && cd auth-playlist && cd server
$ npm i
$ npm run dev (For Development)
$ npm start (For Production)
```

#### API's

##### User Authentication API

- To Register a new user
`@URL: /api/users/register`
`@TYPE: POST`
`Content-Type: application/json`
```javascript
    @REQUEST JOSN DATA:{ 
        username: <String>, 
        password: <String>, 
        email: <Stirng>,
        name: <String>,
        source: <String>
    },
    @RESPONSE JSON DATA:{
        message: "Hurray! your account is created successfully. You are now ready to go.",
        token: "Bearer <token>"
    }
```

- To Authenticate an user
`@URL: /api/users/authenticate`
`@TYPE: POST`
`Content-Type: application/json`
```javascript
    @REQUEST JOSN DATA:{ 
        username: <String>, 
        password: <String>
    },
    @RESPONSE JSON DATA:{
        message: "Hurray! You are now logged in.",
        token: "Bearer <token>"
    }
```

- To GET Authenticated User's Profile
`@URL: /api/users/authenticate`
`@TYPE: GET`
`Authorization: <token>`
```javascript
    @RESPONSE JSON DATA:{
        "token": "Bearer <token>",
        "message": "Hurray! You are now logged in ."
    }
```

#### Image Uploader API

- To Upload an Image
`@URL: /api/images/upload-single`
`@TYPE: POST`
`Content-Type: multipart/form-data`
`Authorization: <token>`
```javascript
    @REQUEST FORM DATA:{ 
        postImage: [File]
    },
    @RESPONSE JSON DATA:{
        image_id: image_id, 
        urlPath: <Image Path String>
    }
```

- To delete an Image by ID
`@URL: /api/images/delete-image/<Image ID>`
`@TYPE: DELETE`
`Content-Type: application/json`
`Authorization: <token>`
```javascript
    @RESPONSE JSON DATA:{
        status: Boolean, 
        message: "Image deleted successfully."
    }
```

- To Get all the images uploaded by an user
`@URL: /api/images/media-manager`
`@TYPE: GET`
`Content-Type: application/json`
`Authorization: <token>`
```javascript
    @RESPONSE JSON DATA:{
        imagesList:[
            {
                _id: <Object ID>,
                urlPath: <URL String>
            },
            {
                _id: <Object ID>,
                urlPath: <URL String>
            },
        ],
        paginator:{
            imageCount:2,
            perPage:10,
            pageCount:1,
            currentPage:1,
            slNo:1,
            hasPrevPage:false,
            hasNextPage:false,
            prev:null,
            next:null
        }
    }
```

- To delete multiple images uploaded by an user
`@URL: /api/images/mass-delete-media`
`@TYPE: POST`
`Content-Type: application/json`
`Authorization: <token>`
```javascript
    @REQUEST JSON DATA:{
        image_ids:[
            <Object ID>
        ]
    },
    @RESPONSE JSON DATA:{
        status: Boolean, 
        message: "Images deleted successfully."
    }
```

#### Blog Post API

- To create a new Post
`@URL: /api/posts`
`@TYPE: POST`
`Content-Type: application/json`
`Authorization: <token>`
```javascript
    @REQUEST JOSN DATA:{ 
            title:<String>,
            content:<String>,
            imagePath:<Object_ID>,
            excerpt: <String> (Optional)
    },
    @RESPONSE JSON DATA:{
        status: Boolean,
        post:{
            _id:<ObjectID>,
            title:<String>,
            imagePath: {
                urlPath: <String>
                _id: <Object ID>
            },
            content:<String>,
            author:{
                username: <String>
                _id: <Object ID>
            },
            slug: <String>,
            excerpt:<String>,
            createdAt:<Timestamps>,
            updatedAt:<Timestamps>,
            __v:0
        },
        message:"Post created successfully."
    }
```

- To Get All posts with paginations
`@URL: /api/posts?page=1`
`@TYPE: GET`
`Content-Type: application/json`
```javascript
    @RESPONSE JSON DATA {
        postsList:[
            {
                _id: <Object ID>,
                title: <Stirng>,
                imagePath:{
                    _id: <Object ID>, 
                    urlPath: <URL String>
                },
                author:{
                    _id: <Object ID>,
                    username: <String>, 
                    name: <String>
                },
                slug: <Slug String>,
                excerpt: <String>,
                createdAt: <Timestamps>,
                updatedAt: <Timestamps>,
            },
            {
                _id: <Object ID>,
                title: <Stirng>,
                imagePath:{
                    _id: <Object ID>, 
                    urlPath: <URL String>
                },
                author:{
                    _id: <Object ID>,
                    username: <String>, 
                    name: <String>
                },
                slug: <Slug String>,
                excerpt: <String>,
                createdAt: <Timestamps>,
                updatedAt: <Timestamps>,
            }
        ],
        paginator:{
            postCount: 3,
            perPage: 10,
            pageCount: 1,
            currentPage: 1,
            slNo: 1,
            hasPrevPage: false,
            hasNextPage: false,
            prev: null,
            next: null
        }
    }
```

- To Get All posts with paginations by the authenticated user
`@URL: /api/posts/my-posts`
`@TYPE: GET`
`Content-Type: application/json`
`Authorization: <token>`
```javascript
    @RESPONSE JSON DATA {
        postsList:[
            {
                _id: <Object ID>,
                title: <Stirng>,
                imagePath:{
                    _id: <Object ID>, 
                    urlPath: <URL String>
                },
                author:{
                    _id: <Object ID>,
                    username: <String>, 
                    name: <String>
                },
                slug: <Slug String>,
                excerpt: <String>,
                createdAt: <Timestamps>,
                updatedAt: <Timestamps>,
            },
            {
                _id: <Object ID>,
                title: <Stirng>,
                imagePath:{
                    _id: <Object ID>, 
                    urlPath: <URL String>
                },
                author:{
                    _id: <Object ID>,
                    username: <String>, 
                    name: <String>
                },
                slug: <Slug String>,
                excerpt: <String>,
                createdAt: <Timestamps>,
                updatedAt: <Timestamps>,
            }
        ],
        paginator:{
            postCount: 3,
            perPage: 10,
            pageCount: 1,
            currentPage: 1,
            slNo: 1,
            hasPrevPage: false,
            hasNextPage: false,
            prev: null,
            next: null
        }
    }
```

- To get a single post by ID
`@URL: /api/posts?id=<Object ID>`
`@TYPE: GET`
`Content-Type: application/json`
```javascript
    @RESPONSE JSON DATA:{
        _id: <Object ID>,
        title: <Stirng>,
        imagePath:{
            _id: <Object ID>, 
            urlPath: <URL String>
        },
        author:{
            _id: <Object ID>,
            username: <String>, 
            name: <String>
        },
        content:<String>,
        slug: <Slug String>,
        excerpt: <String>,
        createdAt: <Timestamps>,
        updatedAt: <Timestamps>,
    }
```

- To get a single post by Slug
`@URL: /api/posts/:slug`
`@TYPE: GET`
`Content-Type: application/json`
```javascript
    @RESPONSE JSON DATA:{
        _id: <Object ID>,
        title: <Stirng>,
        imagePath:{
            _id: <Object ID>, 
            urlPath: <URL String>
        },
        author:{
            _id: <Object ID>,
            username: <String>, 
            name: <String>
        },
        content:<String>,
        slug: <Slug String>,
        excerpt: <String>,
        createdAt: <Timestamps>,
        updatedAt: <Timestamps>,
    }
```

- To update a post by id
`@URL: /api/posts/:id`
`@TYPE: PUT`
`Content-Type: application/json`
`Authorization: <token>`
```javascript
    @REQUEST JSON DATA:{
        title: <String>,
        content: <String>,
        imagePath:<Object_ID>,
        excerpt: <String> (Optional)
    }
    @RESPONSE JSON DATA:{
       post: {
            _id: <Object ID>,
            title: <Stirng>,
            imagePath:{
                _id: <Object ID>, 
                urlPath: <URL String>
            },
            author:{
                _id: <Object ID>,
                username: <String>, 
                name: <String>
            },
            content:<String>,
            slug: <Slug String>,
            excerpt: <String>,
            createdAt: <Timestamps>,
            updatedAt: <Timestamps>,
       },
       message: "Post is updated successfully.",
       status: <Boolean>
    }
```

- To update a post by id
`@URL: /api/posts/:id`
`@TYPE: DELETE`
`Content-Type: application/json`
`Authorization: <token>`
```javascript
    @REQUEST JSON DATA:{
        title: <String>,
        content: <String>,
        imagePath:<Object_ID>,
        excerpt: <String> (Optional)
    }
    @RESPONSE JSON DATA:{
       post: {
            _id: <Object ID>,
            title: <Stirng>,
            imagePath:{
                _id: <Object ID>, 
                urlPath: <URL String>
            },
            author:{
                _id: <Object ID>,
                username: <String>, 
                name: <String>
            },
            content:<String>,
            slug: <Slug String>,
            excerpt: <String>,
            createdAt: <Timestamps>,
            updatedAt: <Timestamps>,
       },
       message: "Post is updated successfully.",
       status: <Boolean>
    }
```

License
----

MIT
