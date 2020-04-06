class OrderObj{
  var img;
  var price;
  var name;
  OrderObj({this.name,this.price,this.img});
}

class userOrder{

  var img;
  var name;
  var date;
  userOrder({this.img,this.name,this.date});
}

class finalOrder{
  var name;
  var price;
  finalOrder({this.name,this.price});
}