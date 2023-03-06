import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:api_project/utils';

class GetClass extends StatefulWidget {
  const GetClass({Key? key}) : super(key: key);

  @override
  State<GetClass> createState() => _GetClassState();
}

class _GetClassState extends State<GetClass> {
  var data;
  Future getData() async {
    http.Response response;

    response = await http.get(
      Uri.parse(baseUrl),
      headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode == 200) {
      setState(() {
        data = json.decode(response.body);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  Widget myCard(
    String id,
    String title,
    String body,
  ) {
    return Visibility(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        color: Colors.blueGrey,
        elevation: 10,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color.fromARGB(255, 25, 3, 122),
                    Color.fromARGB(255, 130, 144, 8)
                  ],
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Id : $id',
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Title : $title",
                      style: const TextStyle(
                          color: Colors.yellow,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      body,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Get"),
      ),
      body: (data.length <= 0)
          ? Center(child: Text("Couldn't fetch data from api! ${data.length}"))
          : ListView.builder(
              itemBuilder: (context, index) {
                return myCard(
                  data[index]["id"].toString(),
                  data[index]["title"],
                  data[index]["body"],
                );
              },
              itemCount: data.length,
            ),
    );
  }
}
