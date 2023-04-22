import 'package:flutter/material.dart';

import '../../../models/categories.dart';
import 'category_card.dart';


class Categories extends StatelessWidget {
  const Categories({super.key, this.categories});

  final List<Category>? categories;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(categories?.length ?? 0,
            (index) => CategoryCard(category: categories![index])),
      ),
    );
  }
}
