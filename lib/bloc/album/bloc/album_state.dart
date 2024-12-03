// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'album_bloc.dart';

class AlbumState extends Equatable {
  final List<AlbumModel> albumList;
  final AlbumStatus albumStatus;
  final String message;

  const AlbumState({
    this.albumList = const <AlbumModel>[],
    this.albumStatus = AlbumStatus.loading,
    this.message = '',
  });

  @override
  List<Object> get props => [albumList, albumStatus, message];

  AlbumState copyWith({
    List<AlbumModel>? albumList,
    AlbumStatus? albumStatus,
    String? message,
  }) {
    return AlbumState(
      albumList: albumList ?? this.albumList,
      albumStatus: albumStatus ?? this.albumStatus,
      message: message ?? this.message,
    );
  }
}
