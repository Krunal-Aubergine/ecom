import 'package:ecom/colors.dart';
import 'package:ecom/data/data.dart';
import 'package:ecom/screens/home_screen.dart';
import 'package:ecom/widgets/appbar.dart';
import 'package:ecom/widgets/drawer.dart';
import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  CategoriesScreen({Key? key}) : super(key: key);
  var categoris = [
    "All",
    "jewelery",
    "men's clothing",
    "women's clothing",
    "electronics"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: kAppBar,
      drawer: NavDrawer(),
      body: Container(
        margin: EdgeInsets.all(20),
        child: ListView.builder(
            itemCount: categoris.length,
            itemBuilder: (context, index) => Container(
                  margin: EdgeInsets.symmetric(vertical: 5),
                  decoration: BoxDecoration(
                      color: Colors.blueGrey[900],
                      borderRadius: BorderRadius.circular(15)),
                  child: ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomeScreen()));
                    },
                    title: Text(
                      categoris[index],
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )),
      ),
    );
  }
}
