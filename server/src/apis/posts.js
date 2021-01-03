import mongoose from 'mongoose';
import { Router } from 'express';
import { Post } from '../models';
import { userAuth } from '../helpers/auth';
import { PostValidator } from '../validators';
import { validationResult } from "express-validator";
import { RES_EXCEPTION } from '../helpers/exceptions';
import { generateSlug, createExcerpt } from '../helpers/slug-generator';

const router = Router();

const postPaginator = {
    prevPage: 'prev',
    limit: 'perPage',
    nextPage: 'next',
    meta: 'paginator',
    docs: 'postsList',
    page: 'currentPage',
    pagingCounter: 'slNo',
    totalDocs: 'postCount',
    totalPages: 'pageCount',
};

const accessCheck = async (req, res, next) => {
    let { id } = req.params;
    let { _id } = req.user;
    let post = await Post
        .findOne({
            _id: id,
            author: _id.toString()
        });
    if (!post) {
        return res
            .status(401)
            .json({
                status: false,
                message: `Post doen't belongs to you.`,
            });
    }
    next();
}

router.post('/', userAuth, PostValidator, async (req, res) => {
    try {
        const errors = validationResult(req);
        if (!errors.isEmpty()) {
            throw new RES_EXCEPTION(errors, 400)
        }

        let post = new Post({
            ...req.body,
            author: req.user._id,
            slug: generateSlug(req.body.title),
            excerpt: req.body.excerpt || createExcerpt(req.body.content),
        });

        let result = await post.save();
        result = await result
            .populate('imagePath', 'urlPath')
            .populate('author', 'name username')
            .execPopulate();

        return res
            .status(202)
            .json({
                status: true,
                post: result.toObject(),
                message: 'Post created successfully.',
            });
    } catch (err) {
        return res
            .status(400)
            .json({
                status: false,
                message: ' Unable to create your post please try again later.',
            });
    }
});

router.get('/my-posts', userAuth, async (req, res) => {
    let { page } = req.query;
    const options = {
        limit: 10,
        page: page || 1,
        sort: { updatedAt: -1 },
        customLabels: postPaginator,
        populate: [
            { path: 'imagePath', select: 'urlPath' }
        ],
        select: 'title updatedAt createdAt excerpt slug',
    };
    let data = await Post.paginate({ author: req.user._id }, options);
    return res
        .status(200)
        .json(data);
});

router.get('/', async (req, res) => {
    try {
        let data;
        let { id, page } = req.query;
        if (id && !page) {
            if (!mongoose.Types.ObjectId.isValid(id)) {
                throw new RES_EXCEPTION("Invalid post id", 400);
            }
            data = await Post.findById(id);
            if (!data) {
                throw new RES_EXCEPTION('Post not found.', 404);
            }
        } else if (page && !id) {
            const options = {
                limit: 10,
                sort: { updatedAt: -1 },
                customLabels: postPaginator,
                page: page ? Number(page) : 1,
                populate: [
                    { path: 'imagePath', select: 'urlPath' },
                    { path: 'author', select: 'username name' }
                ],
                select: 'title updatedAt createdAt author excerpt slug imagePath',
            };

            data = await Post.paginate({}, options);
        } else {
            throw new RES_EXCEPTION('Invalid Api Request, ID of the post or page number is required.', 400);
        }
        return res
            .status(200)
            .json(data);
    } catch (err) {
        return res
            .status(err.status)
            .json({
                status: false,
                message: err.message
            });
    }
});

router.get('/:slug', async (req, res) => {
    try {
        let { slug } = req.params;
        let data = await Post
            .findOne({ slug })
            .populate(
                [
                    { path: 'imagePath', select: 'urlPath' },
                    { path: 'author', select: 'username name' }
                ]
            );

        if (!data) {
            throw new RES_EXCEPTION('Post not found.', 404);
        }

        return res
            .status(200)
            .json(data);
    } catch (err) {
        return res
            .status(err.status)
            .json({
                status: false,
                message: err.message
            });
    }
});

router.put('/:id', userAuth, PostValidator, accessCheck, async (req, res) => {
    try {
        const errors = validationResult(req);
        if (!errors.isEmpty()) {
            throw new RES_EXCEPTION(errors, 400)
        }
        let { id } = req.params;
        let result = await Post.findByIdAndUpdate(
            id,
            { ...req.body },
            { new: true }
        );
        return res
            .status(200)
            .json({
                post: result,
                status: true,
                message: "Post is updated successfully.",
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

router.delete('/:id', userAuth, accessCheck, async (req, res) => {
    try {
        let { id } = req.params;
        await Post.findByIdAndDelete(id);
        return res
            .status(200)
            .json({
                status: true,
                message: "Post is deleted successfully.",
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

export default router;