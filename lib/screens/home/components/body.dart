import 'package:flutter/material.dart';

import '../../../components/title_text.dart';
import '../../../models/product.dart';
import '../../../services/fetch_categories.dart';
import '../../../services/fetch_products.dart';
import '../../../size_config.dart';
import 'categories.dart';
import 'product_card.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;

    //it enables scrolling
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(defaultSize * 2), //20
            child: const TitleText(title: "Browse by Categories"),
          ),
          FutureBuilder(
              future: fetchCategories(),
              builder: (context, snapshot) => snapshot.hasData
                  ? Categories(categories: snapshot.data!)
                  : Center(child: Image.asset("assets/ripple.gif"))),
          const Divider(
            height: 5,
          ),
          Padding(
            padding: EdgeInsets.all(defaultSize * 2), //20
            child: const TitleText(title: "Recommended For You"),
          ),
          //Right here, product is our demo product
          FutureBuilder(
              future: fetchProducts(),
              builder: (context, snapshot) {
                // print(snapshot.data);
                return snapshot.hasData
                    ? RecommendedProducts(
                        products: snapshot.data as List<ProductModel>)
                    : Center(child: Image.asset('assets/ripple.gif'));
              })
        ],
      ),
    );
  }
}

class RecommendedProducts extends StatelessWidget {
  const RecommendedProducts({
    Key? key,
    required this.products,
  }) : super(key: key);
  //because our Api provides us a list of products
  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;

    return Padding(
      padding: EdgeInsets.all(defaultSize * 2), //20
      child: GridView.builder(
          //this turns off gridview scrolling
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          //just for demo
          itemCount: 6,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.693,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20),
          itemBuilder: (context, index) => ProductCard(
                product: products[index],
                press: () {
                  // Navigator.pushNamed(context, "/details");
                },
              )),
    );
  }
}
