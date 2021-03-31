-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "item_categories" (
    "item_category_name" VARCHAR   NOT NULL,
    "item_category_id" INT   NOT NULL,
    CONSTRAINT "pk_item_categories" PRIMARY KEY (
        "item_category_id"
     )
);

CREATE TABLE "items" (
    "item_name" VARCHAR   NOT NULL,
    "item_id" INT   NOT NULL,
    "item_category_id" INT   NOT NULL,
    CONSTRAINT "pk_items" PRIMARY KEY (
        "item_id"
     )
);

CREATE TABLE "sales_train" (
    "date" DATETIME   NOT NULL,
    "date_block_num" INT   NOT NULL,
    "shop_id" INT   NOT NULL,
    "item_id" INT   NOT NULL,
    "item_price" FLOAT   NOT NULL,
    "item_cnt_day" INT   NOT NULL
);

CREATE TABLE "shops" (
    "shop_name" VARCHAR   NOT NULL,
    "shop_id" INT   NOT NULL,
    CONSTRAINT "pk_shops" PRIMARY KEY (
        "shop_id"
     )
);

ALTER TABLE "items" ADD CONSTRAINT "fk_items_item_category_id" FOREIGN KEY("item_category_id")
REFERENCES "item_categories" ("item_category_id");

ALTER TABLE "sales_train" ADD CONSTRAINT "fk_sales_train_shop_id" FOREIGN KEY("shop_id")
REFERENCES "shops" ("shop_id");

ALTER TABLE "sales_train" ADD CONSTRAINT "fk_sales_train_item_id" FOREIGN KEY("item_id")
REFERENCES "items" ("item_id");

