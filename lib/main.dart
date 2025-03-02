import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';
import 'splash_screen.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        home: SplashScreen(),
    );
  }
}


class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Açık Artırma Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Roboto',
      ),
      home: const ProductListScreen(),
    );
  }
}

class Product {
  final String name;
  final String imageUrl;
  double currentPrice;
  final int duration;
  Timer? timer;
  int timeLeft,year,mileage;
  String lastBidder;
  List<Bid> bidHistory;
  String brand, model,fuelType,description
  ;


  Product({
    required this.name,
    required this.imageUrl,
    required this.currentPrice,
    required this.duration,
    required this.brand,
    required this.model,
    required this.year,
    required this.fuelType,
    required this.mileage,
    required this.description,


    List<Bid>? initialBids,
  })  : timeLeft = duration,
        lastBidder = "Henüz teklif yok",


        bidHistory = initialBids ?? [];
}

class Bid {
  final String bidder;
  final double amount;
  final DateTime time;

  Bid({required this.bidder, required this.amount, required this.time});
}

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ProductListScreenState createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  final List<String> _randomBidders = [
    'Ahmet Y.',
    'Mehmet K.',
    'Ayşe S.',
    'Fatma D.',
    'Ali R.',
    'Zeynep B.',
    'Can M.',
    'Elif N.'
  ];

  late List<Product> _products;

  @override
  void initState() {
    super.initState();
    _initializeProducts();
    for (var product in _products) {
      _startTimer(product);
    }
  }

  void _initializeProducts() {
    _products = [
      Product(
        name: 'Toyota Corolla',
        imageUrl:'data:image/jpeg;base64,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',
        currentPrice: 310000,
        duration:  50,
        brand: 'Toyota',
        model: '1.3 XL',
        year: 1997,
        fuelType: 'Benzin & LPG',
        mileage:  340000,
        description: 'ARACIMIZIN MOTORUNDA YÜRÜYENİNDE HİÇ BİR SIKINTI YOKTUR,KLİMA BUZ CAMLAR OTOMATİK MERKEZİ KİLİT,DÖRT LASTİK YENİ AKÜ YENİ SIVI BAKIMLARI YENİ,ÇÜRÜK ÇARIK SÖZ KONUSU DEĞİLDİR,TEK DEĞİŞEN SAĞ ÖN ÇAMURLUKDUK,KOZMATİK OLARAK İÇ KISMINDA EN UFAK DEFORME DAHİ YOKTUR',
        initialBids: _generateRandomBids(1200200),
      ),
      Product(
        name: 'TABU MOTORS 2013 MODEL ROSSO CORSA RED E92 M3 İNDİVİDUAL',
        imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRCaxo4d49pXOal3jgzoVD7pmFQuUswZp9z077p6UgIiQcmt_sW',
        currentPrice: 2850000 ,
        duration: 200,
        brand: 'BMW',
        model: 'M3 Coupe',
        year: 2013,
        fuelType: 'Benzin',
        mileage:  90000,
        description: "TABU MOTORS,ARAÇ DONANIM OLARAK :DİKİŞLİ DERİ CARBON TRİMLER,İNDİVİDUAL SES SİSTEMİCİC YENİ NESİL EKRAN,EDC SÜSPANSİYON SİSTEMİ,DKG ŞANZIMAN,KEYLESS GO,KOLTUK ISITMA,ANAHTARSIZ ÇALIŞTIRMA,ELEKTİRİKLİ ÖN KOLTUKLAR,ISITMALI ÖN KOLTUKLAR,4 SIFIR PİRELLİ P ZERO LASTİK,KATLANIR AYNAM LOGOLU KOLTUK BAŞLIKLARI.ARKA PARK SENSÖRÜ.CARBON BAGAJ ÜSTÜ SPOİLER,EMİL EGZOZ SİSTEMİ,CARBON ÖN LİP,CARBON YAN EKLER,CARBON AYNA KAPAKLARI,CARBON İÇ TRİM,VS,ARACIMIZ 2013 MODEL E92 m3 PROJESİDİR. ",
        initialBids: _generateRandomBids(45000),
      ),
      Product(
        name: 'FULL TEMİZ DOSTA YARAR SIFIR MUAYNELİ 1993 ŞAHİN',
        imageUrl:'https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcTxoaFLmx5zT6nJb7yuQLnaqPrt6sL5AeHH9k--BI7NZqW24P2t',
        currentPrice: 280000,
        duration: 500,
        brand: 'Tofaş',
        model: '1.6',
        year: 1993,
        fuelType: 'Benzin & LPG',
        mileage:  999999,
        description: '1993 model aracım benzin LPG,motor alttakım sağlam kapı yüzleri koltuk kılıfı yeni dosta gider',
        initialBids: _generateRandomBids(8500),
      ),
    ];
  }

 List<Bid> _generateRandomBids(double currentPrice) {
  final random = Random();
  final bids = <Bid>[];
  double price = currentPrice * 0.8; // Start from 80% of current price
  DateTime time = DateTime.now().subtract(Duration(minutes: random.nextInt(60))); // Oldest bid starts in the past

  int bidCount = random.nextInt(5) + 3; // At least 3 bids

  for (int i = 0; i < bidCount - 1; i++) { // Leave last bid for the exact current price
    double increment = 100 + random.nextDouble() * 900; // Ensures at least +100 increase
    price += increment;
    time = time.add(Duration(minutes: random.nextInt(10) + 1)); // Ensures increasing time

    bids.add(Bid(
      bidder: _randomBidders[random.nextInt(_randomBidders.length)],
      amount: price,
      time: time,
    ));
  }

  // Add the last bid with the exact current price and the latest time
  bids.add(Bid(
    bidder: _randomBidders[random.nextInt(_randomBidders.length)],
    amount: currentPrice,
    time: time.add(Duration(minutes: random.nextInt(10) + 1)),
  ));
   var sonlist=bids.reversed.toList();
  return sonlist;
}

  void _startTimer(Product product) {
    product.timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (product.timeLeft > 0) {
        setState(() {
          product.timeLeft--;
        });
      } else {
        timer.cancel();
      }
    });
  }

  String _formatTimeLeft(int seconds) {
    final minutes = seconds ~/ 60;
    final remainingSeconds = seconds % 60;
    return '$minutes:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  void _addProduct(String name, String price, String imageUrl, int duration) {
    final newProduct = Product(
      name: name,
      imageUrl: imageUrl,
      currentPrice: double.parse(price),
      duration: duration, brand: '', model: '', year: 2025, fuelType: '', mileage: 90000, description: '',
    );
    setState(() {
      _products.add(newProduct);
      _startTimer(newProduct);
    });
  }

  void _bidOnProduct(Product product, double bidAmount) {
    if (bidAmount > product.currentPrice) {
      setState(() {
        product.currentPrice = bidAmount;
        product.lastBidder = "Siz";
        product.bidHistory.insert(0, Bid(
          bidder: "Siz",
          amount: bidAmount,
          time: DateTime.now(),
        ));
      });
    } else {
      _showMessage("Teklif mevcut fiyattan yüksek olmalıdır!");
    }
  }

  void _showBidHistory(Product product) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('${product.name} - Teklif Geçmişi'),
          content: SizedBox(
            width: double.maxFinite,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: product.bidHistory.length,
              itemBuilder: (context, index) {
                final bid = product.bidHistory[index];
                return ListTile(
                  title: Text('${bid.bidder}: ₺${bid.amount.toStringAsFixed(2)}'),
                  subtitle: Text('${bid.time.hour}:${bid.time.minute.toString().padLeft(2, '0')}'),
                );
              },
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Kapat'),
            ),
          ],
        );
      },
    );
  }

  void _showAddProductDialog() {
    final nameController = TextEditingController();
    final priceController = TextEditingController();
    final imageController = TextEditingController();
    final durationController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Yeni Ürün Ekle'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(labelText: 'Ürün Adı'),
                ),
                TextField(
                  controller: priceController,
                  decoration: const InputDecoration(labelText: 'Başlangıç Fiyatı (₺)'),
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  controller: imageController,
                  decoration: const InputDecoration(labelText: 'Resim URL'),
                ),
                TextField(
                  controller: durationController,
                  decoration: const InputDecoration(labelText: 'Süre (saniye)'),
                  keyboardType: TextInputType.number,
                ),
                
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('İptal'),
            ),
            TextButton(
              onPressed: () {
                if (nameController.text.isNotEmpty &&
                    priceController.text.isNotEmpty &&
                    imageController.text.isNotEmpty) {
                  _addProduct(
                    nameController.text,
                    priceController.text,
                    imageController.text,
                    int.tryParse(durationController.text) ?? 300,
                  );
                  Navigator.of(context).pop();
                }
              },
              child: const Text('Ekle'),
            ),
          ],
        );
      },
    );
  }

  void _showBidDialog(Product product) {
    final bidController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('${product.name} için Teklif Ver'),
          content: TextField(
            controller: bidController,
            decoration: const InputDecoration(labelText: 'Teklifiniz (₺)'),
            keyboardType: TextInputType.number,
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('İptal'),
            ),
            TextButton(
              onPressed: () {
                final bid = double.tryParse(bidController.text);
                if (bid != null) {
                  _bidOnProduct(product, bid);
                }
                Navigator.of(context).pop();
              },
              child: const Text('Teklif Ver'),
            ),
          ],
        );
      },
    );
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  void dispose() {
    for (var product in _products) {
      product.timer?.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OTOZEN PREMİUM'),
      ),
      body: _products.isEmpty
          ? const Center(child: Text('Henüz ürün bulunmamaktadır.'))
          : ListView.builder(
              itemCount: _products.length,
              itemBuilder: (context, index) {
                final product = _products[index];
                return Card(
                  margin: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Image.network(
                        product.imageUrl,
                        height: 200,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              product.name,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text('model:'  + product.model),
                            const SizedBox(height: 8),
                            Text('Açıklama: ${product.description}'),
                            const SizedBox(height: 8),
                            Text('Yıl: ${product.year}'),
                            const SizedBox(height: 8),
                            Text('Yakıt Tipi: ${product.fuelType}'),
                            const SizedBox(height: 8),
                            Text('Kilometre: ${product.mileage}'),
                            const SizedBox(height: 8),
                            Text('Marka: ${product.brand}'),
                            const SizedBox(height: 8),


                            Text('Son Teklif: ${product.lastBidder}'),
                            Text(
                              'Kalan Süre: ${_formatTimeLeft(product.timeLeft)}',
                              style: TextStyle(
                                color: product.timeLeft < 60 ? Colors.red : Colors.black,
                                fontWeight: product.timeLeft < 60 ? FontWeight.bold : FontWeight.normal,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Mevcut Fiyat: ₺${product.currentPrice.toStringAsFixed(2)}',
                              style: const TextStyle(
                                fontSize: 18,
                                color: Colors.green,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ElevatedButton(
                                  onPressed: () => _showBidHistory(product),
                                  child: const Text('Teklif Geçmişi'),
                                ),
                                ElevatedButton(
                                  onPressed: product.timeLeft > 0
                                      ? () => _showBidDialog(product)
                                      : null,
                                  child: const Text('Teklif Ver'),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddProductDialog,
        tooltip: 'Yeni Ürün Ekle',
        child: const Icon(Icons.add),
      ),
    );
  }
}