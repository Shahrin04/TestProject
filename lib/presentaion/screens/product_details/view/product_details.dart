import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ProductDetails extends StatelessWidget {
  final String title;
  final String picture;
  final String name;
  final String price;
  final String details;

  const ProductDetails(
      {Key key,
      @required this.title,
      @required this.picture,
      @required this.name,
      @required this.price,
      @required this.details})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var ratio = MediaQuery.of(context).devicePixelRatio;

    var f = NumberFormat("##,###.0#", "en_US");

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(title),
        ),
        body: Column(
          children: [
            SizedBox(
              height: height * 0.01,
            ),
            Hero(
              tag: name,
              child:
                  SizedBox(height: height * 0.3, child: Image.asset(picture)),
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(
                  top: ratio * 3.5, left: ratio * 3.5, right: ratio * 3.5),
              height: height * 0.09,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                        fontWeight: FontWeight.w900, fontSize: ratio * 7.2),
                  ),
                  SizedBox(
                    height: height * 0.006,
                  ),
                  Text(
                      '${f.format(double.parse(price.replaceAll(',', '')))} Tk',
                      style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: ratio * 7,
                          color: Colors.pink[300])),
                ],
              ),
            ),
            const Divider(thickness: 1),
            Container(
              padding:
                  EdgeInsets.symmetric(horizontal: ratio * 3.5, vertical: 0),
              height: height * 0.2,
              child: SingleChildScrollView(
                child: Text(
                  details,
                  style: TextStyle(
                      fontSize: ratio * 7, fontWeight: FontWeight.w400),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            const Divider(
              thickness: 1,
            ),
            SizedBox(height: height * 0.04),
            SizedBox(
              width: width * 0.8,
              child: MaterialButton(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                onPressed: () async {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(
                          '$name price is ${f.format(double.parse(price.replaceAll(',', '')))} Tk')));
                },
                color: Colors.blue,
                child: Text(
                  'Buy',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                      fontSize: ratio * 5.8),
                ),
              ),
            ),
          ],
        ));
  }
}
