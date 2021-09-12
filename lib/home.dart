import 'package:flutter/material.dart';
import 'package:order_test/food_detail.dart';
import 'package:order_test/widget/search_widget.dart';

import 'Data/food_data.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Food> foods;
  String query = '';

  @override
  void initState() {
    super.initState();

    foods = Food.getFood;

    if (foods.length >foods.length){
      setState(() {
        foods.length--;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Restaurant"),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          search(),
          Expanded(
                child: ListView.builder(
                  itemCount: foods.length,
                  itemBuilder: (context, index) => InkWell(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>FoodDetail(food: foods[index],)));
                    },
                    child: Restaurant(
                      food: foods[index],
                    ),
                  ),
                ),
              ),
        ],
      ),
    );
  }

  Widget search() => SearchWidget(
    text: query,
    hintText: 'ค้นหาอาหาร',
    onChanged: searchFood,
  );

  void searchFood(String query){
    final foods = Food.getFood.where((food) {
      final titleLower = food.foodType.toLowerCase();
      final searchLower = query.toLowerCase();

      return titleLower.contains(searchLower);
    }).toList();

    setState(() {
      this.query = query;
      this.foods = foods;
    });
  }
}

class Restaurant extends StatelessWidget {
  final Food food;

  const Restaurant({Key key, this.food}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        title: Text(food.restaurant),
        subtitle: Text(food.foodType),
      ),
    );
  }
}
