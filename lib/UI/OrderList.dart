import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:resturant_app/UI/OrderListCard.dart';
import 'package:resturant_app/UI/OrderObj.dart';
import 'package:resturant_app/model/DataBase.dart';


class OrderList extends StatefulWidget {
  var userId;
  OrderList({this.userId});
  @override
  _OrderListState createState() => _OrderListState();
}

class _OrderListState extends State<OrderList> {


@override
  void initState() {
    // TODO: implement initState
    super.initState();



  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.amber,),
      body: Container(
          child: StreamBuilder<QuerySnapshot>(
              stream: Firestore.instance.collection('user info').document(widget.userId).collection('order').snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError)
                  return new Text('Error: ${snapshot.error}');
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return new Text('Loading...');
                  default:
                    return ListView.builder(
                        itemCount:snapshot.data.documents.length,
                        itemBuilder: (context, index) {

                          return OrderCard(
                              name: snapshot.data.documents[index].data['name'],
                              date: snapshot.data.documents[index].data['date'],
                              id: snapshot.data.documents[index].documentID,
                                userId: widget.userId
                          );
                        });
                }
              })
      ),
    );
  }
}
