class Product {
  final String name;
  final String details;
  final String price;
  final String picture;

  Product({this.name, this.details, this.price, this.picture});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'details': details,
      'price': price,
      'picture': picture,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      name: map['name'],
      details: map['details'],
      price: map['price'],
      picture: map['picture'],
    );
  }
}
