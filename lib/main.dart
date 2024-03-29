import 'package:flutter/material.dart';
import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:movies_club/auth/SignIn.dart';
import 'package:movies_club/auth/SignUp.dart';
import 'package:movies_club/pages/GetStarted.dart';
import 'package:movies_club/pages/Homepage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:movies_club/pages/Search.dart';
import 'package:movies_club/pages/Watchlist.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': ((context) => splash_screen()),
      '/GetStarted': ((context) => GetStarted()),
      '/SignIn': ((context) => SignIn()),
      '/SignUp': ((context) => SignUp()),
      '/Homepage': ((context) => MovieScreen()),
      '/Search': (context) => Search(),
      './Watchlist': (context) => Watchlist(),
    },
  ));
}

class splash_screen extends StatelessWidget {
  const splash_screen({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FlutterSplashScreen.fadeIn(
      backgroundColor: HexColor('#1A1E26'),
      onInit: () {
        debugPrint("On Init");
      },
      onEnd: () {
        debugPrint("On End");
      },
      childWidget: SizedBox(
        height: 200,
        width: 200,
        child: Image.asset("assets/images/logo.png"),
      ),
      onAnimationEnd: () => debugPrint("On Fade In End"),
      nextScreen: const GetStarted(),
    );
  }
}
