import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../components/title_text.dart';
import '../../../constants.dart';
import '../../../models/product.dart';
import '../../../size_config.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.product,
    required this.press,
  });

  final ProductModel? product;
  final VoidCallback? press;

  @override
  Widget build(BuildContext context) {
    currency(context) {
      // Locale locale = Localizations.localeOf(context);
      var format =
          NumberFormat.simpleCurrency(locale: Platform.localeName, name: 'GHS');
      return format;
    }

    double defaultSize = SizeConfig.defaultSize;

    return GestureDetector(
      onTap: press,
      child: Container(
        width: defaultSize * 14.5, //145
        decoration: BoxDecoration(
            color: kSecondaryColor, borderRadius: BorderRadius.circular(30)),
        child: AspectRatio(
          aspectRatio: 0.693,
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: FadeInImage.assetNetwork(
                  placeholder: "assets/spinner.gif",
                  image: product?.image ?? "",
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: defaultSize),
                child: TitleText(title: product?.title ?? ""),
              ),
              SizedBox(
                height: defaultSize / 2,
              ),
              Text(
                "${currency(context).currencySymbol}${product!.price}",
              ),
              const Spacer()
            ],
          ),
        ),
      ),
    );
  }
}
