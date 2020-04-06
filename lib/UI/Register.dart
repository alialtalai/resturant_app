import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  var name = TextEditingController();
  var phone = TextEditingController();
  var email = TextEditingController();
  var password = TextEditingController();

  RegiserBtn() {
    print(name.text);
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


