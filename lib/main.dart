import 'package:apiteste/bloc/user_bloc.dart';
import 'package:apiteste/config/router.dart';
import 'package:apiteste/services/user_service_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<UserBloc>(
            create: ((context) => UserBloc(UserServiceImpl())),
          ),
        ],
        child: MaterialApp(
          onGenerateRoute: AppRouter.generateRoute,
          initialRoute: AppRouter.user,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.pink,
          ),
        ));
  }
}
