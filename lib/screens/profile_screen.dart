import 'package:flutter/material.dart';
import '../services/data_service.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final data = DataService();
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profilim'),
        actions: [IconButton(icon: const Icon(Icons.settings), onPressed: () {})],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 30),
              color: Colors.white,
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        width: 120,
                        height: 120,
                        child: CircularProgressIndicator(
                          value: data.dealCount > 0 ? (data.dealCount / 10) : 0, // Hedef: 10 ürün
                          strokeWidth: 10,
                          backgroundColor: Colors.grey.shade200,
                          valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFFFFC107)),
                        ),
                      ),
                      Column(
                        children: [
                          Text('${data.score}', style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
                          const Text('Skor', style: TextStyle(color: Colors.grey)),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(data.currentUsername, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.emoji_events, size: 18, color: Color(0xFF1E88E5)),
                      SizedBox(width: 4),
                      Text('Başlangıç Seviyesi', style: TextStyle(color: Color(0xFF1E88E5), fontWeight: FontWeight.w600)),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(child: _statCard(Icons.shopping_bag_outlined, '${data.dealCount}', 'Fiyat Girildi')),
                  const SizedBox(width: 16),
                  Expanded(child: _statCard(Icons.savings_outlined, '₺0', 'Para Tasarrufu')), // Mock
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _statCard(IconData icon, String value, String label) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
      child: Column(
        children: [
          Icon(icon, color: const Color(0xFF1E88E5), size: 30),
          const SizedBox(height: 8),
          Text(value, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          Text(label, style: const TextStyle(color: Colors.grey, fontSize: 12)),
        ],
      ),
    );
  }
}