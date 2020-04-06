import 'package:flutter/material.dart';

import 'OrderListDetail.dart';

class OrderCard extends StatelessWidget {
  var img;
  var name;
  var date;
  var id;
  OrderCard({this.img,this.name,this.date,this.id});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        child: ListTile(
          leading: Image.asset(img,height: 60,width: 60,),
          title: Text(name),
          subtitle: Text(date),
        ),
      ),
          onTap: (){
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => OrderListDetail()));
          },
    );
  }
}
