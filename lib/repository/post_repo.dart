import 'dart:convert';
import 'dart:io';

import 'package:blocapicall/model/posr_model.dart';
import 'package:http/http.dart' as http;

class PosrtRepository {
  Future<List<PostModel>> getAllPost() async {
    try {
      final response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/comments'));
      if (response.statusCode == 200) {
        final body = jsonDecode(response.body) as List;

        return body.map((e) {
          return PostModel(
            postId: e['postId'],
            it: e['it'],
            name: e['name'],
            email: e['email'],
            body: e['body'],
          );
        }).toList();
      }
    } on SocketException {
      throw Exception('Error data loading');
    }

    throw Exception('Error data loading');
  }
}
