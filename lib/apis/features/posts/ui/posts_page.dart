import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/posts_bloc.dart';

class PostsPage extends StatefulWidget {
  const PostsPage({super.key});

  @override
  State<PostsPage> createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  // creating an instance
  final PostsBloc postsBloc = PostsBloc();

  @override
  void initState() {
    // TODO: implement initState
    postsBloc.add(PostsInitialFetchEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Post Page")),
      body: BlocConsumer<PostsBloc, PostsState>(
          bloc: postsBloc,
          listenWhen: (previous, current) => current is PostsActionState,
          buildWhen: (previous, current) => current is! PostsActionState,
          listener: (context, state) {},
          builder: (context, state) {
            switch (state.runtimeType) {
              case PostsFetchingErrorState:
                return Scaffold(
                  body: Center(
                    child: Text('No Internet Connection! Try Again'),
                  ),
                );
              case PostsFetchingLoadingState:
                return Center(
                  child: CircularProgressIndicator(),
                );
              case PostsFetchingSuccessfulState:
                final successState = state as PostsFetchingSuccessfulState;
                return Container(
                  child: ListView.builder(
                    itemCount: successState.posts.length,
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                            color: Colors.blue[200],
                            borderRadius: BorderRadius.circular(10)),
                        padding: EdgeInsets.all(16),
                        margin: EdgeInsets.all(16),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                  radius: 15,
                                  child: Center(
                                    child: Text(successState.posts[index].id
                                        .toString()),
                                  )),
                              Text(
                                successState.posts[index].title,
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 10),
                              Text(successState.posts[index].body)
                            ]),
                      );
                    },
                  ),
                );
              default:
                return SizedBox();
            }
          }),
    );
  }
}
