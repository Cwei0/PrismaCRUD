import pino from "pino";

export const log = pino({
    transport: {
        target: "pino-pretty",
        options: {
            translateTime: true,
            ignore: "pid,hostname"
        }
    }
})