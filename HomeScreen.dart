import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:teamsync/Screens/LoginScreen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:teamsync/Screens/coach_login.dart';
import 'package:teamsync/Screens/dock.dart';

import 'SignUpScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    var currentUser = FirebaseAuth.instance.currentUser;
    if(currentUser != null) {
      print(currentUser.uid);
      // Navigator.pushNamed(context, 'dock');
    }
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
      child: Scaffold(
        backgroundColor: Colors.blue.shade700,
        // appBar: AppBar(
        //
        //   elevation: 0.0,
        //   backgroundColor: Colors.blue.shade900,
        //   shape: RoundedRectangleBorder(
        //     borderRadius: BorderRadius.horizontal(
        //       left:  Radius.circular(1),
        //     ),
        //   ),
        // ),
        body: Container(
          margin: EdgeInsets.fromLTRB(0, 50, 0, 0),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
            color: Colors.white,
          ),
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                const Text(
                  'Greetings!',
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: Colors.lightBlueAccent,
                    fontFamily: 'Raleway',
                  ),
                ),
                const Text(
                  "Let's have a look",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.lightBlueAccent,
                    fontFamily: 'Open_Sans',
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Container(
                  height: 300,
                  width: 300,
                  margin: const EdgeInsets.all(6.0),
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/kick-off2.png'),
                      fit: BoxFit.fill,
                    ),
                    shape: BoxShape.rectangle,
                  ),
                ),
                SizedBox(
                  height: 70,
                ),
                DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.blue.shade400,
                        Colors.blue.shade800,

                        //add more colors
                      ],
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.transparent,
                      onSurface: Colors.transparent,
                      shadowColor: Colors.transparent,
                      //make color or elevated button transparent
                      elevation: 0.0,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        PageTransition(
                          child: LoginScreen(),
                          type: PageTransitionType.fade,
                        ),
                      );
                      print("Going to the Login Page!");
                    },
                    child: Container(
                      margin: EdgeInsetsDirectional.fromSTEB(8, 11, 8, 0),
                      height: 30,
                      width: 225,
                      child: const Text(
                        'Log In',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.blue.shade700,
                        Colors.cyan,

                        //add more colors
                      ],
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.transparent,
                      onSurface: Colors.transparent,
                      shadowColor: Colors.transparent,
                      //make color or elevated button transparent
                      elevation: 0.0,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        PageTransition(
                          child: coach_login(),
                          type: PageTransitionType.fade,
                        ),
                      );
                      print("You pressed Elevated Button");
                    },
                    child: Container(
                      margin: EdgeInsetsDirectional.fromSTEB(8, 11, 8, 0),
                      height: 30,
                      width: 225,
                      child: const Text(
                        'Coach Login',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.cyan.shade400,
                        Colors.cyan,

                        //add more colors
                      ],
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.transparent,
                      onSurface: Colors.transparent,
                      shadowColor: Colors.transparent,
                      //make color or elevated button transparent
                      elevation: 0.0,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        PageTransition(
                          child: SignUpScreen(),
                          type: PageTransitionType.fade,
                        ),
                      );
                      print("You pressed Elevated Button");
                    },
                    child: Container(
                      margin: EdgeInsetsDirectional.fromSTEB(8, 11, 8, 0),
                      height: 30,
                      width: 225,
                      child: const Text(
                        'Create an Account',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
