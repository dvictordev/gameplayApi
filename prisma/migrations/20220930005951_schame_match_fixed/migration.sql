/*
  Warnings:

  - You are about to drop the column `gameId` on the `Match` table. All the data in the column will be lost.
  - You are about to drop the column `title` on the `Match` table. All the data in the column will be lost.
  - Added the required column `game` to the `Match` table without a default value. This is not possible if the table is not empty.
  - Added the required column `gameid` to the `Match` table without a default value. This is not possible if the table is not empty.

*/
-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Match" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "game" TEXT NOT NULL,
    "gameid" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "date" DATETIME NOT NULL,
    "hour" TEXT NOT NULL
);
INSERT INTO "new_Match" ("date", "description", "hour", "id") SELECT "date", "description", "hour", "id" FROM "Match";
DROP TABLE "Match";
ALTER TABLE "new_Match" RENAME TO "Match";
CREATE TABLE "new_User" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "name" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "matchId" TEXT,
    CONSTRAINT "User_matchId_fkey" FOREIGN KEY ("matchId") REFERENCES "Match" ("id") ON DELETE SET NULL ON UPDATE CASCADE
);
INSERT INTO "new_User" ("email", "id", "name") SELECT "email", "id", "name" FROM "User";
DROP TABLE "User";
ALTER TABLE "new_User" RENAME TO "User";
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
