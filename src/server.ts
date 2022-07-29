import express from 'express'

const app: express.Application = express()

app.get("/", (req: express.Request, res: express.Response) => {
    res.send("Hello from our node container!")
})

app.listen(80, () => "Listening on port 80")

