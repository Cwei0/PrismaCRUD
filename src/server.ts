import { env } from "process";
import { log } from "./utils/logger";
import CreateServer from "./utils";

const Port = env.PORT

const app = CreateServer()

app.listen(Port, () => {
    log.info(`Server running on ${Port}`)
})