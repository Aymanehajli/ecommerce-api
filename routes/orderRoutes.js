import express from 'express';
import { createOrder, createOrderForCustomer, getOrderById, updateOrder, deleteOrder } from '../controllers/orderController.js';

const router = express.Router();

router.post('/', createOrder);
router.post('/direct/:customerId', createOrderForCustomer);
router.get('/:id', getOrderById);
router.put('/:id', updateOrder);
router.delete('/:id', deleteOrder);

export default router;