import 'package:blocapicall/bloc/album/bloc/album_bloc.dart';
import 'package:blocapicall/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AlbumScreen extends StatefulWidget {
  const AlbumScreen({super.key});

  @override
  State<AlbumScreen> createState() => _AlbumScreenState();
}

class _AlbumScreenState extends State<AlbumScreen> {
  @override
  void initState() {
    super.initState();
    context.read<AlbumBloc>().add(AllAlbumFetched());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<AlbumBloc, AlbumState>(builder: (context, state) {
        if (state.albumStatus == AlbumStatus.loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state.albumStatus == AlbumStatus.failure) {
          return Center(child: Text(state.message));
        } else {
          return ListView.builder(
              itemCount: state.albumList.length,
              itemBuilder: (c, i) {
                return ListTile(
                  title: Text(state.albumList[i].title!),
                );
              });
        }
      }),
    );
  }
}
