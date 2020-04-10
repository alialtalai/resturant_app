import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_awesome_alert_box/flutter_awesome_alert_box.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:resturant_app/UI/OrderObj.dart';
import 'package:resturant_app/model/DataBase.dart';

import 'OrderList.dart';

class OrderListDetail extends StatefulWidget {
  List<DetailOrder> order ;
  var userId;
  var itemId;
  OrderListDetail({this.order,this.userId,this.itemId});

  @override
  _OrderListDetailState createState() => _OrderListDetailState();
}

class _OrderListDetailState extends State<OrderListDetail> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();





  }




  DeleteBtn(){
    DeleteAlertBox(context: context,infoMessage: 'Are you sure want to delete the order?',title: 'Delete Order',
    onPressedYes: (){
      Firestore.instance.collection('user info').document(widget.userId)
          .collection('order').document(widget.itemId).delete();
      Navigator.pop(context);
      Navigator.pop(
          context,
          MaterialPageRoute(builder: (context) =>OrderList()));
    }

    );
  }


  @override
  Widget build(BuildContext context) {








    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.amber,),
      body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: <Widget>[
                Padding(
                  child:Text('Your Order',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 30,color: Colors.amber),) ,
                  padding: EdgeInsets.only(top: 30),),
                DataTable(

                    columns: [
                      DataColumn(label: Text('Male Name')),
                      DataColumn(label: Text('Price'))

                    ],

                    rows: [

                      for(var i=0;i<widget.order[0].male.length;i++)
                        DataRow(cells: [
                          DataCell(Text(widget.order[0].male[i])),
                          DataCell(Text(widget.order[0].price[i]))
                        ])


                    ]




                ),
                Padding(child:Text('Total Price : ${widget.order[0].totalprice} RO'),
                  padding: EdgeInsets.only(top: 10),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('addition :'),
                      for(var i=0;i<widget.order[0].addition.length;i++)
                        Text('${widget.order[0].addition[i]},')
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Text('Delivery : ${widget.order[0].delivery}'),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Text('Rating : ${widget.order[0].rating}'),
                ),
                Padding(
                    padding: EdgeInsets.only(top: 30,bottom: 20),
                    child:RaisedButton(onPressed: () => DeleteBtn(),
                      child: Text('Delete',style: TextStyle(fontSize: 24,fontWeight: FontWeight.w400),),
                      shape:RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0),
                          side: BorderSide(color: Colors.red)
                      ),
                      padding: EdgeInsets.symmetric(vertical: 9.0,horizontal: 40.0),
                      color: Colors.red,
                    )
                ),



              ],
            ),
          )
      )
    );
  }
}

