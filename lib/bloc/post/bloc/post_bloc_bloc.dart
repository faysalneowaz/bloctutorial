import 'package:blocapicall/model/posr_model.dart';
import 'package:blocapicall/repository/post_repo.dart';
import 'package:blocapicall/utils/enums.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'post_bloc_event.dart';
part 'post_bloc_state.dart';

class PostBlocBloc extends Bloc<PostBlocEvent, PostBlocState> {
  PosrtRepository posrtRepository = PosrtRepository();

  PostBlocBloc() : super(const PostBlocState()) {
    on<PostFetched>(_getAllPost);
  }

  void _getAllPost(PostFetched event, Emitter<PostBlocState> emit) async {
    await posrtRepository.getAllPost().then((value) {
      emit(state.copyWith(
        postStatus: PostStatus.success,
        postList: value,
        message: 'success',
      ));
    }).onError((error, stackTrace) {
      print(error);
      print(stackTrace);
      emit(state.copyWith(
        postStatus: PostStatus.failure,
        message: error.toString(),
      ));
    });
  }
}
