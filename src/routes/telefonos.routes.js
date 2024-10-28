import { Router } from "express";
import { createTelefono, getTelefonos } from "../controllers/telefonos.controller.js";


const telefonosRouter = Router();


telefonosRouter.post("/create", createTelefono)
telefonosRouter.get("/telefonos", getTelefonos)



export default telefonosRouter;