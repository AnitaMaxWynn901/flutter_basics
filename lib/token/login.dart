import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // Replace with your server IP and port
  final String url = '172.27.122.14:3000';
  bool isWaiting = false;
  final tcUsername = TextEditingController();
  final tcPassword = TextEditingController();

  // Function to display dialog
  void popDialog(String title, String message) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(title),
            content: Text(message),
          );
        });
  }

  // Login function
  void login() async {
  setState(() {
    isWaiting = true;
  });
  try {
    Uri uri = Uri.http(url, '/login');
    Map account = {
      'username': tcUsername.text.trim(),
      'password': tcPassword.text.trim()
    };
    http.Response response = await http.post(
      uri,
      body: jsonEncode(account),
      headers: {'Content-Type': 'application/json'},
    ).timeout(
      const Duration(seconds: 10),
    );

    if (response.statusCode == 200) {
      String token = response.body;
      print('Token received: $token'); // Log the token

      // Save the token to SharedPreferences
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', token);

      // Decode JWT token to get username and role
      final jwt = JWT.decode(token);
      Map payload = jwt.payload;
      print('Decoded JWT payload: $payload'); // Log the payload

      // Check for 'role' in the payload to navigate
      if (payload['role'] == 'admin') {
        popDialog('Success', 'Welcome admin');
      } else if (payload['role'] == 'user') {
        popDialog('Success', 'Welcome user');
      } else {
        popDialog('Error', 'Role not recognized');
      }
    } else {
      popDialog('Error', response.body);
    }
  } on TimeoutException catch (e) {
    debugPrint(e.message);
    popDialog('Error', 'Timeout error, try again!');
  } catch (e) {
    debugPrint(e.toString());
    popDialog('Error', 'Unknown error, try again!');
  } finally {
    setState(() {
      isWaiting = false;
    });
  }
}

void retrieveTokenAndVerify(BuildContext context) async {
  final prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString('token');
  
  if (token != null) {
    print("Retrieved token from storage: $token"); // Log retrieved token

    try {
      final jwt = JWT.decode(token);
      Map payload = jwt.payload;
      print('Decoded JWT payload for verification: $payload'); // Log payload for debugging
      
      if (payload['role'] == 'admin') {
        // Show a popup that says "Login successfully" for admin
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Success"),
              content: Text("Login successfully as admin"),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("OK"),
                ),
              ],
            );
          },
        );
      } else if (payload['role'] == 'user') {
        // Show a popup that says "Login successfully" for user
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Success"),
              content: Text("Login successfully as user"),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("OK"),
                ),
              ],
            );
          },
        );
      }
    } catch (e) {
      print("Token decoding failed: $e"); // Log decoding error
    }
  } else {
    print("No token found in storage");
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense Tracking'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: tcUsername,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: 'Username',
                suffixIcon: IconButton(
                  onPressed: () {
                    tcUsername.clear();
                  },
                  icon: const Icon(Icons.clear),
                ),
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              obscureText: true,
              controller: tcPassword,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: 'Password',
                suffixIcon: IconButton(
                  onPressed: () {
                    tcPassword.clear();
                  },
                  icon: const Icon(Icons.clear),
                ),
              ),
            ),
            const SizedBox(height: 8),
            isWaiting
                ? const CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: login,
                    child: const Text('Login'),
                  ),
          ],
        ),
      ),
    );
  }
}
