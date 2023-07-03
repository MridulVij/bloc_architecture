part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class HomeInitialEvent extends HomeEvent {}

// pending
class HomeProductWislistButtonClickedEvent extends HomeEvent {
  final ProductDataModel clickedProduct;

  HomeProductWislistButtonClickedEvent({required this.clickedProduct});
}

//pending
class HomeProductCartButtonClickedEvent extends HomeEvent {
  final ProductDataModel clickedProduct;

  HomeProductCartButtonClickedEvent({required this.clickedProduct});
}

class HomeWishlistButtonNavigationEvent extends HomeEvent {}

class HomeCartButtonNavigationEvent extends HomeEvent {}
