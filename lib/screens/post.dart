import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:api_project/utils';

class PostClass extends StatefulWidget {
  const PostClass({Key? key}) : super(key: key);

  @override
  State<PostClass> createState() => _PostClassState();
}

class _PostClassState extends State<PostClass> {
  var titleController = TextEditingController();
  var bodyController = TextEditingController();
  var userIdController = TextEditingController();

  Future registerPost() async {
    http.Response response;

    response = await http.post(
      Uri.parse(baseUrl),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(
        <dynamic, dynamic>{
          'title': titleController.text,
          'body': bodyController.text,
          'userId': userIdController.text,
        },
      ),
    );

    if (response.statusCode == 201) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: SizedBox(
            height: 50,
            child: Column(
              children: const [
                Text(
                  "Success",
                  style: TextStyle(color: Colors.black),
                ),
                Text(
                  'The post was successfully saved!',
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
          ),
          backgroundColor: Colors.green,
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: SizedBox(
            height: 50,
            child: Column(
              children: const [
                Text(
                  "Failure!",
                  style: TextStyle(color: Colors.black),
                ),
                Text(
                  'Could not post!',
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
          ),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Post"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            TextFormField(
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                hintText: "User Id",
              ),
              controller: userIdController,
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                hintText: "Title",
              ),
              controller: titleController,
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                hintText: "Body",
              ),
              controller: bodyController,
            ),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
              onPressed: registerPost,
              child: const Text("Submit"),
            )
          ],
        ),
      ),
    );
  }
}
