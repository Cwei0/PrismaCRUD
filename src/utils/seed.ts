import { exit } from "process";
import { db } from "../config/Connectdb";
import { log } from "./logger";

const main = async () => { };

main()
    .catch((e) => log.fatal(e))
    .finally(async () => {
        await db.$disconnect();
        exit(1)
    })


//Use this files to test your queries before putting them into a controller or service