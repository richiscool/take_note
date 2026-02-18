import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
   var _name = '';
  var _email = '';
  var _password = '';
  var _isSignIn = true;
  var _isNameFieldVisible = false;
  var _isLoading = false;
  var _failedAuth = false;
  final _formKey = GlobalKey<FormState>();
  
  final _welcomeSnackBar = const SnackBar(
    content: Text("Thanks for signing up!"),
    duration: Duration(milliseconds: 2000),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_isSignIn ? "Sign In" : "Sign Up"),
      centerTitle: true
      ),
    );
  }
}