


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_awesome_alert_box/flutter_awesome_alert_box.dart';
import 'package:headup_loading/headup_loading.dart';
import 'package:resturant_app/UI/OrderObj.dart';

import 'auth.dart';




class DataBase{
 List<DetailOrder> orderDetail = new List();

  Firestore firestore = Firestore.instance;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  List<userInfo> userData = new List();


  Future<String> RegisterUser(String name,String email,String password,String phone)async{
    try{
      final AuthResult users = (await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      ));
      firestore.collection('user info').document(users.user.uid).setData(
          {
            'name': name,
            'email': email,
            'password': password,
            'phone':phone
          });
      return users.user.uid;
    }
    catch(error){
       print(error.toString());
      if(error.code == 'ERROR_EMAIL_ALREADY_IN_USE') {
        return null;
      }
    }

  }// end register

  Future<String> submit(String email,String password,BuildContext con) async{
    try {
      var auths = Auth();
      final String userId = await auths.signInWithEmailAndPassword(
          email, password);
      //sign in
      return userId;
    } catch(e){
     // not sign in
      HeadUpLoading.hide();
      return "not";
    }


  }

  UpdateAccount({var name,var phone,var userID,context}){
    print(userID);

      firestore.collection('user info').document(userID).setData(
          {'name': name,
            'phone': phone
          }, merge: true);
      SuccessAlertBox(context:context,title: 'Success',messageText: 'You have update successfully');


  }

  addOrder({List male,List price,List addition,delivery,totalPrice,rating}){
     var date = DateTime.now();
     var doc = firestore.collection('s').document().documentID;
     print(male);
     print(price);
     print(addition);
     _firebaseAuth.currentUser().then((userId){
       firestore.collection('user info').document(userId.uid).collection('order').document(doc).setData(
           {'name': 'order ID :${date.hashCode}',
             'date': '${date.day}/${date.month}/${date.year}'
           }, merge: true);

       firestore.collection('user info').document(userId.uid).collection('order').document(doc).collection('order detail')
           .document('userorder').setData(
           {'male': FieldValue.arrayUnion(male),
             'price': FieldValue.arrayUnion(price),
             'addition': FieldValue.arrayUnion(addition),
             'delivery':delivery,
             'total':totalPrice,
             'rating':rating
           });
     });




  }



 Future <List<DetailOrder>> FetchOrderDetail(userId,Itemid) async {

     await Firestore.instance.collection('user info').document(userId)
         .collection('order').document(Itemid).
     collection('order detail').document('userorder').get()
         .then((DocumentSnapshot ds) {
       
//         addition = List.from(ds['addition']);
//         male = List.from(ds['male']);
//         price = List.from(ds['price']);
//         delivery = ds['delivery'];
//         rating = ds['rating'];
//         TotalPrice = ds['total'];

     orderDetail.add(DetailOrder(addition:ds['addition'],male:ds['male'],price:ds['price'],delivery: ds['delivery'],rating: ds['rating'],totalprice: ds['total']  ));
       });
     return orderDetail;
  }

}