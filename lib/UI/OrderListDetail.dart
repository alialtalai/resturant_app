import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:grouped_buttons/grouped_buttons.dart';

import 'package:resturant_app/UI/ItemCard.dart';
import 'package:resturant_app/UI/OrderObj.dart';

class OrderListDetail extends StatefulWidget {


  @override
  _OrderListDetailState createState() => _OrderListDetailState();
}

class _OrderListDetailState extends State<OrderListDetail> {
  List<String> addition = new List();
  List<finalOrder> order = new List();
  var TotalPrice = 3.0;
  var delivery='Deliver to home';


  DeleteBtn(){
    RatingBar(
      initialRating: 3,
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
      itemBuilder: (context, _) => Icon(
        Icons.star,
        color: Colors.amber,
      ),
      onRatingUpdate: (rating) {
        print(rating);
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    setState(() {
     addition.clear();
     order.clear();

      addition.add('Mayo');
      addition.add('Suce');
      addition.add('Katshap');

      order.add(finalOrder(name:'beef burger',price:'1.2'));
      order.add(finalOrder(name:'checken burger',price:'1.2'));
      order.add(finalOrder(name:'pan cake',price:'0.8'));


    });



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

                    for(var i=0;i<order.length;i++)
                      DataRow(cells: [
                        DataCell(Text(order[i].name)),
                        DataCell(Text(order[i].price))
                      ])


                  ]




              ),
              Padding(child:Text('Total Price : $TotalPrice RO'),
              padding: EdgeInsets.only(top: 10),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('addition :'),
                    for(var i=0;i<addition.length;i++)
                      Text('${addition[i]},')
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text('Delivery : $delivery'),
              ),
              Padding(
                  padding: EdgeInsets.only(top: 20,bottom: 20),
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
      ),
    );
  }
}

