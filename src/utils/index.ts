import express, { Application } from "express"
import { logError, logRequest } from "../middlewares/events"
import routes from "../routes"

function CreateServer() {
    const app: Application = express()

    app.use(logRequest)

    app.use(express.json())
    app.use(express.urlencoded({ extended: false }))

    routes(app)

    app.use(logError)

    return app
}

export default CreateServer