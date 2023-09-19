import express from 'express'
import authController from '../controllers/auth.js'
import verifyJWT from '../utils/index.js';


const router = express.Router();


router.get("/", (req, res) => {
    res.send("Hello World Back")
});

router.get("/index", verifyJWT,  authController.index);

router.post("auth/signup", authController.create);
router.post("auth/singin", authController.signin);

export default router;