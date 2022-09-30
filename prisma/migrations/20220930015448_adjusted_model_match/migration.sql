-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Match" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "game" TEXT NOT NULL,
    "banner" TEXT,
    "gameid" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "date" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "hour" TEXT NOT NULL
);
INSERT INTO "new_Match" ("date", "description", "game", "gameid", "hour", "id") SELECT "date", "description", "game", "gameid", "hour", "id" FROM "Match";
DROP TABLE "Match";
ALTER TABLE "new_Match" RENAME TO "Match";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
