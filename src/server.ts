import express from "express";
import { PrismaClient } from "@prisma/client";
const app = express();
app.use(express.json());
const port = 3333;



const prisma = new PrismaClient({
  log: ["query"],
});

app.listen(port, () => {
  console.log(`http://localhost:${port}`);
});


app.get('/games', async  (req, res)=>{
  const games = await prisma.game.findMany()

  res.send(games)
})

app.get('/user/:id/matchs', async (req,res)=>{
  const userId = req.params.id
  const matchs = await prisma.match.findMany()
  

  res.json(matchs)
})

app.get('/game/:id', async (req,res)=>{
  const gameId = req.params.id
  const game = await prisma.game.findUnique({where:{
    id:gameId
  }})

  res.send(game)
})





