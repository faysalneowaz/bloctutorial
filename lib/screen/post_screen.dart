import 'package:blocapicall/bloc/post/bloc/post_bloc_bloc.dart';
import 'package:blocapicall/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  @override
  void initState() {
    super.initState();
    context.read<PostBlocBloc>().add(PostFetched());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("test Bloc app"),
      ),
      body: BlocBuilder<PostBlocBloc, PostBlocState>(
        builder: (context, state) {
          if (state.postStatus == PostStatus.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state.postStatus == PostStatus.failure) {
            return Center(child: Text(state.message));
          } else {
            return ListView.builder(
                itemCount: state.postList.length,
                itemBuilder: (c, i) {
                  return ListTile(
                    title: Text(state.postList[i].name!),
                  );
                });
          }
        },
      ),
    );
  }
}
