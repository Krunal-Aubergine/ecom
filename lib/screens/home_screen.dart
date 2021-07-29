import 'package:ecom/data/data.dart';
import 'package:ecom/screens/product_detail_screen.dart';
import 'package:ecom/widgets/appbar.dart';
import 'package:ecom/widgets/drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  //final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: kAppBar,
      body: GridView.builder(
        padding: EdgeInsets.all(15),
        // controller: _scrollController,
        itemCount: data.length,
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 400,
          childAspectRatio: 4 / 3,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
        ),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            child: Card(
              clipBehavior: Clip.antiAlias,
              elevation: 8,
              margin: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              child: GridTile(
                child: Image.network(
                  "${data[index]['image']}",
                  fit: BoxFit.cover,
                ),
                footer: Container(
                  padding: EdgeInsets.all(15),
                  height: 60,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Colors.transparent, Colors.black],
                          stops: [0.0, 0.7],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter)),
                  child: Text(
                    "${data[index]['title']}",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ProductScreen(index: index)));
            },
          );
        },
      ),
    );
  }
}
