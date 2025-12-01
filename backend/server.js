import express from "express";
import path from "path";
import mongoose from "mongoose";
import dotenv from "dotenv";
import seedRouter from "./routes/seedRoutes.js";
import productRouter from "./routes/productRoutes.js";
import userRouter from "./routes/userRoutes.js";
import orderRouter from "./routes/orderRoutes.js";
import uploadRouter from "./routes/uploadRoutes.js";
import Product from "./models/productModel.js";
import data from "./data.js";

dotenv.config();

// 👉 seed automático se o banco estiver vazio
async function seedIfNeeded() {
  try {
    const productsCount = await Product.countDocuments();
    if (productsCount === 0) {
      console.log("No products found in DB. Running seed...");
      await Product.insertMany(data.products);
      console.log("Seed completed ✅");
    } else {
      console.log(
        `DB already has ${productsCount} products. Skipping seed.`
      );
    }
  } catch (err) {
    console.error("Error while running seed on startup:", err);
  }
}

mongoose
  .connect(process.env.MONGODB_URI)
  .then(async () => {
    console.log("connected to db");

    // controla pelo .env se vai rodar o seed automático ou não
    if (process.env.AUTO_SEED === "true") {
      await seedIfNeeded();
    }
  })
  .catch((err) => {
    console.log(err.message);
  });

const app = express();

app.use(express.json());
app.use(express.urlencoded({ extended: true }));

app.get("/api/keys/paypal", (req, res) => {
  res.send(process.env.PAYPAL_CLIENT_ID || "sb");
});
app.get("/api/keys/google", (req, res) => {
  res.send({ key: process.env.GOOGLE_API_KEY || "" });
});

app.use("/api/upload", uploadRouter);
app.use("/api/seed", seedRouter);
app.use("/api/products", productRouter);
app.use("/api/users", userRouter);
app.use("/api/orders", orderRouter);

const __dirname = path.resolve();
app.use(express.static(path.join(__dirname, "/frontend/build")));
app.get("*", (req, res) =>
  res.sendFile(path.join(__dirname, "/frontend/build/index.html"))
);

app.use((err, req, res, next) => {
  res.status(500).send({ message: err.message });
});

const port = process.env.PORT || 4000;
app.listen(port, () => {
  console.log(`serve at http://localhost:${port}`);
});
