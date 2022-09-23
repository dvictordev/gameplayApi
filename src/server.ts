import express from "express";
import { PrismaClient } from "@prisma/client";
import axios from "axios";
const app = express();
app.use(express.json());
const port = 3333;

const baseUrl =
  "http://api.rawg.io/api/games?key=ef41b85e101b4d21aad1b7b11b09923e&page_size=20";

// 12ae9276-2d07-442d-ac60-08891cfe69f8
// 45abaf3b-4f65-4d7d-b66d-7154e3724bf3"

const prisma = new PrismaClient({
  log: ["query"],
});

app.get("/games", async (req, res) => {
  const games = await prisma.game.findMany();

  res.send(games);
});

app.get("/game/:id/games", async (req, res) => {
  const gameId = req.params.id;
  const game = await prisma.game.findUnique({
    where: {
      id: gameId,
    },
  });

  res.send(game);
});

app.listen(port, () => {
  console.log(`http://localhost:${port}`);
});
