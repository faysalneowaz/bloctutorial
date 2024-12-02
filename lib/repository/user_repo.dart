import 'dart:convert';
import 'dart:io';
import 'package:blocapicall/model/user_model.dart';
import 'package:http/http.dart' as http;

class UserRepository {
  Future<List<UserModel>> getAllUser() async {
    try {
      final response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
      if (response.statusCode == 200) {
        final body = jsonDecode(response.body) as List;

        return body.map((e) {
          return UserModel(
            id: e['id'],
            name: e['name'],
            username: e['username'],
            email: e['email'],
          );
        }).toList();
      }
    } on SocketException {
      throw Exception('Error data loading');
    }

    throw Exception('Error data loading');
  }
}
