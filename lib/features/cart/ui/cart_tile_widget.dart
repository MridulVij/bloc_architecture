import 'package:flutter/material.dart';

import '../../home/bloc/home_bloc.dart';
import '../../home/models/home_product_data_model.dart';
import '../bloc/cart_bloc.dart';

class CartTileWidget extends StatelessWidget {
  final ProductDataModel productDataModel;
  final CartBloc cartBloc;
  const CartTileWidget(
      {super.key, required this.productDataModel, required this.cartBloc});

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
                          // homeBloc.add(
                          //   HomeProductWislistButtonClickedEvent(
                          //       clickedProduct: productDataModel),
                          // );
                          //homeBloc.add(HomeWishlistButtonNavigationEvent());
                        },
                        icon: Icon(Icons.favorite_border)),
                    IconButton(
                        onPressed: () {
                          // homeBloc.add(HomeProductCartButtonClickedEvent(
                          //     clickedProduct: productDataModel));
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
