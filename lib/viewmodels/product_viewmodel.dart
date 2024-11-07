import 'package:flutter/material.dart';
import '../models/product.dart';
import '../models/order.dart';

class ProductViewModel extends ChangeNotifier {
  List<Product> products = [];
  List<Order> orders = [];

  ProductViewModel() {
    _fetchProducts();
    _fetchOrders();
  }

  void _fetchProducts() {
    products = [
      Product(
        name: "Kaos Polos Saku Dada",
        imageUrl: "my_mvvm_app/assets/images/kaos1.png",
        price: 249000,
        rating: 4.9,
        reviewCount: 32,
        additionalImages: [
          "my_mvvm_app/assets/images/kaos1d1.png",
          "my_mvvm_app/assets/images/kaos1d2.png",
          "my_mvvm_app/assets/images/kaos1d3.png",
          "my_mvvm_app/assets/images/kaos1d4.png",
        ],
      ),
      Product(
        name: "Kaos Garis Lengan Panjang",
        imageUrl: "my_mvvm_app/assets/images/kaos2.png",
        price: 399000,
        rating: 4.8,
        reviewCount: 94,
        additionalImages: [
          "my_mvvm_app/assets/images/kaos2.png",
          "my_mvvm_app/assets/images/kaos3.png",
          "my_mvvm_app/assets/images/kaos4.png",
          "my_mvvm_app/assets/images/kaos1.png",
        ],
      ),
      // Produk lainnya dapat ditambahkan dengan struktur yang sama
    ];
    notifyListeners();
  }

  void _fetchOrders() {
    orders = [
      Order(product: products[0], status: "Diantar Kurir"),
      Order(product: products[1], status: "Dikemas Penjual"),
      // Tambahkan order lainnya jika diperlukan
    ];
    notifyListeners();
  }
}