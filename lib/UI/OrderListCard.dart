import 'package:flutter/material.dart';
import 'package:headup_loading/headup_loading.dart';
import 'package:resturant_app/model/DataBase.dart';

import 'OrderListDetail.dart';

class OrderCard extends StatelessWidget {

  var name;
  var date;
  var id;
  var userId;
  OrderCard({this.name,this.date,this.id,this.userId});

  var fireDB =DataBase();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        child: ListTile(
          leading: Image.asset('assets/profile.png',height: 60,width: 60,),
          title: Text(name),
          subtitle: Text(date),
        ),
      ),
          onTap: (){
            HeadUpLoading.show(context);
        fireDB.FetchOrderDetail(userId, id).then((detailList){
          HeadUpLoading.hide();
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => OrderListDetail(order: detailList,userId: userId,itemId: id,)));
        });

          },
    );
  }
}
