class OrderObj{
  var img;
  var price;
  var name;
  OrderObj({this.name,this.price,this.img});
}

class userOrder{


  var name;
  var date;
  var id;
  userOrder({this.name,this.date,this.id});
}

class DetailOrder{
  List addition ;
  List male ;
  List price ;
  var totalprice ;
  var delivery ;
  var rating ;
  DetailOrder({this.addition,this.male,this.price,this.totalprice,this.delivery,this.rating});
}

class userInfo{
  var name;
  var email;
  userInfo({this.name,this.email});
}