import 'dart:convert';
import 'dart:io';

import 'package:blocapicall/model/album_model.dart';
import 'package:http/http.dart' as http;

class AlbumRepository {
  Future<List<AlbumModel>> getAllAlbum() async {
    try {
      final response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/albums'));
      if (response.statusCode == 200) {
        final body = jsonDecode(response.body) as List;
        return body.map((e) {
          return AlbumModel(
            userId: e['userId'],
            id: e['id'],
            title: e['title'],
          );
        }).toList();
      }
    } on SocketException {
      throw Exception('Error data loading');
    }
    throw Exception('Error data loading');
  }
}
