import 'package:flutter/material.dart';
import 'package:flutter_project_1/main.dart';
import 'package:flutter_project_1/screens/home.dart';
import 'package:flutter_project_1/screens/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScreenSplash extends StatefulWidget {
  const ScreenSplash({super.key});

  @override
  State<ScreenSplash> createState() => _ScreenSplashState();
}

class _ScreenSplashState extends State<ScreenSplash> {
  @override
  void initState() {
    checkUserLoggedIn();
    super.initState();
  }

  @override
  void didChangeDependencies() {
  super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.asset(
                'images/logoimage.jpg',
                width: 150,
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'BrandRoot',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const Text(
              "Order. Eat. Enjoy",
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w400,
                color: Color.fromARGB(210, 158, 158, 158),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> gotoLogin() async {
    await Future.delayed(const Duration(seconds: 3));
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (ctx) => const ScreenLogin(),
      ),
    );
  }
 Future<void> checkUserLoggedIn() async{
  final sharePrefs = await SharedPreferences.getInstance();
  final userLoggedIn = sharePrefs.getBool(SAVE_KEY_NAME);
  if( userLoggedIn == null ||sharePrefs == false ){
    
   gotoLogin();
  }else{
    await Future.delayed(const Duration(seconds: 3));
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx1)=> ScreenHome()));
  }
 }

}
