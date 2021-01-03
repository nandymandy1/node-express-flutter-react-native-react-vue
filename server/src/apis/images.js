import { forEach } from 'lodash';
import { unlinkSync } from 'fs';
import { Router } from 'express';
import { Image } from '../models';
import { baseURL } from '../config';
import { userAuth } from '../helpers/auth';
import uploader from '../middlewares/uploader';
import { RES_EXCEPTION } from '../helpers/exceptions';

const router = Router();

const imagePaginator = {
    prevPage: 'prev',
    limit: 'perPage',
    nextPage: 'next',
    meta: 'paginator',
    docs: 'imagesList',
    page: 'currentPage',
    pagingCounter: 'slNo',
    totalDocs: 'imageCount',
    totalPages: 'pageCount',
};

router.post('/upload-single',
    userAuth,
    uploader.single('postImage'),
    async (req, res) => {
        try {
            let originalPath = req.file.path;
            let urlPath = baseURL + req.file.path.split('uploads/')[1];

            let image = new Image({
                urlPath,
                originalPath,
                owner: req.user._id
            });

            let result = await image.save();
            return res
                .status(200)
                .json({ image_id: result._id, urlPath });
        } catch (err) {
            return res
                .status(400)
                .json({
                    status: false,
                    message: 'Unable to upload the image please try again.',
                })
        }
    });

router.delete('/delete-image/:id',
    userAuth,
    async (req, res) => {
        try {
            let { id } = req.params;
            let image = await Image.findByIdAndRemove(id);
            if (!image) {
                throw new RES_EXCEPTION('Image file not found.', 404);
            }
            await deleteImage(image.originalPath);
            return res
                .status(200)
                .json({
                    status: true,
                    message: 'Image deleted successfully.',
                });
        } catch (err) {
            return res
                .status(err.status)
                .json({
                    status: false,
                    message: err.message,
                });
        }
    });

router.get('/media-manager',
    userAuth,
    async (req, res) => {
        let { page } = req.query;
        const options = {
            limit: 10,
            select: 'urlPath',
            sort: { updatedAt: -1 },
            customLabels: imagePaginator,
            page: page ? Number(page) : 1,
        };

        let data = await Image.paginate({ owner: req.user._id.toString() }, options);
        return res.status(200).json(data);
    });

router.post('/mass-delete-media',
    userAuth,
    async (req, res) => {
        try {
            let { image_ids } = req.body;
            if (!image_ids.length) {
                throw new RES_EXCEPTION('You have not selected any image.', 400);
            }
            await forEach(image_ids, async id => {
                let image = await Image.findByIdAndDelete(id);
                await deleteImage(image.originalPath);
            });
            return res.status(200).json({
                status: true,
                message: "Images deleted successfully.",
            });
        } catch (err) {
            console.log(err);
            return res
                .status(err.status)
                .json({
                    status: false,
                    message: err.message,
                });
        }
    });

const deleteImage = async (filePath) => {
    try {
        await unlinkSync(filePath);
        return;
    } catch (err) {
        throw err;
    }
}

const isAccessibleToUser = async (user_id, image_id) => {
    // let image = 
}

export default router;