import 'package:flutter/material.dart';

import '../models/user_model.dart';

class UserDetailsCardWidget extends StatelessWidget {
  const UserDetailsCardWidget({
    Key? key,
    required this.user,
  }) : super(key: key);

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 100,
          backgroundImage: NetworkImage(user.avatarUrl),
        ),
        const SizedBox(height: 16),
        Card(
          shadowColor: Colors.pink,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      user.login,
                      style: const TextStyle(
                        fontSize: 24,
                        letterSpacing: 4,
                      ),
                    ),
                    Text(
                      user.id.toString(),
                      style: const TextStyle(
                        fontSize: 24,
                        color: Colors.pink,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Text(
                  "Node id: ${user.nodeId}",
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.pink,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
