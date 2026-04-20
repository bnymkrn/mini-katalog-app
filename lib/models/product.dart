class Product {
  final String id;
  final String name;
  final String subtitle;
  final double price;
  final String imageUrl;
  final String description;

  Product({
    required this.id,
    required this.name,
    required this.subtitle,
    required this.price,
    required this.imageUrl,
    required this.description,
  });

  // İnternetten (JSON) gelen veriyi bizim anlayacağımız Product nesnesine çeviren kısım
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      subtitle: json['subtitle'],
      price: json['price'],
      imageUrl: json['imageUrl'],
      description: json['description'],
    );
  }
}