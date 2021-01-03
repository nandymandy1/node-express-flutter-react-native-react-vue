import { check } from "express-validator";

const title = check("title", "Post Title is required.").not().isEmpty();
const content = check("content", "Post Content is required.").not().isEmpty();

export const PostValidator = [
    title,
    content
];
