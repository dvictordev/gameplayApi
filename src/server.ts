import express from "express";
import { PrismaClient } from "@prisma/client";
import { request } from "http";

const app = express();
app.use(express.json());
const port = 3333;

const baseUrl = "http://api.rawg.io/api/games?key=API_KEY";

const prisma = new PrismaClient({
  log: ["query"],
});

app.listen(port, () => {
  console.log(`http://localhost:${port}`);
});
