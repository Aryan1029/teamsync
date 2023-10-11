import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:teamsync/Screens/coach_dashboard.dart';
import 'package:teamsync/Screens/dock.dart';
import 'package:page_transition/page_transition.dart';

class coach_login extends StatefulWidget {
  const coach_login({Key? key}) : super(key: key);

  @override
  State<coach_login> createState() => _coach_loginState();
}

class _coach_loginState extends State<coach_login> {
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  String chk_err = '';
  bool _signUp() {
    final mail = email.text;
    if (!EmailValidator.validate(mail)) {
      Fluttertoast.showToast(
          msg: 'Please enter a valid email.',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      return false;
    } else {
      return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
      child: Scaffold(
        backgroundColor: Colors.blue.shade700,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          bottom: PreferredSize(
              preferredSize: const Size(100, 90),
              child: Container(
                width:600,
                margin: EdgeInsets.fromLTRB(20, 0, 10, 0),
                child: Text(
                  'Coach Log In',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 45,
                    fontFamily: 'Raleway',
                  ),
                ),
              )),
          backgroundColor: Colors.blue.shade700,
          elevation: 0.0,
        ),
        body: Container(
          margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
            color: Colors.white,
          ),
          child: Center(
            child: SizedBox(
              height: 400,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    Container(
                      height: 55,
                      width: 280,
                      child: TextField(
                        controller: email,
                        autofocus: false,
                        style: const TextStyle(
                          fontFamily: 'Raleway',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.transparent, width: 2.0),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.transparent, width: 2.0),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          filled: true,
                          fillColor: Colors.blue.shade300,
                          hintText: "E-mail",
                          hintStyle: TextStyle(
                            color: Colors.white,
                          ),
                          prefixIcon: const Icon(
                            Icons.mail,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 55,
                      width: 279,
                      child: TextField(
                        controller: pass,
                        autofocus: false,
                        obscureText: true,
                        style: const TextStyle(
                          fontFamily: 'Raleway',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.transparent, width: 2.0),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.transparent, width: 2.0),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          filled: true,
                          fillColor: Colors.blue.shade300,
                          hintText: "Password",
                          hintStyle: TextStyle(
                            color: Colors.white,
                          ),
                          prefixIcon: const Icon(
                            Icons.password,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50,
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
                          //make color or elevated button transshparent
                          elevation: 0.0,
                        ),
                        onPressed: () async {
                          if (_signUp() == true) {
                            try {
                              final credential = await FirebaseAuth.instance
                                  .signInWithEmailAndPassword(
                                email: email.text,
                                password: pass.text,
                              );
                              Navigator.push(
                                context,
                                PageTransition(
                                  child: coach_dashboard(),
                                  type: PageTransitionType.fade,
                                ),
                              );
                              print("You pressed Elevated Button");
                            } on FirebaseAuthException catch (e) {
                              if (e.code == 'user-not-found') {
                                print('No user found for that email.');
                                chk_err = 'No user found for that email.';
                              } else if (e.code == 'wrong-password') {
                                print('Wrong password provided for that user.');
                                chk_err =
                                    'Wrong password provided for that user.';
                              } else {
                                chk_err = 'either email or password is missing';
                              }
                            }
                            Fluttertoast.showToast(
                                msg: chk_err,
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                fontSize: 16.0);

                            print("You pressed Elevated Button");
                          }
                          ;
                        },
                        child: Container(
                          margin:
                              const EdgeInsetsDirectional.fromSTEB(8, 5, 8, 0),
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
                    SizedBox(
                      height: 32,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
