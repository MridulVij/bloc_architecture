part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class HomeInitialEvent extends HomeEvent {}

// pending
class HomeProductWislistButtonClickedEvent extends HomeEvent {}

//pending
class HomeProductCartButtonClickedEvent extends HomeEvent {}

class HomeWishlistButtonNavigationEvent extends HomeEvent {}

class HomeCartButtonNavigationEvent extends HomeEvent {}
