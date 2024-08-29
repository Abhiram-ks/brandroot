import 'package:flutter/material.dart';
import 'package:flutter_project_1/main.dart';
import 'package:flutter_project_1/screens/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScreenLogin extends StatefulWidget {
  const ScreenLogin({super.key});

  @override
   _ScreenLoginState createState() => _ScreenLoginState();
}

class _ScreenLoginState extends State<ScreenLogin> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    // controler
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: content(),
      ),
    );
  }

  Widget content() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 250,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF360033), // Deep Purple-Red
                  Color(0xFF0B8793), // Teal Blue
                  Color(0xFF13547A), // Dark Cyan
                  Color(0xFFE4E5E6), // Soft Gray
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [0.1, 0.4, 0.7, 1.0],
                tileMode: TileMode.clamp,
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.elliptical(60, 65),
              ),
            ),
            child: Center(
              child: Container(
                width: 120,
                height: 120,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.white),
                child: const Icon(Icons.person, size: 50),
              ),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          const Column(
            children: [
              Text(
                'BrandRoot',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text("Sign in to continue.")
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(children: [
              // user-input
              TextFormField(
                controller: _usernameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  hintText: 'Username',
                  contentPadding: const EdgeInsets.only(left: 16.0),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              // password-input
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  hintText: 'Password',
                  contentPadding: const EdgeInsets.only(left: 16.0),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    checkLogin(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                  child: const Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ))
            ]),
          ),
        ],
      ),
    );
  }

  void checkLogin(BuildContext ctx) async{
    final username = _usernameController.text;
    final password = _passwordController.text;
    if (username == "abcd" && password == "1234") {
      // goto home page
      ScaffoldMessenger.of(ctx).showSnackBar(const SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.green,
        margin: EdgeInsets.all(10),
        content: Text('Login Successful!'),
      ));
      final sharePrefs =await SharedPreferences.getInstance();
      await sharePrefs.setBool(SAVE_KEY_NAME, true);

      Navigator.of(ctx).pushReplacement(
          MaterialPageRoute(builder: (ctx) => const ScreenHome()));
    } else if (username.isEmpty || password.isEmpty) {
      const errorMessage = 'Please fill in the details.';
      ScaffoldMessenger.of(ctx).showSnackBar(
        const SnackBar(
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.red,
            margin: EdgeInsets.all(10),
            content: Text(errorMessage)),
      );
    } else {
      const errorMessage0 = 'Username or password does not match';
      ScaffoldMessenger.of(ctx).showSnackBar(
        const SnackBar(
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.red,
            margin: EdgeInsets.all(10),
            content: Text(errorMessage0)),
      );
    }
  }
}
