import 'dart:convert';

import 'package:flutter/material.dart';

import 'Data/food_data.dart';

class FoodDetail extends StatefulWidget {
  final Food food;
  const FoodDetail({Key key, this.food}) : super(key: key);

  @override
  _FoodDetailState createState() => _FoodDetailState();
}
class Order{
  String food;
  int price;

  Order(this.food,this.price);
  static List<Order> getOrder(){
    return <Order> [

    ];
}
}

class _FoodDetailState extends State<FoodDetail> {
  int value = 0;
  List<Food> foods;
  List<String> order=[];
   List<int> count = [];
  var getOrder;
  @override
  void initState() {
    super.initState();

    foods = Food.getFood;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.food.restaurant),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: widget.food.menu.length,
              itemBuilder: (context, index) => ListTile(
                title: Text(widget.food.menu[index]),
                // subtitle: Text(widget.food.count[index].toString()),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(widget.food.price[index].toString()),
                  IconButton(icon: Icon(Icons.add), onPressed:(){
                    setState(() {
                      value = value+widget.food.price[index];
                      print(value);
                      order.add(widget.food.menu[index]);
                      print(order);

                    });
                  }),
                ],
              ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 20),
            width: MediaQuery.of(context).size.width * 0.4,
            decoration: BoxDecoration(
              // color: Colors.red,
              border: Border.all(color: Colors.red,width: 2),
              borderRadius: BorderRadius.circular(13),
            ),
            child: FlatButton(
                child: Text("ราคา\t"+value.toString()+ "\tบาท",
                style: TextStyle(color: Colors.red),),
              onPressed: (){

                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Scaffold(
                  appBar: AppBar(
                    title: Text("รายการอาหาร"),
                    centerTitle: true,
                  ),
                  body: Column(
                    children: <Widget>[
                      Expanded(
                        child: ListView.builder(
                            itemCount: order.length,
                            itemBuilder: (context, index){
                              return Container(
                                margin: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  border: Border.all()
                                ),
                                child: ListTile(
                                  title: Text(order[index]),
                                  // trailing: Text(widget.food.price[index].toString()),
                                ),
                              );
                            }
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.all(20), 
                            decoration: BoxDecoration(

                              border: Border.all(color: Colors.green,),
                              borderRadius: BorderRadius.circular(13),

                            ),
                            child: FlatButton(
                              child: Text("ยืนยันการสั่งซื้อ",style: TextStyle(color: Colors.green),),
                            ),
                          ),
                          Spacer(),
                          Container(
                            margin: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              // border: Border.all(),

                            ),
                            child: Align(
                              alignment: Alignment.bottomRight,
                                child: Text("รวมทั้งหมด"+ value.toString()+"บาท",
                                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),)),
                          ),
                        ],
                      ),
                    ],
                  ),
                )));
              },
            ),
          ),
        ],
      ),
    );
  }
}






