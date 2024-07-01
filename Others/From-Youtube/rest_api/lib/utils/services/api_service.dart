import 'dart:convert';

import 'package:rest_api/utils/constants/api_constants.dart';
import 'package:rest_api/utils/models/comments_mode.dart';
import 'package:http/http.dart' as http;

class APIService {
  Future<List<CommentsModel>> getComments() async {
    var response = await http.get(Uri.parse(url));
    List<CommentsModel> comments = [];

    List<dynamic> responseList = jsonDecode(response.body);

    List<CommentsModel> deneme = List.empty();

    for (int i = 0; i < responseList.length; i++) {
      comments.add(CommentsModel.fromJson(responseList[i]));
    }

    return comments;
  }

  Map<String, dynamic> asd = {};

  Future<http.Response> postComment(CommentsModel m1) async {
    final response = await http.post(Uri.parse(url),
        body: jsonEncode(m1.toJson()),
        headers: <String, String>{
          "Content-Type": "application/json; charset=UTF-8"
        });
    return response;
  }
}
