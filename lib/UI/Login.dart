import 'package:flutter/material.dart';
import 'package:flutter_awesome_alert_box/flutter_awesome_alert_box.dart';
import 'package:headup_loading/headup_loading.dart';

import 'package:resturant_app/UI/Food.dart';
import 'package:resturant_app/UI/Register.dart';
import 'package:resturant_app/model/DataBase.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var email = TextEditingController();
  var password = TextEditingController();

var fireDB = DataBase();
  RegisterBtn(){
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Register()));
  }

  LoginBtn(){
//    Navigator.pushReplacement(
//        context,
//        MaterialPageRoute(builder: (context) => Food()));
    HeadUpLoading.show(context);
    fireDB.submit(email.text.trim(), password.text.trim(),context).then((userId){



      // CircularProgressIndicator();
      if(userId != "not"){

        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Food(userId)));
        //  onSignIn();    // some error here on lesson 5 in 12:00 min almost, because no parameter given
      }else if(userId=="not") {
        // username or password are wrong
        print('wrong password');
        HeadUpLoading.hide();
        DangerAlertBox(context:context,title: "",messageText:"Email or password are wrong",buttonText: "close");

      }


    });

  }

@override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // backgroundColor: Colors.redAccent,
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            Positioned(
                top: 10,
                child: SizedBox(height: 200,
                  child: Image.asset('assets/restlogo.png', height: 200,),
                )
            ),
            Positioned(
                top:220,
                child: SizedBox(
                  height: 250,
                  child: Container(


                    width: 300,
                    decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.all(Radius.circular(15))
                    ),
                    child: Column(
                      children: <Widget>[

                        Padding(
                          padding: EdgeInsets.only(left: 10,right: 10,top: 20),
                          child:  Card(
                            child: TextFormField(
                              controller: email,
                              decoration: InputDecoration(
                                labelText: 'Enter your Email',
                                prefixIcon: Icon(Icons.email),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10,right: 10,top: 5),
                          child:  Card(
                            child: TextFormField(
                              controller: password,
                              obscureText: true,
                              decoration: InputDecoration(
                                labelText: 'Enter your Password',
                                prefixIcon: Icon(Icons.lock),


                              ),
                            ),
                          ),
                        ),
                        Row(
                          children: <Widget>[
                            Padding(
                                padding: EdgeInsets.only(top: 20,left: 14),
                                child:  FlatButton(onPressed: ()=>LoginBtn(),
                                  child:Text('Login'),
                                  color: Colors.green,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(4.0))),


                                )
                            ),
                            Padding(
                                padding: EdgeInsets.only(top: 20,left: 20),
                                child:  FlatButton(onPressed: ()=> RegisterBtn(),
                                  child:Text('Register'),
                                  color: Colors.redAccent,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(4.0))),


                                )
                            )
                          ],
                        )

                      ],
                    ),

                  ),
                )
            )
          ],
        )
      ),
    );
  }
}
