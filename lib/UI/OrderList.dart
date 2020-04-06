import 'package:flutter/material.dart';

import 'package:resturant_app/UI/OrderListCard.dart';
import 'package:resturant_app/UI/OrderObj.dart';


class OrderList extends StatefulWidget {
  @override
  _OrderListState createState() => _OrderListState();
}

class _OrderListState extends State<OrderList> {
  List<userOrder> order = new List();


  @override
  Widget build(BuildContext context) {
    var date = DateTime.now();
    order.add(userOrder(img: 'assets/profile.png',name: 'order',date: '${date.day}/${date.month}/${date.year}'));
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.amber,),
      body: Container(
        child: ListView.builder(
            itemCount:order.length,
            itemBuilder: (context,index){

              return OrderCard(img: order[index].img,name: order[index].name,date: order[index].date,);
            }),
      ),
    );
  }
}
