import 'dart:io';

import 'package:flutter/material.dart';
import 'package:rest_api/utils/models/comments_mode.dart';
import 'package:rest_api/utils/services/api_service.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  TextEditingController postidController = TextEditingController();
  TextEditingController idController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController bodyController = TextEditingController();

  APIService API = APIService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.yellow,
        ),
        body: Column(
          children: [
            Row(
              children: [
                const Expanded(child: Text("Post id")),
                Expanded(
                    child: TextField(
                  controller: postidController,
                )),
              ],
            ),
            Row(
              children: [
                const Expanded(child: Text("Id")),
                Expanded(
                    child: TextField(
                  controller: idController,
                )),
              ],
            ),
            Row(
              children: [
                const Expanded(child: Text("Name")),
                Expanded(
                    child: TextField(
                  controller: nameController,
                )),
              ],
            ),
            Row(
              children: [
                const Expanded(child: Text("Email")),
                Expanded(
                    child: TextField(
                  controller: emailController,
                )),
              ],
            ),
            Row(
              children: [
                const Expanded(child: Text("Body")),
                Expanded(
                    child: TextField(
                  controller: bodyController,
                )),
              ],
            ),
            ElevatedButton(
                onPressed: () {
                  sendData();
                },
                child: const Text("Send"))
          ],
        ));
  }

  void sendData() async {
    CommentsModel model = CommentsModel(
        postId: int.parse(postidController.text),
        id: int.parse(idController.text),
        name: nameController.text,
        body: bodyController.text);
    final res = await API.postComment(model);
    if (res.statusCode == HttpStatus.created) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: const Text("Succesfully")));
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: const Text("Failed")));
      Navigator.pop(context);
    }
    print(res.body);
  }
}
