import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:resturant_app/model/DataBase.dart';

class Account extends StatefulWidget {
  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  var name = TextEditingController();
  var phone = TextEditingController();
 var userId;
  var fireDB = DataBase();

  UpdateBtn() {
    fireDB.UpdateAccount(name: name.text.trim(),phone: phone.text.trim(),userID:userId,context: context );
  }



  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    FirebaseAuth.instance.currentUser().then((userid) {
      Firestore.instance
          .collection('user info')
          .document(userid.uid)
          .get()
          .then((DocumentSnapshot ds) {
        // use ds as a snapshot
        setState(() {
          userId = userid.uid;
          name.text = ds['name'];
          phone.text = ds['phone'];
        });



      });
    });

  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.amber,elevation: 0,),
      backgroundColor: Colors.amber,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 30),
              child: Text('My Account',style: TextStyle(fontSize: 50,fontWeight: FontWeight.w600),),
            ),
            Padding(
                padding: EdgeInsets.only(left: 30,right: 30,top:30),
                child: Container(
                  child: TextFormField(
                    controller: name,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Enter Your name',
                        prefixIcon: Icon(Icons.person)
                    ),
                  ),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(45))
                  ),
                )

            ),
            Padding(
                padding: EdgeInsets.only(left: 30,right: 30,top:10),
                child: Container(
                  child: TextFormField(
                    controller: phone,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Enter Your Phone',
                        prefixIcon: Icon(Icons.phone)
                    ),
                  ),
                  decoration: BoxDecoration(
                      color:Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(45))
                  ),
                )

            ),

            FittedBox(
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.only(top:25),
                      child: FlatButton(onPressed: ()=>UpdateBtn(),
                        child:Text('Update',style: TextStyle(fontSize: 18),),
                        color: Colors.green,
                        padding: EdgeInsets.only(left: 38,right: 38,top: 10,bottom: 10),
                      )

                  ),

                ],
              )
            )
          ],
        ),
      ),
    );
  }
}