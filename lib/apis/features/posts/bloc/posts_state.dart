part of 'posts_bloc.dart';

@immutable
abstract class PostsState {}

abstract class PostsActionState extends PostsState {}

class PostsInitial extends PostsState {}

class PostsFetchingLoadingState extends PostsState {}

// pending pda h ye vaala state
class PostsFetchingErrorState extends PostsState {}

class PostsFetchingSuccessfulState extends PostsState {
  final List<PostDataUiModel> posts;

  PostsFetchingSuccessfulState({required this.posts});
}
//