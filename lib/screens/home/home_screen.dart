import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants.dart';
import '../../size_config.dart';
import 'components/body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //it helps make the UI responsive
    SizeConfig().init(context);
    return Scaffold(
        appBar: buildAppBar(),
        body: const Body(),
        );
  }

  AppBar buildAppBar() {
    return AppBar(
    leading: IconButton(
      icon: SvgPicture.asset(
        "assets/icons/menu.svg",
        height: SizeConfig.defaultSize * 2, //20
      ),
      onPressed: () {},
    ),
    actions: [
      IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            "assets/icons/scan.svg",
            height: SizeConfig.defaultSize * 2.4, //24
          )),
      const Center(
        child: Text(
          "Scan",
          style: TextStyle(color: kTextColor, fontWeight: FontWeight.bold),
        ),
      ),
      SizedBox(width: SizeConfig.defaultSize),
    ],
  );
  }
}
