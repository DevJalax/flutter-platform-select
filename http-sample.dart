import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Controllers to capture input from text fields
  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();

  // Store response data
  Map<String, dynamic>? _getResponse;
  Map<String, dynamic>? _postResponse;
  Map<String, dynamic>? _putResponse;

  // Fetch Data (GET Request)
  Future<void> getData() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts/1'));

    if (response.statusCode == 200) {
      setState(() {
        _getResponse = json.decode(response.body);
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  // Create Data (POST Request) using user input
  Future<void> postData() async {
    final response = await http.post(
      Uri.parse('https://jsonplaceholder.typicode.com/posts'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'title': titleController.text,
        'body': bodyController.text,
        'userId': '1',  // You can change this to capture user input as well if needed.
      }),
    );

    if (response.statusCode == 201) {
      setState(() {
        _postResponse = json.decode(response.body);
      });
    } else {
      throw Exception('Failed to create post');
    }
  }

  // Update Data (PUT Request) using user input
  Future<void> updateData() async {
    final response = await http.put(
      Uri.parse('https://jsonplaceholder.typicode.com/posts/1'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'id': '1',  // ID of the post to be updated
        'title': titleController.text,
        'body': bodyController.text,
        'userId': '1',  // You can capture user input for this as well
      }),
    );

    if (response.statusCode == 200) {
      setState(() {
        _putResponse = json.decode(response.body);
      });
    } else {
      throw Exception('Failed to update post');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter HTTP Example'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              ElevatedButton(
                onPressed: getData,
                child: Text('GET Data'),
              ),
              if (_getResponse != null) ...[
                Text('GET Response:'),
                Text('Title: ${_getResponse!['title']}'),
                Text('Body: ${_getResponse!['body']}'),
                Divider(),
              ],

              // Input fields for POST and PUT
              TextField(
                controller: titleController,
                decoration: InputDecoration(labelText: 'Title'),
              ),
              TextField(
                controller: bodyController,
                decoration: InputDecoration(labelText: 'Body'),
              ),
              SizedBox(height: 16),

              ElevatedButton(
                onPressed: postData,
                child: Text('POST Data'),
              ),
              if (_postResponse != null) ...[
                Text('POST Response:'),
                Text('ID: ${_postResponse!['id']}'),
                Text('Title: ${_postResponse!['title']}'),
                Divider(),
              ],
              
              ElevatedButton(
                onPressed: updateData,
                child: Text('UPDATE (PUT) Data'),
              ),
              if (_putResponse != null) ...[
                Text('PUT Response:'),
                Text('Title: ${_putResponse!['title']}'),
                Text('Body: ${_putResponse!['body']}'),
              ],
            ],
          ),
        ),
      ),
    );
  }
}


