-- CreateTable
CREATE TABLE "User" (
    "userId" TEXT NOT NULL PRIMARY KEY,
    "userPassword" TEXT NOT NULL,
    "userName" TEXT NOT NULL,
    "userAbout" TEXT NOT NULL,
    "userDiscord" TEXT NOT NULL,
    "userCampaignAccess" INTEGER NOT NULL,
    "userBorderIcon" TEXT NOT NULL,
    "userCreatedAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- CreateTable
CREATE TABLE "CharacterSheet" (
    "characterId" TEXT NOT NULL PRIMARY KEY,
    "characterOwner" TEXT NOT NULL,
    "characterCreatedAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "characterName" TEXT NOT NULL,
    "characterIcon" TEXT NOT NULL,
    "characterLvL" INTEGER NOT NULL,
    "characterXp" INTEGER NOT NULL,
    CONSTRAINT "CharacterSheet_characterOwner_fkey" FOREIGN KEY ("characterOwner") REFERENCES "User" ("userId") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "CharacterDescription" (
    "descriptionId" TEXT NOT NULL PRIMARY KEY,
    "descriptionOwner" TEXT NOT NULL,
    "characterRace" TEXT NOT NULL,
    "characterClass" TEXT NOT NULL,
    "characterTitle" TEXT NOT NULL,
    "characterOccupation" TEXT NOT NULL,
    "characterHistory" TEXT NOT NULL,
    "characterAlign" INTEGER NOT NULL,
    "characterArmor" INTEGER NOT NULL,
    "characterWalking" REAL NOT NULL,
    "characterDisadvantages" TEXT NOT NULL,
    "characterAdvantages" TEXT NOT NULL,
    CONSTRAINT "CharacterDescription_descriptionOwner_fkey" FOREIGN KEY ("descriptionOwner") REFERENCES "CharacterSheet" ("characterId") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "CharacterItem" (
    "itemId" TEXT NOT NULL PRIMARY KEY,
    "itemOwner" TEXT NOT NULL,
    "itemName" TEXT NOT NULL,
    "itemDescription" TEXT NOT NULL,
    "itemOrigin" TEXT,
    "itemMagicOrigin" TEXT,
    "itemWeight" REAL NOT NULL,
    "itemSize" REAL NOT NULL,
    "itemType" TEXT,
    "itemEffect" TEXT NOT NULL,
    "itemArmor" INTEGER,
    "itemDmg" REAL NOT NULL,
    "itemRange" REAL NOT NULL,
    "itemPierce" REAL,
    "itemDurability" REAL,
    "itemAmmo" INTEGER,
    "itemRechargeTime" REAL,
    "itemSpecialAttacks" TEXT,
    CONSTRAINT "CharacterItem_itemOwner_fkey" FOREIGN KEY ("itemOwner") REFERENCES "CharacterSheet" ("characterId") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "CharacterAttribute" (
    "attributtesId" TEXT NOT NULL PRIMARY KEY,
    "attributeCharacterOwner" TEXT NOT NULL,
    "str" INTEGER NOT NULL,
    "dex" INTEGER NOT NULL,
    "const" INTEGER NOT NULL,
    "int" INTEGER NOT NULL,
    "wis" INTEGER NOT NULL,
    "cha" INTEGER NOT NULL,
    CONSTRAINT "CharacterAttribute_attributeCharacterOwner_fkey" FOREIGN KEY ("attributeCharacterOwner") REFERENCES "CharacterSheet" ("characterId") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "CharacterExpertise" (
    "expertiseId" TEXT NOT NULL PRIMARY KEY,
    "expertiseCharacterOwner" TEXT NOT NULL,
    "religion" INTEGER NOT NULL,
    "lucky" INTEGER NOT NULL,
    "acrobatics" INTEGER NOT NULL,
    "arcana" INTEGER NOT NULL,
    "athletics" INTEGER NOT NULL,
    "history" INTEGER NOT NULL,
    "insight" INTEGER NOT NULL,
    "intimidation" INTEGER NOT NULL,
    "medicine" INTEGER NOT NULL,
    "nature" INTEGER NOT NULL,
    "perception" INTEGER NOT NULL,
    "persuasion" INTEGER NOT NULL,
    "sleightHand" INTEGER NOT NULL,
    "stealth" INTEGER NOT NULL,
    "survival" INTEGER NOT NULL,
    CONSTRAINT "CharacterExpertise_expertiseCharacterOwner_fkey" FOREIGN KEY ("expertiseCharacterOwner") REFERENCES "CharacterSheet" ("characterId") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "CharacterTechnique" (
    "techniqueId" TEXT NOT NULL PRIMARY KEY,
    "techniqueCharacterOwner" TEXT NOT NULL,
    "artillery" INTEGER NOT NULL,
    "block" INTEGER NOT NULL,
    "duel" INTEGER NOT NULL,
    "evasion" INTEGER NOT NULL,
    "furtivity" INTEGER NOT NULL,
    "mind" INTEGER NOT NULL,
    "thievery" INTEGER NOT NULL,
    CONSTRAINT "CharacterTechnique_techniqueCharacterOwner_fkey" FOREIGN KEY ("techniqueCharacterOwner") REFERENCES "CharacterSheet" ("characterId") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Master" (
    "masterId" TEXT NOT NULL PRIMARY KEY,
    "masterAbout" TEXT NOT NULL,
    "masterIcon" TEXT NOT NULL,
    "masterBorder" TEXT NOT NULL,
    "masterDiscord" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "MasterCampaign" (
    "campaignId" TEXT NOT NULL PRIMARY KEY,
    "campaignOwner" TEXT NOT NULL,
    "campaingName" TEXT NOT NULL,
    "campaingType" TEXT NOT NULL,
    "campaignHistory" TEXT NOT NULL,
    "campaignBestiary" TEXT,
    "campaignNotes" TEXT,
    "campaignRecomendations" TEXT,
    "campaignXpPerLevel" INTEGER NOT NULL,
    "campaignProficiencePointsPerLevel" INTEGER NOT NULL,
    CONSTRAINT "MasterCampaign_campaignOwner_fkey" FOREIGN KEY ("campaignOwner") REFERENCES "Master" ("masterId") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateIndex
CREATE UNIQUE INDEX "User_userPassword_key" ON "User"("userPassword");

-- CreateIndex
CREATE UNIQUE INDEX "User_userName_key" ON "User"("userName");

-- CreateIndex
CREATE UNIQUE INDEX "User_userDiscord_key" ON "User"("userDiscord");

-- CreateIndex
CREATE UNIQUE INDEX "CharacterDescription_descriptionOwner_key" ON "CharacterDescription"("descriptionOwner");

-- CreateIndex
CREATE UNIQUE INDEX "CharacterAttribute_attributeCharacterOwner_key" ON "CharacterAttribute"("attributeCharacterOwner");

-- CreateIndex
CREATE UNIQUE INDEX "CharacterExpertise_expertiseCharacterOwner_key" ON "CharacterExpertise"("expertiseCharacterOwner");

-- CreateIndex
CREATE UNIQUE INDEX "CharacterTechnique_techniqueCharacterOwner_key" ON "CharacterTechnique"("techniqueCharacterOwner");

-- CreateIndex
CREATE UNIQUE INDEX "Master_masterDiscord_key" ON "Master"("masterDiscord");
