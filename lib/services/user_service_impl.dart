import 'dart:convert';

import 'package:apiteste/services/user_failure.dart';
import 'package:apiteste/utils/system_constats.dart';

import '../models/user_model.dart';
import 'package:http/http.dart' as http;

import 'user_service.dart';

class UserServiceImpl implements UserService {
  @override
  Future<List<UserModel>> getUsers() async {
    final upi = Uri.parse(
      SystemConstants.BASE_URL + SystemConstants.GET_USER,
    );

    final response = await http.get(upi);
    if (response.statusCode == 200) {
      final body = List<Map<String, dynamic>>.from(
        jsonDecode(
          response.body,
        ),
      );
      final users = body.map((i) => UserModel.fromMap(i)).toList();

      return users;
    } else {
      throw const UserFailureInternet(
        'Erro ao Carregar',
      );
    }
  }
}
