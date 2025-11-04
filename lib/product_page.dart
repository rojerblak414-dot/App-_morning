import 'package:flutter/material.dart';
import 'package:flutter_application_1/drawer.dart';

class ProductsPage extends StatelessWidget {
  final List<Map<String, dynamic>> products = [
    {
      'name': 'iphone 17 ProMax',
      'image': 'assets/images/iphone.jpeg',
      'price': 999.00,
    },
    {
      'name': 'samsung s25 Ultra',
      'image': 'assets/images/samsung.jpeg',
      'price': 850.50,
    },
    {
      'name': 'vivo x 200 pro',
      'image': 'assets/images/vivo.jpeg',
      'price': 550.99,
    },
    {
      'name': 'xiaomi 17 proMAX',
      'image': 'assets/images/xiaomi.jpeg',
      'price': 420.00,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('🛍️ Products list'),
        backgroundColor: Colors.amberAccent,
        foregroundColor: Colors.black, // ປັບສີຕົວອັກສອນ
      ),
      backgroundColor: Colors.grey.shade100, // ປັບສີພື້ນຫຼັງ
      drawer: AppDrawer(),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.75, // ປັບຕາມຂະໜາດທີ່ເໝາະສົມ
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return Card(
            elevation: 6,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 3,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(15),
                    ),
                    child: Image.asset(
                      product['image']!,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 8, 10, 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          product['name']!,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 4),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                '\$${(product['price'] as double).toStringAsFixed(2)}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.w900,
                                  color: Colors.deepOrange,
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(
                                height: 30,
                                width: 85,
                                child: ElevatedButton(
                                  onPressed: () {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'ເພີ່ມ ${product['name']} ເຂົ້າກະຕ່າແລ້ວ!',
                                        ),
                                        duration: const Duration(
                                          milliseconds: 800,
                                        ),
                                      ),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.teal.shade600,
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 5,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  child: const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.shopping_cart,
                                        size: 14,
                                        color: Colors.white,
                                      ),
                                      Text(
                                        'ເພີ່ມ',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
