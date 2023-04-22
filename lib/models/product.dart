class ProductModel {
  final int? price;
  final String? id, title, category, image, subTitle, description;

  ProductModel({
    this.price,
    this.id,
    this.title,
    this.category,
    this.image,
    this.subTitle,
    this.description,
  });

  //It creates a ProductModel from JSON
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      price: json['price'],
      title: json['title'],
      category: json['category'],
      image: json['image'],
      subTitle: json['subTitle'],
      description: json['description'],
    );
  }
}

//Our Demo Product
ProductModel demoProduct = ProductModel(
  id: "1",
  price: 1600,
  title: "Wood Frame",
  image: "https://i.imgur.com/sI4GvE6.png",
  category: "Chair",
  subTitle: "Tieton Armchair",
  description: demoDescription,
);

String demoDescription =
    "This armchair is an elegant and functional piece of furniture. It is suitable for family visits and parties with friends and perfect for relaxing in front of the TV after hard work.";
