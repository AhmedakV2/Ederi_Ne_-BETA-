import 'package:flutter/material.dart';
import '../services/data_service.dart';

class PriceListScreen extends StatefulWidget {
  const PriceListScreen({super.key});

  @override
  State<PriceListScreen> createState() => _PriceListScreenState();
}

class _PriceListScreenState extends State<PriceListScreen> {
  String searchText = "";
  String filterType = "Hepsi"; 

  @override
  Widget build(BuildContext context) {
    // Listeyi filtrele
    List<Product> filteredList = DataService().products.where((product) {
      bool matchesSearch = product.title.toLowerCase().contains(searchText.toLowerCase()) || 
                           product.location.toLowerCase().contains(searchText.toLowerCase());
      bool matchesFilter = filterType == "Hepsi" || 
                           (filterType == "Mahalle" && product.neighborhood.isNotEmpty) || 
                           (filterType == "Kategori" && product.category.isNotEmpty); 
                           
      return matchesSearch && matchesFilter;
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Fiyat Listesi'),
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () => Navigator.pushNamed(context, '/profile').then((_) => setState((){})),
          ),
        ],
      ),
      body: Column(
        children: [
          // Arama ve Filtre Alanı
          Container(
            color: Colors.white,
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                TextField(
                  onChanged: (val) => setState(() => searchText = val),
                  decoration: InputDecoration(
                    hintText: 'Ürün veya Market Ara',
                    prefixIcon: const Icon(Icons.search),
                    filled: true,
                    fillColor: const Color(0xFFF5F6F8),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(30), borderSide: BorderSide.none),
                  ),
                ),
                const SizedBox(height: 12),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      const Icon(Icons.tune, color: Colors.blue),
                      const SizedBox(width: 8),
                      const Text('Filtrele:', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
                      const SizedBox(width: 10),
                      _filterChip('Hepsi'),
                      const SizedBox(width: 8),
                      _filterChip('Mahalle'),
                      const SizedBox(width: 8),
                      _filterChip('Kategori'),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Liste
          Expanded(
            child: filteredList.isEmpty 
              ? Center(child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.inbox, size: 64, color: Colors.grey.shade300),
                    const SizedBox(height: 16),
                    const Text("Henüz fiyat eklenmedi.", style: TextStyle(color: Colors.grey)),
                  ],
                )) 
              : ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: filteredList.length,
                  itemBuilder: (context, index) {
                    final item = filteredList[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: ProductCard(product: item), // Artık tüm objeyi gönderiyoruz
                    );
                  },
                ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFFFF9800),
        onPressed: () => Navigator.pushNamed(context, '/add').then((_) => setState((){})),
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  Widget _filterChip(String label) {
    return ActionChip(
      label: Text(label),
      backgroundColor: filterType == label ? Colors.blue.shade100 : Colors.grey.shade100,
      onPressed: () => setState(() => filterType = label),
    );
  }
}

// --- GÜNCELLENEN KART YAPISI ---
class ProductCard extends StatefulWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 4))],
      ),
      child: Column(
        children: [
          // Üst Kısım: Başlık ve Fiyat
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.product.title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Text(widget.product.location, style: const TextStyle(color: Colors.grey, fontSize: 12)),
                ],
              ),
              Text(widget.product.price, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF1E88E5))),
            ],
          ),
          const SizedBox(height: 12),
          // Alt Kısım: Oylama Butonları
          Row(
            children: [
              // Doğru Fiyat Butonu
              InkWell(
                onTap: () {
                  setState(() {
                    widget.product.likes++; // Sayıyı artır
                  });
                },
                borderRadius: BorderRadius.circular(8),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Row(
                    children: [
                      const Icon(Icons.check_circle_outline, color: Colors.green, size: 20),
                      const SizedBox(width: 4),
                      Text(
                        'Doğru Fiyat (${widget.product.likes})', 
                        style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.green)
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 16),
              // Yanlış Fiyat Butonu
              InkWell(
                onTap: () {
                  setState(() {
                    widget.product.dislikes++; // Sayıyı artır
                  });
                },
                borderRadius: BorderRadius.circular(8),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Row(
                    children: [
                      const Icon(Icons.cancel_outlined, color: Colors.red, size: 20),
                      const SizedBox(width: 4),
                      Text(
                        'Yanlış Fiyat (${widget.product.dislikes})', 
                        style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.red)
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}