import 'package:blocapicall/bloc/user/user_bloc.dart';
import 'package:blocapicall/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  void initState() {
    super.initState();
    context.read<UserBloc>().add(UserFetched());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("test Bloc app"),
      ),
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state.userStatus == UserStatus.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state.userStatus == UserStatus.failure) {
            return Center(child: Text(state.message));
          } else {
            return ListView.builder(
                itemCount: state.userList.length,
                itemBuilder: (c, i) {
                  return ListTile(
                    title: Text(state.userList[i].name!),
                  );
                });
          }
        },
      ),
    );
  }
}
