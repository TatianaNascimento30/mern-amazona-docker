import express from 'express';
import expressAsyncHandler from 'express-async-handler';
import Product from '../models/productModel.js';
import { isAuth, isAdmin } from '../utils.js';
import data from '../data.js';

const productRouter = express.Router();

/* ===========================
   1) SEED (PRECISA FICAR NO TOPO)
   =========================== */
productRouter.get(
  '/seed',
  expressAsyncHandler(async (req, res) => {
    // limpa banco antes de inserir
    await Product.deleteMany({});
    const createdProducts = await Product.insertMany(data.products);
    res.send({ createdProducts });
  })
);

/* ==============================
   2) LISTAR TODOS OS PRODUTOS
   ============================== */
productRouter.get('/', async (req, res) => {
  const products = await Product.find();
  res.send(products);
});

/* ==============================
   3) CATEGORIAS
   ============================== */
productRouter.get(
  '/categories',
  expressAsyncHandler(async (req, res) => {
    const categories = await Product.find().distinct('category');
    res.send(categories);
  })
);

/* ==============================
   4) PRODUTO POR SLUG
   ============================== */
productRouter.get('/slug/:slug', async (req, res) => {
  const product = await Product.findOne({ slug: req.params.slug });
  if (product) {
    res.send(product);
  } else {
    res.status(404).send({ message: 'Product Not Found' });
  }
});

/* ==============================
   5) PRODUTO POR ID  (ÚLTIMO!!)
   ============================== */
productRouter.get('/:id', async (req, res) => {
  const product = await Product.findById(req.params.id);
  if (product) {
    res.send(product);
  } else {
    res.status(404).send({ message: 'Product Not Found' });
  }
});

export default productRouter;
