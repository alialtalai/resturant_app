import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_awesome_alert_box/flutter_awesome_alert_box.dart';
import 'package:resturant_app/model/DataBase.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  var name = TextEditingController();
  var phone = TextEditingController();
  var email = TextEditingController();
  var password = TextEditingController();
  var fireDB = DataBase();

  RegiserBtn() {
    if (name.text.isEmpty || phone.text.isEmpty)
      InfoAlertBox(context: context, infoMessage: 'All Field are required',title: 'Alert');
    else if(email.text.isEmpty || phone.text.isEmpty)
      InfoAlertBox(context: context, infoMessage: 'All Field are required',title: 'Alert');
    else{
      fireDB.RegisterUser(name.text, email.text, password.text, phone.text).then((userID){
       if(userID != null)
         SuccessAlertBox(context: context,messageText: 'You register successfully',title: 'Successful');
       else{
         InfoAlertBox(context: context, infoMessage: 'Email is used before',title: 'Alert');

       }

      });

    }


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
                child: Text('Register',style: TextStyle(fontSize: 50,fontWeight: FontWeight.w600),),
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
                    keyboardType: TextInputType.numberWithOptions(),
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
            Padding(
                padding: EdgeInsets.only(left: 30,right: 30,top:10),
                child: Container(
                  child: TextFormField(
                    controller: email,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Enter Your Email',
                        prefixIcon: Icon(Icons.email)
                    ),
                  ),
                  decoration: BoxDecoration(
                    color:Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(45))
                  ),
                )

            ),
            Padding(
                padding: EdgeInsets.only(left: 30,right: 30,top:10),
                child: Container(
                  child: TextFormField(
                    controller: password,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Enter Your Password',
                        prefixIcon: Icon(Icons.lock)
                    ),
                  ),
                  decoration: BoxDecoration(
                    color:Colors.white, 
                    borderRadius: BorderRadius.all(Radius.circular(45))
                  ),
                )

            ),
            Padding(
                padding: EdgeInsets.only(left: 30,right: 30,top:30),
                child: FlatButton(onPressed: ()=>RegiserBtn(),
                    child:Text('Register',style: TextStyle(fontSize: 18),),
                    color: Colors.green,
                  padding: EdgeInsets.only(left: 100,right: 100,top: 10,bottom: 10),
                )

            )
          ],
        ),
      ),
    );
  }
}


