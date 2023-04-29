import express, { Application } from "express"
import { logError, logRequest } from "../middlewares/events"

function CreateServer() {
    const app: Application = express()

    app.use(logRequest)


    app.use(logError)

    return app
}

export default CreateServer