import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ConnectionDemo extends StatefulWidget {
  const ConnectionDemo({super.key});

  @override
  State<ConnectionDemo> createState() => _ConnectionDemoState();
}

class _ConnectionDemoState extends State<ConnectionDemo> {
  // Uri uri = Uri.parse('https://jsonplaceholder.typicode.com/users/1');
  // Uri uri = Uri.parse('http://172.27.18.154/login');
  Uri uri = Uri.parse('http://rnvoy-202-28-45-138.a.free.pinggy.link/login');
  String message = 'Click to connect';
  bool isWaiting = false;
  final TextEditingController tcName = TextEditingController();
  final TextEditingController tcPassword = TextEditingController();


  void connect() async {
    // http.Response response = await http.get(uri);
    // debugPrint('Status code : ${response.statusCode}');
    // debugPrint('Status code : ${response.body}');

    //show spinner
    setState(() {
      isWaiting = true;
    });


    //connect to server
    try {
      String account = jsonEncode({"username": tcName.text, "password": tcPassword.text});
      http.Response response =
          await http.post(uri, body: account).timeout(const Duration(seconds: 5));
      if (response.statusCode == 200) {
        //convert JSON to Map
        Map data = jsonDecode(response.body);
        setState(() {
          message = data['name'];
        });
      } else {
        setState(() {
          message = 'Server error!';
        });
      }
    } on TimeoutException catch (e) {
      debugPrint(message);
      setState(() {
        message = 'Timeout Error, Try again!';
      });
    } catch (e) {
      debugPrint(e.toString());
      setState(() {
        message = 'Unknown Error!';
      });
    }
    finally{
      //hide the spinner
      setState(() {
        isWaiting = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          alignment: Alignment.topCenter,
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              isWaiting ? const CircularProgressIndicator() : Text(message),
              TextField(
                controller: tcName,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Username',
                ),
              ),
              TextField(
                obscureText: true,
                controller: tcPassword,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),

              FilledButton(
                onPressed: connect,
                child: const Text('Connect'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
