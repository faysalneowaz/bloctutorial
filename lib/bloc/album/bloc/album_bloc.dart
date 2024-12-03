import 'package:blocapicall/model/album_model.dart';
import 'package:blocapicall/repository/album_repo.dart';
import 'package:blocapicall/utils/enums.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'album_event.dart';
part 'album_state.dart';

class AlbumBloc extends Bloc<AlbumEvent, AlbumState> {
  AlbumRepository albumRepository = AlbumRepository();
  AlbumBloc() : super(const AlbumState()) {
    on<AllAlbumFetched>(_getAllAlbum);
  }
  void _getAllAlbum(AllAlbumFetched event, Emitter<AlbumState> emit) async {
    await albumRepository.getAllAlbum().then((value) {
      emit(state.copyWith(
        albumList: value,
        albumStatus: AlbumStatus.success,
        message: 'Success',
      ));
    }).onError((error, stackTrace) {
      emit(state.copyWith(
        albumStatus: AlbumStatus.failure,
        message: error.toString(),
      ));
    });
  }
}
