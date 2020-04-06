import 'package:flutter/material.dart';

import 'package:resturant_app/UI/Food.dart';
import 'package:resturant_app/UI/Register.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override

  RegisterBtn(){
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Register()));
  }

  LoginBtn(){
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Food()));
  }


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
