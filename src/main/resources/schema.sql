CREATE TABLE "car" (
    "CarId" INT PRIMARY KEY NOT NULL,
    "Name" VARCHAR
);

CREATE TABLE "Car" (
    "CarModel" INT NOT NULL,
    "Title" VARCHAR NOT NULL,
    "CarId" INT NOT NULL,
    CONSTRAINT "PK_Car" PRIMARY KEY ("CarModel"),
    CONSTRAINT "FK_CarModelCarId" FOREIGN KEY ("CarId") REFERENCES "car" ("CarId") ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE INDEX "IFK_CarModelCarId" ON "car" ("CarId");

INSERT INTO "car" VALUES (1, 'Porche');
INSERT INTO "car" VALUES (2, 'Mercedes');

//json database is case sensitive like lowercase
//how do I write a java program that puts carId in and out of my sql database