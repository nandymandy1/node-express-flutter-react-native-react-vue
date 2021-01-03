import { check } from "express-validator";

const name = check("name", "Name is required").not().isEmpty();
const email = check("email", "Please enter a valid email").isEmail();
const source = check("source", "Client key is missing.").not().isEmpty();
const username = check("username", "Username is required").not().isEmpty();
const password = check("password", "Password must contain atleast six characters").isLength({
    min: 6,
});

export const RegisterUserValidator = [
    name,
    email,
    source,
    username,
    password,
];

export const LoginUserValidator = [
    username,
    password
];