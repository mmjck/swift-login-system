import express from 'express'
import authController from '../controllers/auth.js'
import verifyJWT from '../utils/index.js';


const router = express.Router();


router.get("/", (req, res) => {
    res.send("Hello World Back")
});

router.get("/index", verifyJWT,  authController.index);

router.post("/signup", authController.create);
router.post("/singin", authController.signin);

export default router;