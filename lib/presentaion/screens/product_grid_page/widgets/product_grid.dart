import 'package:flutter/material.dart';
import 'package:test_project/data/models/product.dart';
import 'package:test_project/presentaion/screens/product_details/view/product_details.dart';
import 'package:intl/intl.dart';

class ProductGrid extends StatelessWidget {
  final List<Product> foods;

  const ProductGrid({Key key, this.foods}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var ratio = MediaQuery.of(context).devicePixelRatio;
    var height = MediaQuery.of(context).size.height;

    var f = NumberFormat("##,###.0#", "en_US");

    return SafeArea(
        child: Container(
            padding: EdgeInsets.symmetric(
                horizontal: ratio * 3.5, vertical: ratio * 5.5),
            height: double.infinity,
            width: double.infinity,
            child: GridView.builder(
                itemCount: foods.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.75,
                    mainAxisSpacing: 3,
                    crossAxisSpacing: 3),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProductDetails(
                                  title: foods[index].name,
                                  picture: foods[index].picture,
                                  name: foods[index].name,
                                  price: foods[index].price,
                                  details: foods[index].details)));
                    },
                    child: Hero(
                      tag: foods[index].name,
                      child: Card(
                          elevation: 2,
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(20),
                                          topRight: Radius.circular(20)),
                                      image: DecorationImage(
                                          fit: BoxFit.contain,
                                          image: AssetImage(
                                              foods[index].picture))),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(
                                    top: ratio * 2,
                                    bottom: ratio * 5.5,
                                    left: ratio * 5.5,
                                    right: ratio * 5.5),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      foods[index].name,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w900,
                                          fontSize: ratio * 6.5
                                      ),
                                    ),
                                    SizedBox(
                                      height: height * 0.006,
                                    ),
                                    Text(
                                        '${f.format(double.parse(foods[index].price.replaceAll(',', '')))} Tk',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w900,
                                            fontSize: ratio * 5.5,
                                            color: Colors.pink[300])),
                                  ],
                                ),
                              ),
                            ],
                          )),
                    ),
                  );
                })));
  }
}
