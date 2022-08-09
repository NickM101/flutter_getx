import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: Icon(
          Icons.arrow_back_ios,
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.shopping_cart,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: Column(
          children: [
      Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            child: Text(
              'ShopX',
              style: TextStyle(
                  fontFamily: 'avenir',
                  fontSize: 32,
                  fontWeight: FontWeight.w900),
            ),
          ),
          IconButton(
              icon: Icon(Icons.view_list_rounded), onPressed: () {}),
          IconButton(icon: Icon(Icons.grid_view), onPressed: () {}),
        ],
      ),
    )]),);
  }
}
