import 'package:ecom/data/data.dart';
import 'package:ecom/widgets/appbar.dart';
import 'package:flutter/material.dart';

class ProductScreen extends StatelessWidget {
  ProductScreen({required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: kAppBar,
      body: Center(
        child: Container(
            height: MediaQuery.of(context).size.height * 0.50,
            width: MediaQuery.of(context).size.width * 0.7,
            child: Card(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.network(
                  data[index]['image'].toString(),
                  fit: BoxFit.fill,
                  scale: 5,
                ),
                Text(
                  data[index]['title'].toString(),
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  data[index]['price'].toString() + '\$',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ))),
      ),
    );
  }
}
