import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  var img;
  var name;
  var price;
  ItemCard({this.img,this.name,this.price});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: ClipRRect(
          borderRadius: new BorderRadius.circular(10.0),
          child: Image(
            fit: BoxFit.fill,
            image: AssetImage(img),
            width: 100.0,
            height: 100.0,
          ),
        ),
        title: Text(name),
        subtitle: Text(price),
      )
    );
  }
}
