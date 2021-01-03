import { Schema, model } from 'mongoose';
import Paginator from 'mongoose-paginate-v2';

const PostSchema = new Schema({
    title: {
        type: String,
        required: true
    },
    slug: {
        type: String,
        required: true
    },
    content: {
        type: String,
        required: true
    },
    author: {
        ref: 'users',
        type: Schema.Types.ObjectId,
    },
    imagePath: {
        ref: 'images',
        type: Schema.Types.ObjectId,
    },
    excerpt: {
        type: String,
        required: true
    }
}, {
    timestamps: true
});

PostSchema.plugin(Paginator);

const Post = model('posts', PostSchema);
export default Post;