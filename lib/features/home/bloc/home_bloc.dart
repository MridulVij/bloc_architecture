import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:bloc_architecture/data/cart_items.dart';
import 'package:bloc_architecture/data/grocery_data.dart';
import 'package:bloc_architecture/data/wishlist_items.dart';
import 'package:flutter/gestures.dart';
import 'package:meta/meta.dart';

import '../models/home_product_data_model.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<HomeProductWislistButtonClickedEvent>(
        homeProductWislistButtonClickedEvent);
    on<HomeProductCartButtonClickedEvent>(homeProductCartButtonClickedEvent);
    on<HomeWishlistButtonNavigationEvent>(homeWishlistButtonNavigationEvent);
    on<HomeCartButtonNavigationEvent>(homeCartButtonNavigationEvent);
  }
  FutureOr<void> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    // because the data is fetched from locally not from any api
    await Future.delayed(Duration(seconds: 3));
    emit(HomeLoadedSuccessState(
        products: GroceryData.groceryProducts
            .map((e) => ProductDataModel(
                id: e['id'],
                name: e['name'],
                description: e['description'],
                price: e['price'],
                imageUrl: e['imageUrl']))
            .toList()));
  }

  FutureOr<void> homeProductWislistButtonClickedEvent(
      HomeProductWislistButtonClickedEvent event, Emitter<HomeState> emit) {
    print('Wishlist Product Clicked');
    wishlistItems.add(event.clickedProduct);
    emit(HomeProductItemWishlistActionState());
  }

  FutureOr<void> homeProductCartButtonClickedEvent(
      HomeProductCartButtonClickedEvent event, Emitter<HomeState> emit) {
    print('Cart Product Clicked');
    cartItems.add(event.clickedProduct);
    emit(HomeProductItemCartActionState());
    //emit(HomeNavigateToWishlistPageActionState());
  }

  FutureOr<void> homeWishlistButtonNavigationEvent(
      HomeWishlistButtonNavigationEvent event, Emitter<HomeState> emit) {
    print('Wishlist Clicked');
    emit(HomeNavigateToCartPageActionState());
  }

  FutureOr<void> homeCartButtonNavigationEvent(
      HomeCartButtonNavigationEvent event, Emitter<HomeState> emit) {
    print('Cart Clicked');
    emit(HomeNavigateToWishlistPageActionState());
  }
}
