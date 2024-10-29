import express from 'express';
import cors from 'cors';
import telefonosRouter from './src/routes/telefonos.routes.js';
import userRouter from './src/routes/user.routes.js';
import dotenv from 'dotenv';
dotenv.config();


const app = express();


const PORT = process.env.PORT || 3001;


const opcionesCors = {
    origin: process.env.FRONTEND_URL,
    credentials: true
}


app.use(cors(opcionesCors));
app.use(express.json());
app.use("/", telefonosRouter)
app.use("/", userRouter)


app.get("/", (req,res) => {
    res.json("Index")

})


app.listen(PORT, () => {
    console.log(`Servidor corriendo en http://localhost:${PORT}`)
})