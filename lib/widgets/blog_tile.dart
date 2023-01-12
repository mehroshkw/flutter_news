import 'package:flutter/material.dart';

class BLogTile extends StatelessWidget {
  final String imageUrl, title, desc;
   BLogTile({required this.imageUrl, required this.title, required this.desc});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Image.network(""),
          Text(title),
          Text(desc),
          
        ],
      ),
    );
  }
}
