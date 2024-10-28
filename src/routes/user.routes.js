import { Router } from "express";
import { loginService, authService, registerService, getUsers } from "../controllers/user.controller.js";



const userRouter = Router()


userRouter.post("/login", loginService)
userRouter.get("/auth", authService)
userRouter.post("/register", registerService)
userRouter.get("/user", getUsers)


export default userRouter;