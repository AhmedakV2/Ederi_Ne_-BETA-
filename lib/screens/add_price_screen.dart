import 'package:flutter/material.dart';
import '../services/data_service.dart';

class AddPriceScreen extends StatefulWidget {
  const AddPriceScreen({super.key});

  @override
  State<AddPriceScreen> createState() => _AddPriceScreenState();
}

class _AddPriceScreenState extends State<AddPriceScreen> {
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _neighborhoodController = TextEditingController();
  final TextEditingController _placeController = TextEditingController();
  String? selectedCategory;

  void _submitPrice() {
    if (_priceController.text.isEmpty || selectedCategory == null) return;

    final newProduct = Product(
      title: selectedCategory!, 
      location: "${_placeController.text} - ${_neighborhoodController.text}",
      price: "₺${_priceController.text}",
      category: selectedCategory!,
      neighborhood: _neighborhoodController.text,
      date: DateTime.now(),
    );

    DataService().addProduct(newProduct);

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (ctx) {
        return TweenAnimationBuilder<double>(
          tween: Tween(begin: 0.0, end: 1.0),
          duration: const Duration(milliseconds: 600),
          curve: Curves.elasticOut,
          builder: (context, value, child) {
            return Transform.scale(
              scale: value,
              child: AlertDialog(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                content: const Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.check_circle, color: Colors.green, size: 60),
                    SizedBox(height: 16),
                    Text("Fiyat Eklendi!", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            );
          },
        );
      },
    );

    Future.delayed(const Duration(milliseconds: 1200), () {
      Navigator.pop(context); 
      Navigator.pop(context); 
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text('Yeni Fiyat Ekle', style: TextStyle(color: Colors.black)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Tutar', style: TextStyle(fontWeight: FontWeight.w600)),
            const SizedBox(height: 8),
            TextField(
              controller: _priceController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.currency_lira, size: 18),
                hintText: '0.00',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
              ),
            ),
            const SizedBox(height: 24),
            const Text('Kategori', style: TextStyle(fontWeight: FontWeight.w600)),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  isExpanded: true,
                  hint: const Text('Kategori seçiniz'),
                  value: selectedCategory,
                  items: ['Gıda', 'Elektronik', 'Hizmet', 'Giyim'].map((val) => DropdownMenuItem(value: val, child: Text(val))).toList(),
                  onChanged: (val) => setState(() => selectedCategory = val),
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Text('Mahalle Adı', style: TextStyle(fontWeight: FontWeight.w600)),
            const SizedBox(height: 8),
            TextField(
              controller: _neighborhoodController,
              decoration: InputDecoration(
                hintText: 'örn. Kadıköy',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
              ),
            ),
            const SizedBox(height: 24),
            const Text('İşletme/Yer Adı', style: TextStyle(fontWeight: FontWeight.w600)),
            const SizedBox(height: 8),
            TextField(
              controller: _placeController,
              decoration: InputDecoration(
                hintText: 'örn. Berber Ali',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
              ),
            ),
            const SizedBox(height: 40),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFFF9800)),
                onPressed: _submitPrice,
                child: const Text('Fiyatı Gönder', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}