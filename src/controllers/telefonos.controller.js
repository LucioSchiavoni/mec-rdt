import prisma from "../config/db.js";
import dotenv from 'dotenv'
dotenv.config()


export const createTelefono = async (req, res) => {

    const  {ip, unidad, usuario, rack, boca, anterior, estado,piso, area , lugar, ter,ue} = req.body;



    try {
        const existTelefono = await prisma.telefonos.findUnique({
            where:{
                ip:ip
            }
        })
        if (existTelefono) {
        return res.json({ error: 'Telefono ya existe' });
        }   

        const newTelefono = await prisma.telefonos.create({
            data:{
                ip:ip,
                unidad:unidad,
                usuario:usuario,
                rack:rack,
                boca:boca,
                anterior:anterior,
                estado:estado,
                piso: parseInt(piso),
                area:area,
                internos:{
                    create:{
                        lugar: lugar ? parseInt(lugar) : null,
                        ter: ter ? parseInt(ter) : null,
                        ue: ue ? parseInt(ue) : null,
                    }
                }
            }
        })
        return res.json({success: "Telefono creado exitosamente", newTelefono})
    } catch (error) {
        console.log(error)
    }
}


export const getTelefonos = async(req,res) => {    
    try {
        const telefonos = await prisma.telefonos.findMany();
        return res.json(telefonos)
    } catch (error) {
        console.log(error)
    }

}


