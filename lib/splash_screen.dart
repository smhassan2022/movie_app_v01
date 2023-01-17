import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:movie_app_v01/pages/home_Screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    delay();
  }

  // create method to stay on page for few secs
  void delay () async{
    await Future.delayed(Duration(seconds: 3));
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomeScreen(),));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
        body: Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.black,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    child: (
                      Text('EYEFLIX', style: TextStyle(color: Colors.amber, fontSize: 36, fontWeight: FontWeight.bold),)
                    ),
                ),
                Container(
                    child: Lottie.asset('assets/animations/eye2.json')
                ),
              ],
            )
        )
    )
    );
  }
}
