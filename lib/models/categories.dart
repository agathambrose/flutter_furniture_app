class Category {
  final String? id, title, image;
  final int numOfProducts;

  Category({this.id, this.title, this.image, required this.numOfProducts});

  //It creates a Category from JSON
  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
        id: json['id'],
        title: json['title'],
        image: json['image'],
        numOfProducts: json["numOfProducts"]);
  }
}

//Our demo Category
Category category = Category(
    id: "1",
    title: "Twin Stool",
    image:
        "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcS0a7W0MNbRPIjZbL9wELfbveUKaSlqw3fPZg4H3Or0-S7NIKTLz353TVRz9hEImpGzl2g2JPORkg&usqp=CAc",
    numOfProducts: 100);
