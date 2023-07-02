import 'package:flutter/material.dart';

import '../bloc/home_bloc.dart';
import '../models/home_product_data_model.dart';

class ProductTileWidget extends StatelessWidget {
  final ProductDataModel productDataModel;
  final HomeBloc homeBloc;
  const ProductTileWidget(
      {super.key, required this.productDataModel, required this.homeBloc});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(width: 1, color: Colors.grey)),
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              width: double.maxFinite,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(productDataModel.imageUrl))),
            ),
            Text(productDataModel.name),
            Text(productDataModel.description),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("\$" + productDataModel.price.toString()),
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          homeBloc.add(HomeProductWislistButtonClickedEvent());
                          //homeBloc.add(HomeWishlistButtonNavigationEvent());
                        },
                        icon: Icon(Icons.favorite_border)),
                    IconButton(
                        onPressed: () {
                          homeBloc.add(HomeProductCartButtonClickedEvent());
                          //homeBloc.add(HomeCartButtonNavigationEvent());
                        },
                        icon: Icon(Icons.shopping_bag_outlined)),
                  ],
                )
              ],
            ),
          ],
        ));
  }
}
