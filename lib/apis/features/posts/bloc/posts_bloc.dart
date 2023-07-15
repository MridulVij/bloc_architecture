import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../models/post_data_ui_model.dart';
import '../repos/post_repo.dart';

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  PostsBloc() : super(PostsInitial()) {
    on<PostsInitialFetchEvent>(postsInitialFetchEvent);
    on<PostAddEvent>(postAddEvent);
  }

  FutureOr<void> postsInitialFetchEvent(
      PostsInitialFetchEvent event, Emitter<PostsState> emit) async {
    //
    emit(PostsFetchingLoadingState());
    List<PostDataUiModel> posts = await PostsRepo.fetchPost();
    emit(PostsFetchingSuccessfulState(posts: posts));
  }
}

FutureOr<void> postAddEvent(PostAddEvent event, Emitter<PostsState> emit) {}
