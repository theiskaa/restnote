/*


import 'package:fckapi/core/models/firebase_user_error.dart';
import 'package:fckapi/core/models/user_request.dart';
import 'package:fckapi/core/services/rest_fire_service.dart';
import 'package:fckapi/views/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_button/fabs/custom_fab.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  var fireService = RestFireService();
  String email;
  String password;
  final safKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: safKey,
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                onChanged: (val) {
                  setState(() {
                    email = val;
                  });
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Email",
                ),
              ),
              SizedBox(height: 20),
              TextField(
                onChanged: (val) {
                  setState(() {
                    password = val;
                  });
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Password",
                ),
              ),
              SizedBox(height: 20),
              buildLoginButton(() async {
                var result = await fireService.postUser(
                  UserRequest(
                    email: email,
                    password: password,
                    returnSecureToken: true,
                  ),
                );
                if (result is FirebaseAuthError) {
                  // ignore: deprecated_member_use
                  safKey.currentState.showSnackBar(
                    SnackBar(
                      content: Text(result.error.message),
                    ),
                  );
                } else {
                  // ignore: deprecated_member_use
                  safKey.currentState.showSnackBar(
                    SnackBar(
                      content: Text("Succsesfull"),
                    ),
                  );
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Home(),
                    ),
                  );
                }
              }),
            ],
          ),
        ),
      ),
    );
  }

  AnimatedCustomFAB buildLoginButton(Function onTap) {
    return AnimatedCustomFAB(
      child: Icon(
        Icons.arrow_forward_ios,
        color: Colors.white,
      ),
      onTap: onTap,
      wGradient: true,
      gradientColors: [
        Colors.black,
        Colors.blue[700],
      ],
      borderRadius: BorderRadius.circular(100),
    );
  }
}
*/