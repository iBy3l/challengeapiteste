import 'package:apiteste/bloc/user_bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/user_model.dart';
import '../widgets/card_user_widget.dart';

class UserPage extends StatefulWidget {
  const UserPage({
    Key? key,
  }) : super(key: key);

  @override
  State<UserPage> createState() => _HomePageState();
}

class _HomePageState extends State<UserPage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<UserBloc>(context).add(GetUsersEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Git Users'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8),
          child: BlocBuilder<UserBloc, UserState>(
            builder: (context, state) {
              if (state is UserLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is UserLoaded) {
                return ListView.builder(
                  itemCount: state.users.length,
                  itemBuilder: (context, index) {
                    final UserModel user = state.users[index];
                    return CardUserWidget(
                      user: user,
                    );
                  },
                );
              }
              if (state is UserError) {
                return Center(
                  child: Text(
                    state.message,
                  ),
                );
              }
              return Container();
            },
          ),
        ));
  }
}
