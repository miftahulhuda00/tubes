// views/product_detail_screen.dart
import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product product;

  ProductDetailScreen({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Detail Produk",
          style: TextStyle(color: Colors.white), // Mengubah teks menjadi putih
        ),
        backgroundColor: Colors.blueGrey[900],
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white), // Mengubah ikon menjadi putih
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                product.imageUrl,
                height: 200,
              ),
            ),
            SizedBox(height: 16),

            // Menambahkan gambar tambahan sebagai thumbnail
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: product.additionalImages.take(4).map((image) {
                return Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: GestureDetector(
                    onTap: () {
                      // Aksi ketika thumbnail ditekan (misalnya, ganti gambar utama)
                      print("Thumbnail ditekan");
                    },
                    child: Image.asset(
                      image,
                      height: 50,
                      width: 50,
                    ),
                  ),
                );
              }).toList(),
            ),
            SizedBox(height: 16),

            Text(
              product.name,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Rp${product.price.toString()}',
              style: TextStyle(fontSize: 20, color: Colors.blueGrey[700]),
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.star, size: 16, color: Colors.amber),
                Text('${product.rating} (${product.reviewCount} Ulasan)'),
              ],
            ),
            SizedBox(height: 16),
            
            // Pilihan ukuran
            Text(
              "Pilih Ukuran",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                for (var size in ["S", "M", "L", "XL"])
                  Container(
                    margin: EdgeInsets.all(4.0),
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueGrey),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Text(size),
                  ),
              ],
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                // Aksi saat tombol "Masukkan ke Keranjang" ditekan
                print("Produk ditambahkan ke keranjang");
              },
              child: Text(
                "Masukkan ke Keranjang",
                style: TextStyle(color: Colors.white), // Mengubah teks menjadi putih
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueGrey[900],
                minimumSize: Size(double.infinity, 50), // Lebar penuh
              ),
            ),
          ],
        ),
      ),
    );
  }
}