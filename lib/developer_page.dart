import 'package:flutter/material.dart';
import 'package:flutter_application_1/drawer.dart';

class DeveloperPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "🧑‍💻 Developer Info",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.teal.shade400,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      backgroundColor: Colors.grey.shade50,
      drawer: AppDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 15,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: const CircleAvatar(
                  radius: 70,
                  backgroundImage: AssetImage("assets/images/oak.jpg"),
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                'Seub Due',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w900,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 5),
              const Text(
                "Flutter Developer",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.teal,
                  fontStyle: FontStyle.italic,
                ),
              ),
              const SizedBox(height: 25),

              const Text(
                'ສາຂາຮຽນ:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 10),
              Wrap(
                spacing: 8.0,
                alignment: WrapAlignment.center,
                children: [
                  Chip(
                    label: const Text('ຊື່: ສ.ນ ສືບ'),
                    backgroundColor: Colors.blue.shade100,
                  ),
                  Chip(
                    label: const Text('ສາຂາ: IT (ພັດທະນາ App)'),
                    backgroundColor: Colors.green.shade100,
                  ),
                  Chip(
                    label: const Text('Skill: Flutter'),
                    backgroundColor: Colors.purple.shade100,
                  ),
                ],
              ),

              const SizedBox(height: 30),

              _ContactInfoCard(
                icon: Icons.email,
                text: 'rojerblank414@gmail.com',
                color: Colors.red.shade400,
              ),
              _ContactInfoCard(
                icon: Icons.phone,
                text: '020 94009385',
                color: Colors.blue.shade400,
              ),
              const SizedBox(height: 40),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/products');
                  },
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.teal,
                    side: BorderSide(color: Colors.teal.shade400, width: 2),
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    "ກັບຄືນໜ້າສິນຄ້າ",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ContactInfoCard extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color color;

  const _ContactInfoCard({
    required this.icon,
    required this.text,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Icon(icon, color: color, size: 24),
            const SizedBox(width: 15),
            Expanded(
              child: Text(
                text,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
