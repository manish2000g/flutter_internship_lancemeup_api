import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:api_project/utils';

class PatchClass extends StatefulWidget {
  const PatchClass({Key? key}) : super(key: key);

  @override
  State<PatchClass> createState() => _PatchClassState();
}

class _PatchClassState extends State<PatchClass> {
  var titleController = TextEditingController(text: "foo");
  var bodyController = TextEditingController(text: "bar");
  var userIdController = TextEditingController(text: "2");

  @override
  void initState() {
    super.initState();
  }

  Future patchPost() async {
    http.Response response;

    response = await http.patch(
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
        title: const Text("Patch"),
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
              onPressed: patchPost,
              child: const Text("Update"),
            )
          ],
        ),
      ),
    );
  }
}
