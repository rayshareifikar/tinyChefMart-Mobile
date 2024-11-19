import 'package:flutter/material.dart';
import 'package:tiny_chef_mart/models/product_entry.dart';

class ProductDetailPage extends StatelessWidget {
  final ProductEntry product;

  const ProductDetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.fields.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Name: ${product.fields.name}",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text("Price: ${product.fields.price}"),
            const SizedBox(height: 16),
            Text("Description: ${product.fields.desc}"),
            const SizedBox(height: 16),
            Text("Quantity: ${product.fields.quantity}"),
          ],
        ),
      ),
    );
  }
}
