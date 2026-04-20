import 'package:flutter/material.dart';
import '../models/product.dart';
import '../data/dummy_data.dart';
import 'detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Product> _foundProducts = [];

  @override
  void initState() {
    super.initState();
    _foundProducts = dummyProducts;
  }

  void _runFilter(String enteredKeyword) {
    List<Product> results = [];
    if (enteredKeyword.isEmpty) {
      results = dummyProducts;
    } else {
      results = dummyProducts
          .where((product) =>
              product.name.toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
    }

    setState(() {
      _foundProducts = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Keşfet', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_bag_outlined),
            onPressed: () => Navigator.pushNamed(context, '/cart'),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Mükemmel cihazını bul.', style: TextStyle(color: Colors.grey, fontSize: 16)),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(color: Colors.grey[200], borderRadius: BorderRadius.circular(12)),
                child: TextField(
                  onChanged: (value) => _runFilter(value),
                  decoration: const InputDecoration(
                    icon: Icon(Icons.search, color: Colors.grey),
                    border: InputBorder.none,
                    hintText: 'Ürünlerde ara',
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  'https://wantapi.com/assets/banner.png',
                  width: double.infinity,
                  height: 80,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    height: 80,
                    color: Colors.blue[100],
                    child: const Center(
                        child: Text("HEDİYE MAĞAZASI", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 20))),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              _foundProducts.isEmpty
                  ? const Center(
                      child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Text('Ürün bulunamadı', style: TextStyle(fontSize: 18, color: Colors.grey)),
                    ))
                  : GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.65, // Kartları biraz uzattık ki yazılar sığsın
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                      ),
                      itemCount: _foundProducts.length,
                      itemBuilder: (context, index) {
                        final product = _foundProducts[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => DetailScreen(product: product)),
                            );
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(color: Colors.grey[100], borderRadius: BorderRadius.circular(16)),
                                  child: Image.network(product.imageUrl, fit: BoxFit.contain),
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(product.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                              Text(product.subtitle, style: const TextStyle(color: Colors.grey, fontSize: 12)),
                              const SizedBox(height: 4),
                              // --- EKLENEN KISA AÇIKLAMA KISMI ---
                              Text(
                                product.description,
                                maxLines: 2, // En fazla 2 satır göster
                                overflow: TextOverflow.ellipsis, // 2 satırdan uzunsa sonuna üç nokta (...) koy
                                style: const TextStyle(color: Colors.black54, fontSize: 10),
                              ),
                              const SizedBox(height: 4),
                              Text('\$${product.price.toInt()}', style: const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
                            ],
                          ),
                        );
                      },
                    )
            ],
          ),
        ),
      ),
    );
  }
}