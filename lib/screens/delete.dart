import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:api_project/utils';

class DeleteClass extends StatefulWidget {
  const DeleteClass({Key? key}) : super(key: key);

  @override
  State<DeleteClass> createState() => _DeleteClassState();
}

class _DeleteClassState extends State<DeleteClass> {
  Future deletePost() async {
    http.Response response;

    response = await http.delete(
      Uri.parse('$baseUrl/1'),
      headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode == 200) {
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
                  'A post from index 1 has been deleted!',
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
                  'Could not delete!',
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
        title: const Text("Delete"),
      ),
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(primary: Colors.red),
          onPressed: deletePost,
          child: const Text("Delete Post in Index 1"),
        ),
      ),
    );
  }
}
