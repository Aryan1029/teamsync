import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:teamsync/Screens/HomeScreen.dart';
import 'package:teamsync/Screens/applicant_list.dart';
import 'package:page_transition/page_transition.dart';
import 'package:teamsync/Screens/reports.dart';
import 'package:teamsync/Screens/scanner.dart';
import 'package:teamsync/Screens/updates.dart';

import 'create_teams.dart';

class coach_dashboard extends StatefulWidget {
  const coach_dashboard({super.key});

  @override
  State<coach_dashboard> createState() => _coach_dashboardState();
}

class _coach_dashboardState extends State<coach_dashboard> {
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
              preferredSize: const Size(100, 125),
              child: Column(
                children: [
                  Row(
                    children: [
                      Column(
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(75, 60, 0, 0),
                            child: const Text(
                              'Manage',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 45,
                                fontFamily: 'Raleway',
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(75, 0, 0, 10),
                            child: const Text(
                              'organize workflow.',
                              style: TextStyle(
                                color: Colors.white70,
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                                fontFamily: 'Raleway',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),),
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
            child: Column(
              children: [
                const SizedBox(
                  height: 80,
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: (){
                        Navigator.push(
                          context,
                          PageTransition(
                            child: applicant_list(),
                            type: PageTransitionType.fade,
                          ),
                        );
                      },
                      child: Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          color: Colors.blue.shade300,
                          borderRadius: BorderRadius.circular(15),
                          gradient: LinearGradient(colors: [Colors.blue.shade200,
                            Colors.blue.shade700,]),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.4),
                              spreadRadius: 10,
                              blurRadius: 7,
                              offset: Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        margin: const EdgeInsetsDirectional.fromSTEB(25, 0, 0, 0),
                        padding: const EdgeInsetsDirectional.fromSTEB(0, 55,0, 0),
                        child:const Text(
                          textAlign:TextAlign.center,
                          'Applicants',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 27,
                            fontFamily: 'Raleway',
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(
                          context,
                          PageTransition(
                            child: create_teams(),
                            type: PageTransitionType.fade,
                          ),
                        );
                      },
                      child: Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.blue.shade200,
                              Colors.cyan,
                            ],
                          ),
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.4),
                              spreadRadius: 10,
                              blurRadius: 7,
                              offset: const Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        margin: const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                        padding: const EdgeInsetsDirectional.fromSTEB(0, 55,0, 0),
                        child:const Text(
                          textAlign:TextAlign.center,
                          'Show Teams',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                            fontFamily: 'Raleway',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: (){
                        Navigator.push(
                          context,
                          PageTransition(
                            child: HomeScreen(),
                            type: PageTransitionType.fade,
                          ),
                        );
                      },
                      child: Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.blue.shade200,
                              Colors.cyan,
                            ],
                          ),
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.4),
                              spreadRadius: 10,
                              blurRadius: 7,
                              offset: const Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        margin: const EdgeInsetsDirectional.fromSTEB(25, 30, 0, 0),
                        padding: const EdgeInsetsDirectional.fromSTEB(0, 55,0, 0),
                        child:const Text(
                          textAlign:TextAlign.center,
                          'Up-to-Date',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                            fontFamily: 'Raleway',
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(
                          context,
                          PageTransition(
                            child: reports(),
                            type: PageTransitionType.fade,
                          ),
                        );
                      },
                      child: Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          color: Colors.blue.shade300,
                          borderRadius: BorderRadius.circular(15),
                          gradient: LinearGradient(colors: [Colors.blue.shade700,
                            Colors.blue.shade200,]),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.4),
                              spreadRadius: 10,
                              blurRadius: 7,
                              offset: Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        margin: EdgeInsetsDirectional.fromSTEB(10, 30, 0, 0),
                        padding: EdgeInsetsDirectional.fromSTEB(0, 55,0, 0),
                        child:const Text(
                          textAlign:TextAlign.center,
                          'Reports',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 27,
                            fontFamily: 'Raleway',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: ElevatedButton(
                    onPressed: () async {
                      await FirebaseAuth.instance.signOut();
                      Navigator.pop(context);
                      Fluttertoast.showToast(
                          msg: "You've been Logged Out.",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0
                      );
                    },
                    style: ButtonStyle(
                      backgroundColor:
                      const MaterialStatePropertyAll<Color>(Colors.white38),
                      shadowColor:
                      const MaterialStatePropertyAll<Color>(Colors.white),
                      foregroundColor: const MaterialStatePropertyAll<Color>(Colors.black),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      )),
                    ),
                    child: Container(
                      // height: 50,
                      // width: 50,
                      margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),

                      child: const Text('Log Out'),
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
