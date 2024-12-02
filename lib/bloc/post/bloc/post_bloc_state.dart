part of 'post_bloc_bloc.dart';

class PostBlocState extends Equatable {
  final PostStatus postStatus;
  final List<PostModel> postList;
  final String message;

  const PostBlocState({
    this.postStatus = PostStatus.loading,
    this.postList = const <PostModel>[],
    this.message = '',
  });

  @override
  List<Object> get props => [postStatus, postList, message];

  PostBlocState copyWith(
      {PostStatus? postStatus, List<PostModel>? postList, String? message}) {
    return PostBlocState(
      postStatus: postStatus ?? this.postStatus,
      postList: postList ?? this.postList,
      message: message ?? this.message,
    );
  }
}
