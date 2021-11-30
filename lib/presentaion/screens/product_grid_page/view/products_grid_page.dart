import 'package:flutter/material.dart';
import 'package:test_project/data/models/product.dart';
import 'package:test_project/data/providers/product_provider.dart';
import 'package:test_project/presentaion/screens/product_grid_page/widgets/product_grid.dart';

class ProductGridPage extends StatefulWidget {
  final String title;

  const ProductGridPage({Key key, this.title}) : super(key: key);

  @override
  State<ProductGridPage> createState() => _ProductGridPageState();
}

class _ProductGridPageState extends State<ProductGridPage> {
  ProductProvider _product;
  List<Product> foods;

  @override
  void initState() {
    super.initState();
    _product = ProductProvider();
    foods = _product.fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: ProductGrid(
        foods: foods,
      ),
    );
  }
}
