import 'package:cloud_firestore/cloud_firestore.dart';

class Restaurant {
  final String id;
  final String name;
  final String address;
  final String tel;

  Restaurant({
    required this.id,
    required this.name,
    required this.address,
    required this.tel,
  });
  factory Restaurant.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Restaurant(
      id: doc.id,
      name: data['name'] ?? 'Unknown Restaurant',
      address: data['address'] ?? 'No Address',
      tel: data['tel'] ?? 'No Tel',
    );
  }

  String? get imageUrl => null;
}
