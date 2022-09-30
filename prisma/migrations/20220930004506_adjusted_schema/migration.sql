-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Match" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "title" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "date" DATETIME NOT NULL,
    "hour" TEXT NOT NULL,
    "gameId" TEXT NOT NULL
);
INSERT INTO "new_Match" ("date", "description", "gameId", "hour", "id", "title") SELECT "date", "description", "gameId", "hour", "id", "title" FROM "Match";
DROP TABLE "Match";
ALTER TABLE "new_Match" RENAME TO "Match";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
