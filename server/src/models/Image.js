import { Schema, model } from 'mongoose';
import Paginator from 'mongoose-paginate-v2';

const ImageSchema = new Schema({
    originalPath: {
        type: String,
        required: true
    },
    urlPath: {
        type: String,
        required: true
    },
    owner: {
        ref: 'users',
        type: Schema.Types.ObjectId,
    }
}, {
    timestamps: true
});

ImageSchema.plugin(Paginator);

const Image = model('images', ImageSchema);

export default Image;