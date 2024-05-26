import 'dart:io';

import 'package:flutter/material.dart';
import 'package:srm_live/src/presentation/screens/home.dart';
import 'package:srm_live/src/presentation/widgets/square_tile.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() {
    return _AuthScreenState();
  }
}

class _AuthScreenState extends State<AuthScreen> {
  final _form = GlobalKey<FormState>();

  var _isLogin = true;
  var _enteredEmail = '';
  var _enteredPassword = '';
  var _enteredUsername = '';
  File? _selectedImage;
  var _isAuthenticating = false;

  void _logorsignup() {
    if (_isLogin) {
      _submit();
    } else {
      _signup();
    }
  }

  void _submit() {
    final isValid = _form.currentState!.validate();

    if (!isValid || !_isLogin && _selectedImage == null) {
      // show error message ...
      return;
    }

    _form.currentState!.save();

    setState(() {
      _isAuthenticating = true;
    });

    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _isAuthenticating = false;
      });
      Navigator.of(context).pushReplacementNamed('/home');
    });
  }

  void _signup() {
    final isValid = _form.currentState!.validate();

    if (!isValid || _isLogin) {
      // show error message ...
      return;
    }

    _form.currentState!.save();

    setState(() {
      _isAuthenticating = true;
    });

    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _isAuthenticating = false;
      });
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (ctx) => const HomePage(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/logo.png', width: 150, height: 150),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    margin: const EdgeInsets.only(
                      top: 30,
                      bottom: 20,
                      left: 20,
                      right: 20,
                    ),
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(22.0),
                      border: Border.all(
                        color: Theme.of(context).colorScheme.tertiary,
                        width: 2.0,
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Form(
                          key: _form,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              //if (!_isLogin)
                              TextFormField(
                                style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.primary),
                                decoration: InputDecoration(
                                  labelText: 'Email Address',
                                  labelStyle: TextStyle(
                                      color:
                                          Theme.of(context).colorScheme.primary),
                                  border: const OutlineInputBorder(),
                                ),
                                keyboardType: TextInputType.emailAddress,
                                autocorrect: false,
                                textCapitalization: TextCapitalization.none,
                                validator: (value) {
                                  if (value == null ||
                                      value.trim().isEmpty ||
                                      !value.contains('@')) {
                                    return 'Please enter a valid email address.';
                                  }
              
                                  return null;
                                },
                                onSaved: (value) {
                                  _enteredEmail = value!;
                                },
                              ),
                              const SizedBox(height: 10),
                              if (!_isLogin)
                                TextFormField(
                                  style: TextStyle(
                                      color:
                                          Theme.of(context).colorScheme.primary),
                                  decoration: InputDecoration(
                                    labelText: 'Username',
                                    labelStyle: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary),
                                    border: const OutlineInputBorder(),
                                  ),
                                  enableSuggestions: false,
                                  validator: (value) {
                                    if (value == null ||
                                        value.isEmpty ||
                                        value.trim().length < 4) {
                                      return 'Please enter at least 4 characters.';
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {
                                    _enteredUsername = value!;
                                  },
                                ),
                              const SizedBox(height: 10),
                              TextFormField(
                                style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.primary),
                                decoration: InputDecoration(
                                  labelText: 'Password',
                                  labelStyle: TextStyle(
                                      color:
                                          Theme.of(context).colorScheme.primary),
                                  border: const OutlineInputBorder(),
                                ),
                                obscureText: true,
                                validator: (value) {
                                  if (value == null || value.trim().length < 6) {
                                    return 'Password must be at least 6 characters long.';
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  _enteredPassword = value!;
                                },
                              ),
                              const SizedBox(height: 12),
                              if (_isAuthenticating)
                                const CircularProgressIndicator(),
                              if (!_isAuthenticating)
                                ElevatedButton(
                                  onPressed: _logorsignup,
                                  style: ElevatedButton.styleFrom(
                                    fixedSize: const Size(200, 50),
                                    foregroundColor:
                                        Colors.black,
                                    backgroundColor: Theme.of(context)
                                        .colorScheme
                                        .tertiary,
                                  ),
                                  child: Text(_isLogin ? 'Login' : 'Signup'),
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 1.0,
                        width: 100.0,
                        color: const Color.fromARGB(255, 254, 193, 42),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          'or login with',
                          style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 254, 193, 42)),
                        ),
                      ),
                      Container(
                        height: 1.0,
                        width: 100.0,
                        color: const Color.fromARGB(255, 254, 193, 42),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SquareTile(
                          imagePath: "assets/google.png",
                          onTap: () {
                          }),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  const Text(
                    "New at SRM Live? Create an account",
                    style: TextStyle(
                      color: Color.fromARGB(255, 31, 218, 147),
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  if (!_isAuthenticating)
                    ElevatedButton(
                      style: ButtonStyle(
                        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          ),
                        ),
                        foregroundColor: WidgetStateProperty.all(Colors.black),
                        backgroundColor: WidgetStateProperty.all(
                          const Color.fromARGB(255, 31, 218, 147),
                        ),
                        textStyle: WidgetStateProperty.all(
                          const TextStyle(
                            fontSize: 14.0,
                          ),
                      ),
                      fixedSize: WidgetStateProperty.all(const Size(200, 50)),
                      ),
                      onPressed: () {
                        setState(() {
                          _isLogin = !_isLogin;
                        });
                      },
                      child: Text(_isLogin
                          ? 'SignUp'
                          : 'LogIn',style: const TextStyle(
                        color: Colors.black,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
