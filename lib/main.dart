import 'package:blocapicall/bloc/album/bloc/album_bloc.dart';
import 'package:blocapicall/bloc/post/bloc/post_bloc_bloc.dart';
import 'package:blocapicall/bloc/user/user_bloc.dart';
import 'package:blocapicall/screen/album_screen.dart';
import 'package:blocapicall/screen/post_screen.dart';
import 'package:blocapicall/screen/user_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => PostBlocBloc()),
        BlocProvider(create: (_) => UserBloc()),
        BlocProvider(create: (_) => AlbumBloc()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const AlbumScreen(),
      ),
    );
  }
}
