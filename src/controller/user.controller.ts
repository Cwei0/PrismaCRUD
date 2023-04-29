import { Request, Response } from "express";
import { db } from "../config/Connectdb";
import { User } from "@prisma/client";
import { CREATED } from "http-status";

export const Users = {
    async getAll(req: Request, res: Response) {
        const users: User[] = await db.user.findMany();
        return res.json(users).status(200)
    },
    async create(req: Request, res: Response) {
        const { firstname, lastname } = req.body
        const user: User = await db.user.create({
            data: {
                firstName: firstname,
                lastName: lastname
            }
        })
        return res.json({ "User successfully created": user }).status(CREATED)
    }
}

//Find user by id and delete user