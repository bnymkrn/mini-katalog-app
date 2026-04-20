import '../models/product.dart';

// Sepet State Simülasyonu
List<Product> cartItems = [];

// JSON Simülasyon Verisi (Tamamen Türkçe)
final List<Map<String, dynamic>> productsJson = [
  {
    'id': '1',
    'name': 'AirPods Pro (2. Nesil)',
    'subtitle': 'Adaptif Ses.',
    'price': 249.0,
    'imageUrl': 'https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/MQD83?wid=1144&hei=1144&fmt=jpeg&qlt=90&.v=1660803972361',
    'description': 'Yeni nesil aktif gürültü engelleme ve adaptif ses teknolojisi ile benzersiz bir deneyim.'
  },
 {
    'id': '2',
    'name': 'AirPods Max',
    'subtitle': 'Ses odaklı tasarım.',
    'price': 549.0,
    // Yeni ve daha stabil olan bu linki yapıştır:
    'imageUrl': 'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/airpods-max-select-silver-202011?wid=940&hei=1112&fmt=png-alpha&.v=1604021221000',
    'description': 'Yüksek kaliteli ses, aktif gürültü engelleme ve uzamsal ses ile kusursuz bir dinleme deneyimi.'
  },
  {
    'id': '3',
    'name': 'HomePod',
    'subtitle': 'Derin ve güçlü ses.',
    'price': 299.0,
    'imageUrl': 'https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/homepod-select-midnight-202210?wid=940&hei=1112&fmt=png-alpha&.v=1670557210097',
    'description': 'Zengin, 360 derece ses deneyimi ve akıllı asistan Siri ile evinizin kalbi.'
  },
  {
    'id': '4',
    'name': 'HomePod Mini',
    'subtitle': 'Canlı renkler.',
    'price': 99.0,
    'imageUrl': 'https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/homepod-mini-select-orange-202110?wid=940&hei=1112&fmt=png-alpha&.v=1632925511000',
    'description': 'HomePod Mini, boyutu için beklenmedik derecede büyük bir ses sunan yeniliklerle doludur. Sadece 8.4 cm boyunda olmasına rağmen tüm odayı zengin 360 derece sesle doldurur.'
  },
];

// Map listesini Product nesnelerine çevirme
List<Product> dummyProducts = productsJson.map((json) => Product.fromJson(json)).toList();