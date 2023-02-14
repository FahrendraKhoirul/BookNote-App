import 'package:booknote/constants.dart';
import 'package:booknote/view/components/shop_desc_widgets.dart';
import 'package:flutter/material.dart';

class ShopDesc extends StatelessWidget {
  const ShopDesc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding / 2),
          child: Column(
            children: [
              CoverCard(),
              Description(),
              ButtonShop(),
            ],
          ),
        ),
      ),
    );
  }
}
