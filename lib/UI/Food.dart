import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:resturant_app/UI/Account.dart';
import 'package:resturant_app/UI/CheckOut.dart';
import 'package:resturant_app/UI/OrderList.dart';
import 'package:resturant_app/UI/OrderObj.dart';
import 'package:resturant_app/model/DataBase.dart';

class Food extends StatefulWidget {
  var userID;
 Food(this.userID);
  @override
  _FoodState createState() => _FoodState();
}

class _FoodState extends State<Food> {

  var userID;
  var name='User1';
  var email ='exampe@mail.com';
  var items ='';
  List<OrderObj> UserOrder = new List();

  CheckoutBtn(){
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => CheckOut(UserOrder: UserOrder,)));

  }

  AddItem(var img,var price,var name){

    setState(() {
      UserOrder.add(OrderObj(name: name,img: img,price: price));

    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {

      FirebaseAuth.instance.currentUser().then((userid) {
        Firestore.instance
            .collection('user info')
            .document(userid.uid)
            .get()
            .then((DocumentSnapshot ds) {
          // use ds as a snapshot
          setState(() {
            name = ds['name'];
            email = ds['email'];
          });

        });
      });

    });

  }

  @override
  Widget build(BuildContext context) {
    FirebaseAuth.instance.currentUser().then((userid) {
      Firestore.instance
          .collection('user info')
          .document(userid.uid)
          .get()
          .then((DocumentSnapshot ds) {
        // use ds as a snapshot
        setState(() {
          userID = userid.uid;
          name = ds['name'];
          email = ds['email'];
        });

      });
    });

    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.amber,
        ),
      drawer: Drawer(

        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.amber),
                accountName: Text('$name'),
                accountEmail: Text('$email'),
                currentAccountPicture: ClipOval(
                  child: Image.asset(
                    'assets/profile.png',
                    fit: BoxFit.cover,
                  ),
                )),
            ListTile(
              leading: Icon(Icons.account_box),
              title: Text('My account'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Account()));
              },
            ),
            ListTile(
              leading: Icon(Icons.shopping_basket),
              title: Text('My Order'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => OrderList(userId:userID)));
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ConstrainedBox(
              constraints: BoxConstraints(maxHeight:500 ),
              child: GridView.count(
                crossAxisCount: 2,

                children: <Widget>[
                  Card(
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 110,
                          width: double.infinity,
                          child: Image.asset('assets/burger.jpg', height: 100,
                            fit: BoxFit.cover,),
                        ),
                        Text('Beef Burger', style: TextStyle(fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.w400),),
                        Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 5.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text('1.2 RO'),
                                GestureDetector(
                                  child: Container(

                                    child: Text(
                                      'add', style: TextStyle(fontSize: 16),),
                                    padding: EdgeInsets.only(
                                        top: 2, bottom: 2, right: 5, left: 5),
                                    decoration: BoxDecoration(
                                      color: Colors.amber,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(4)),

                                    ),

                                  ),
                                  onTap:() => AddItem('assets/burger.jpg', '1.2', 'Beef Burger') ,
                                )
                              ],
                            )
                        )

                      ],
                    ),
                  ),
                  Card(
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 110,
                          width: double.infinity,
                          child: Image.asset(
                            'assets/checkenBurger.jpg', height: 100,
                            fit: BoxFit.cover,),
                        ),

                        Text('Checken Burger', style: TextStyle(fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.w400),),
                        Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 5.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text('1.2 RO'),
                                GestureDetector(
                                  child: Container(

                                    child: Text(
                                      'add', style: TextStyle(fontSize: 16),),
                                    padding: EdgeInsets.only(
                                        top: 2, bottom: 2, right: 5, left: 5),
                                    decoration: BoxDecoration(
                                      color: Colors.amber,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(4)),

                                    ),

                                  ),
                                  onTap: ()=>AddItem('assets/checkenBurger.jpg', '1.2', 'Checken Burger'),
                                )
                              ],
                            )
                        )

                      ],
                    ),
                  ),
                  Card(
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 110,
                          width: double.infinity,
                          child: Image.asset('assets/pancake.jpg', height: 100,
                            fit: BoxFit.cover,),
                        ),
                        Text('PanCake', style: TextStyle(fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.w400),),
                        Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 5.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text('0.8 RO'),
                                GestureDetector(
                                  child: Container(

                                    child: Text(
                                      'add', style: TextStyle(fontSize: 16),),
                                    padding: EdgeInsets.only(
                                        top: 2, bottom: 2, right: 5, left: 5),
                                    decoration: BoxDecoration(
                                      color: Colors.amber,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(4)),

                                    ),

                                  ),
                                  onTap: () => AddItem('assets/pancake.jpg', '0.8', 'PanCake'),
                                )
                              ],
                            )
                        )

                      ],
                    ),
                  ),
                  Card(
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 110,
                          width: double.infinity,
                          child: Image.asset(
                            'assets/chesscake.jpeg', height: 100,
                            fit: BoxFit.cover,),
                        ),
                        Text('Chess Cake', style: TextStyle(fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.w400),),
                        Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 5.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text('1.5 RO'),
                                GestureDetector(
                                  child: Container(

                                    child: Text(
                                      'add', style: TextStyle(fontSize: 16),),
                                    padding: EdgeInsets.only(
                                        top: 2, bottom: 2, right: 5, left: 5),
                                    decoration: BoxDecoration(
                                      color: Colors.amber,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(4)),

                                    ),

                                  ),
                                  onTap: () =>AddItem('assets/chesscake.jpeg', '1.5', 'Chess Cake'),
                                )
                              ],
                            )
                        )

                      ],
                    ),
                  ),
                  Card(
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 110,
                          width: double.infinity,
                          child: Image.asset('assets/avocado.jpeg', height: 100,
                            fit: BoxFit.cover,),
                        ),
                        Text('Avocado Juice', style: TextStyle(fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.w400),),
                        Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 5.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text('1.5 RO'),
                                GestureDetector(
                                  child: Container(

                                    child: Text(
                                      'add', style: TextStyle(fontSize: 16),),
                                    padding: EdgeInsets.only(
                                        top: 2, bottom: 2, right: 5, left: 5),
                                    decoration: BoxDecoration(
                                      color: Colors.amber,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(4)),

                                    ),

                                  ),
                                  onTap: () =>AddItem('assets/avocado.jpeg', '1.5', 'Avocado Juice'),
                                )
                              ],
                            )
                        )

                      ],
                    ),
                  ),
                  Card(
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 110,
                          width: double.infinity,
                          child: Image.asset('assets/orange.jpg', height: 100,
                            fit: BoxFit.cover,),
                        ),
                        Text('Orange Juice', style: TextStyle(fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.w400),),
                        Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 5.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text('1.0 RO'),
                                GestureDetector(
                                  child: Container(

                                    child: Text(
                                      'add', style: TextStyle(fontSize: 16),),
                                    padding: EdgeInsets.only(
                                        top: 2, bottom: 2, right: 5, left: 5),
                                    decoration: BoxDecoration(
                                      color: Colors.amber,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(4)),

                                    ),

                                  ),
                                  onTap: ()=>AddItem('assets/orange.jpg', '1.0', 'Orange Juice'),
                                )
                              ],
                            )
                        )

                      ],
                    ),
                  ),

                ],

              ),
        ),
            Padding(
              padding: EdgeInsets.only(top: 20,bottom: 20),
                child:RaisedButton(onPressed: () => CheckoutBtn(),
                  child: Text('(${UserOrder.length}) CheckOut',style: TextStyle(fontSize: 24,fontWeight: FontWeight.w400),),
                  shape:RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0),
                      side: BorderSide(color: Colors.amber)
                  ),
                  padding: EdgeInsets.symmetric(vertical: 9.0,horizontal: 40.0),
                  color: Colors.amber,
                )
            )
          ],
        )
      )
    );
  }



}


