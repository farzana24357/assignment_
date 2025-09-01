import 'package:flutter/material.dart';
import '../screens/update_product_screen.dart';

enum ProductOptions { update, delete }

class ProductItem extends StatelessWidget {
  const ProductItem({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(),
      title: const Text('Product name'),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text('Code: 293293823'),
          Row(
            children: [
              Text('Quantity: 5   '),
              Text('Unit Price: 500'),
            ],
          ),
        ],
      ),
      trailing: PopupMenuButton<ProductOptions>(
        itemBuilder: (context) {
          return const [
            PopupMenuItem(
              value: ProductOptions.update,
              child: Text('Update'),
            ),
            PopupMenuItem(
              value: ProductOptions.delete,
              child: Text('Delete'),
            ),
          ];
        },
        onSelected: (selectedOption) {
          if (selectedOption == ProductOptions.delete) {
            debugPrint('delete');
          } else if (selectedOption == ProductOptions.update) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const UpdateProductScreen()),
            );
          }
        },
      ),
    );
  }
}
