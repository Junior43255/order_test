class Food{
  String restaurant,foodType,foodDetail;
  List<String> menu;
  List<int> price,count;
  int id;
  Food({this.restaurant,this.foodType,this.foodDetail,this.id,this.menu,this.price,this.count});


  static final List<Food> getFood = [
    Food(
      restaurant: "ร้านป้ากุ้ง",
      foodType: "ตามสั่ง",
      menu: ["กะเพราหมูสับกะ","เพราหมูชิ้น"],
      price: [30,30],
      count: [0,0],
      id: 1,
    ),
    Food(
      restaurant: "ร้านลุงไก่",
      foodType: "ก๋วยเตี๋ยว",
      menu: ["ก๋วยเตี๋ยวต้มยำ","ก๋วยเตี๋ยวน้ำตก"],
      price: [40,35],
      count: [0,0],
      id: 2,
    ),
    Food(
      restaurant: "ร้านป้าแมว",
      foodType: "อาหารอีสาน",
      menu: ["ส้มตำ","คอหมูย่าง"],
      price: [35,50],
      count: [0,0],
      id: 3,
    ),
  ];
}