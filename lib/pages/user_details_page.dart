import 'package:apiteste/models/user_model.dart';
import 'package:apiteste/widgets/user_details_card_widget.dart';
import 'package:flutter/material.dart';

class UserDetailsPage extends StatelessWidget {
  const UserDetailsPage({Key? key, required this.user}) : super(key: key);
  final UserModel user;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(user.login),
      ),
      body: SizedBox(
        width: size.width,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: UserDetailsCardWidget(user: user),
        ),
      ),
    );
  }
}
