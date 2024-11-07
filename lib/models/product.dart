class Product {
  final String name;
  final String imageUrl;
  final double price;
  final double rating;
  final int reviewCount;
  final List<String> additionalImages; // Tambahkan properti ini

  Product({
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.rating,
    required this.reviewCount,
    this.additionalImages = const [], // Inisialisasi dengan list kosong jika tidak ada gambar tambahan
  });
}