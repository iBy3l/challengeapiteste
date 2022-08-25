import 'package:flutter/material.dart';

import '../config/router.dart';
import '../models/user_model.dart';

class CardUserWidget extends StatelessWidget {
  const CardUserWidget({
    Key? key,
    required this.user,
  }) : super(key: key);

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 8,
      ),
      child: Card(
        shadowColor: Colors.pink,
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 16,
          ),
          title: Text(user.login),
          trailing: Text(
            user.id.toString(),
          ),
          leading: CircleAvatar(
            backgroundImage: NetworkImage(
              user.avatarUrl,
            ),
          ),
          onTap: () {
            Navigator.pushNamed(
              context,
              AppRouter.userDetails,
              arguments: user,
            );
          },
        ),
      ),
    );
  }
}
