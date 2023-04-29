import { Application, Request, Response, Router } from "express";
import { OK } from "http-status";
import { Users } from "./controller/user.controller";

function routes(app: Application) {
    app.get('/', (req: Request, res: Response) => {
        res.status(OK)
    })
    app.route('/user')
        .get(Users.getAll)
        .post(Users.create)
}

export default routes;