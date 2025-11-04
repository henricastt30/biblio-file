import express from "express";
import cors from "cors";
import mysql from "mysql2/promise";
const pool = await mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "senai",
  database: "biblio_file",
});

const app = express();
app.use(express.json());
app.use(cors());

app.post("/user", async (req, res) => {
    try {
        const { body } = req;
        const [results] = await pool.query(
            `
            INSERT INTO users (nome, email, senha) VALUE(?, ?, ?)
            `, 
            [body.nome, body.email, body.senha]
        )
        res.send("Ok!")
    }
    catch (error) {
        console.log(error)
    }
})

app.get("/users", async (req, res) => {
    try {
        const [results] = await pool.query(
            `
            SELECT * FROM users
            `
        )
        res.send(results)
    }
    catch (error) {
        console.log(error)
    }
})

app.get("/user/:id", async (req, res) => {
    try {
        const { id } = req.params;
        const [results] = await pool.query(
            `
            SELECT * FROM users WHERE id_user = ?;
            `,
            id
        )
        res.send(results)
    }
    catch (error) {
        console.log(error)
    }
})

app.listen(3000, () => {
    console.log(`Servidor rodando na porta: http://localhost:3000`);
});