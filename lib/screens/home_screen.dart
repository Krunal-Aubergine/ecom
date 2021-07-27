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
        // controller: _scrollController,
        itemCount: data.length,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            child: Card(
              margin: EdgeInsets.all(7),
              elevation: 3.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    // alignment: Alignment.center,
                    child: Image.network(
                      data[index]['image'].toString(),
                      height: 100,
                      width: 140,
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    data[index]['title'].toString(),
                    overflow: TextOverflow.clip,
                    softWrap: true,
                  )
                ],
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
