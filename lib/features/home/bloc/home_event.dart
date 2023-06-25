part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class HomeProductWislistButtonClickedEvent extends HomeEvent {}

//pending
class HomeProductCartButtonClickedEvent extends HomeEvent {}

//pending
class HomeWishlistButtonClickedEvent extends HomeEvent {}

class HomeCartButtonNavigationEvent extends HomeEvent {}
