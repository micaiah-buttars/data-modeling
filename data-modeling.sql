CREATE TABLE "users" (
  "user_id" SERIAL PRIMARY KEY,
  "user_email" varchar(50),
  "user_pw" varchar(30),
  "user_name" varchar(20)
);

CREATE TABLE "recipe" (
  "recipe_id" SERIAL PRIMARY KEY,
  "user_id" int NOT NULL
);

CREATE TABLE "instruction" (
  "instruction_id" SERIAL PRIMARY KEY,
  "recipe_id" int NOT NULL,
  "instruction_text" text
);

CREATE TABLE "ingredient" (
  "ingredient_id" SERIAL PRIMARY KEY,
  "ingredient_name" VARCHAR(50)
);

CREATE TABLE "grocery" (
  "grocery_id" SERIAL PRIMARY KEY,
  "user_id" int NOT NULL
);

CREATE TABLE "occasion" (
  "occasion_id" SERIAL PRIMARY KEY,
  "user_id" int NOT NULL,
  "occassion_name" VARCHAR(50)
);

CREATE TABLE "recipe_ingredients" (
  "recipe_id" int NOT NULL,
  "ingredient_id" int NOT NULL
);

CREATE TABLE "grocery_ingredients" (
  "grocery_id" int NOT NULL,
  "ingredient_id" int NOT NULL
);

CREATE TABLE "occasion_recipes" (
  "occasion_id" int NOT NULL,
  "recipe_id" int NOT NULL
);

ALTER TABLE "recipe" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("user_id");

ALTER TABLE "instruction" ADD FOREIGN KEY ("recipe_id") REFERENCES "recipe" ("recipe_id");

ALTER TABLE "grocery" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("user_id");

ALTER TABLE "occasion" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("user_id");

ALTER TABLE "recipe_ingredients" ADD FOREIGN KEY ("recipe_id") REFERENCES "recipe" ("recipe_id");

ALTER TABLE "recipe_ingredients" ADD FOREIGN KEY ("ingredient_id") REFERENCES "ingredient" ("ingredient_id");

ALTER TABLE "grocery_ingredients" ADD FOREIGN KEY ("grocery_id") REFERENCES "grocery" ("grocery_id");

ALTER TABLE "grocery_ingredients" ADD FOREIGN KEY ("ingredient_id") REFERENCES "ingredient" ("ingredient_id");

ALTER TABLE "occasion_recipes" ADD FOREIGN KEY ("recipe_id") REFERENCES "recipe" ("recipe_id");

ALTER TABLE "occasion_recipes" ADD FOREIGN KEY ("occasion_id") REFERENCES "occasion" ("occasion_id");