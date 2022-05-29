class Product {
  final String name;
  final double price;
  final String imageUrl;

  const Product(
      {required this.name, required this.price, required this.imageUrl});

  static const List<Product> products = [
    Product(
      name: "Product",
      price: 25000,
      imageUrl: "http://",
    ),
    Product(
      name: "Product",
      price: 25000,
      imageUrl: "http://",
    ),
  ];
}
