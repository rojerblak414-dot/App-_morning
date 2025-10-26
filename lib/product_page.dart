import 'package:flutter/material.dart';
import 'package:flutter_application_1/drawer.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  final List<Map<String, String>> products = const [
    {'name': 'Laptop Pro', 'price': '\$1200', 'icon': '💻'},
    {'name': 'Smart Watch', 'price': '\$250', 'icon': '⌚'},
    {'name': 'Wireless Buds', 'price': '\$150', 'icon': '🎧'},
    {'name': '4K Monitor', 'price': '\$450', 'icon': '🖥'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text('🛒 Product List'),
      ),
      backgroundColor: Colors.blue,
      drawer: AppDrawer(),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
            child: Dismissible(
              key: ValueKey(product['name']),
              background: Container(
                color: Colors.red,
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.only(right: 20.0),
                child: const Icon(Icons.delete, color: Colors.white),
              ),
              onDismissed: (direction) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('${product['name']} dismissed (Deleted)!'),
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.red,
                      spreadRadius: 5,
                      blurRadius: 5,
                    ),
                  ],
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.deepPurple.shade100,
                    child: Text(
                      product['icon']!,
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                  title: Text(
                    product['name']!,
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                  trailing: Text(
                    product['price']!,
                    style: const TextStyle(
                      color: Colors.amber,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/drawer.dart';

// class ProductsPage extends StatelessWidget {
//   final List<Map<String, String>> products = [
//     {'name': 'iphone', 'image': 'assets/iphone.jpeg'},
//     {'name': 'samsung', 'image': 'assets/samsung.jpeg'},
//     {'name': 'vivo', 'image': 'assets/vivo.jpeg'},
//     {'name': 'xiaomi', 'image': 'assets/xiaomi.jpeg'},
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Products list ')),
//       drawer: AppDrawer(),
//       body: GridView.builder(
//         padding: EdgeInsets.all(10),
//         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2,
//           crossAxisSpacing: 10,
//           mainAxisSpacing: 10,
//         ),
//         itemCount: products.length,
//         itemBuilder: (context, index) {
//           return Card(
//             elevation: 4,
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(10),
//             ),
//             child: Column(
//               children: [
//                 Expanded(
//                   child: ClipRRect(
//                     borderRadius: BorderRadius.vertical(
//                       top: Radius.circular(10),
//                     ),
//                     child: Image.asset(
//                       products[index]['image']!,
//                       fit: BoxFit.cover,
//                       width: double.infinity,
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Text(
//                     products[index]['name']!,
//                     style: TextStyle(fontWeight: FontWeight.bold),
//                   ),
//                 ),
//                 ElevatedButton(
//                   onPressed: () {
//                     Navigator.pushNamed(context, '/developer');
//                   },
//                   child: Text("Go to developer"),
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
