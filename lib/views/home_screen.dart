// views/home_screen.dart
import 'package:flutter/material.dart';
import 'package:huda_flutter/models/product.dart';
import 'package:provider/provider.dart';
import '../viewmodels/product_viewmodel.dart';
import 'product_detail_screen.dart'; // Impor halaman detail produk

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  // Fungsi untuk mengupdate indeks saat item ditekan
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<ProductViewModel>(context);

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.blueGrey[900], // Warna latar belakang tanpa gambar
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Bagian Header dengan Ikon User dan Tombol Setting
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.person,
                    size: 32,
                    color: Colors.white,
                  ),
                  IconButton(
                    icon: Icon(Icons.settings),
                    color: Colors.white,
                    onPressed: () {
                      // Aksi tombol setting
                      print("Tombol Setting ditekan");
                    },
                  ),
                ],
              ),
              SizedBox(height: 16),

              // Judul Halaman
              Text(
                'Pilih Gaya Favoritmu!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              SizedBox(height: 16),

              // Bagian Pesanan (tampilkan hanya 2 dari 4 pesanan)
              Text(
                'Pesanan (${viewModel.orders.length})',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              SizedBox(height: 8),
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.grey[200]?.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                    // Tampilkan hanya 2 pesanan pertama
                    ...viewModel.orders.take(2).map((order) {
                      return ListTile(
                        leading: Image.asset(order.product.imageUrl),
                        title: Text(order.product.name),
                        subtitle: Text(order.status),
                      );
                    }).toList(),

                    // Keterangan untuk "Lihat 2 pesanan lainnya" dengan box di tengah
                    if (viewModel.orders.length > 2) // Tampilkan jika ada lebih dari 2 pesanan
                      Center(
                        child: Container(
                          margin: EdgeInsets.only(top: 8),
                          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                          decoration: BoxDecoration(
                            color: Colors.blueGrey[700],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: TextButton(
                            onPressed: () {
                              // Aksi jika ingin melihat lebih banyak (belum diimplementasikan)
                              print("Lihat pesanan lainnya ditekan");
                            },
                            child: Text(
                              'Lihat 2 pesanan lainnya',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              SizedBox(height: 16),

              // Bagian Produk
              Text(
                'Atasan',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              SizedBox(height: 8),
              Expanded(
                child: ListView.builder(
                  itemCount: viewModel.products.length,
                  itemBuilder: (context, index) {
                    final product = viewModel.products[index];
                    return GestureDetector(
                      onTap: () {
                        // Navigasi ke halaman detail produk saat produk ditekan
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductDetailScreen(product: product),
                          ),
                        );
                      },
                      child: Card(
                        color: Colors.white.withOpacity(0.9),
                        child: ListTile(
                          leading: Image.asset(product.imageUrl),
                          title: Text(product.name),
                          subtitle: Row(
                            children: [
                              Text('Rp${product.price.toString()}'),
                              Spacer(),
                              Icon(Icons.star, size: 16, color: Colors.amber),
                              Text('${product.rating} (${product.reviewCount} Ulasan)'),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),

      // Bagian BottomNavigationBar dengan 5 tombol
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.blueGrey[800],
        selectedItemColor: Colors.amber,
        unselectedItemColor: Colors.white,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}