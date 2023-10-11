import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:page_transition/page_transition.dart';
import 'package:teamsync/Screens/approved_applicant_final_profile_page.dart';
import 'package:teamsync/Screens/approved_applicants_review_insights.dart';
import 'package:teamsync/Screens/rejected_applicants_review_insights.dart';
import 'package:teamsync/Screens/selected_players_review_insights.dart';
import 'package:teamsync/Screens/substituted_player_reports.dart';
import 'package:teamsync/Screens/venue.dart';

class reports extends StatefulWidget {
  const reports({super.key});

  @override
  State<reports> createState() => reportsState();
}

class reportsState extends State<reports> {
  String data = 'Sample';
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
      child: Scaffold(
        backgroundColor: Colors.blue.shade700,
        appBar: AppBar(
          automaticallyImplyLeading: true,
          bottom: PreferredSize(
              preferredSize: const Size(100, 125),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: Text(
                      'Reports',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 45,
                        fontFamily: 'Raleway',
                      ),
                    ),
                  ),
                ],
              )),
          backgroundColor: Colors.blue.shade700,
          elevation: 0.0,
        ),
        body: Container(
          margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
            color: Colors.white,
          ),
          child: Center(
            child: Container(
              margin: const EdgeInsets.fromLTRB(20, 50, 20, 0),
              child: ListView(
                children: [
                  Container(
                    height: 300,
                    width: 20,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.blue.shade300,
                          Colors.blue.shade800,
                        ],
                      ),
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.4),
                          spreadRadius: 3,
                          blurRadius: 2,
                          offset:
                          const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: ListView(
                      children: [
                        GestureDetector(
                          onTap: (){
                            Navigator.push(
                              context,
                              PageTransition(
                                child: approved_applicants_review_insights(),
                                type: PageTransitionType.fade,
                              ),
                            );
                          },
                          child: Center(
                            child: Container(
                              margin: const EdgeInsets.fromLTRB(0, 35, 0, 0),
                              height: 50,
                              width: 280,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.white.withOpacity(0.7),
                                    spreadRadius: 3,
                                    blurRadius: 2,
                                    offset:
                                    const Offset(0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: const Padding(
                                padding: EdgeInsets.fromLTRB(15,10,0,0),
                                child: Text(
                                  'Approved Applications',
                                  style: TextStyle(
                                    fontFamily: 'Raleway',
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: (){
                            Navigator.push(
                              context,
                              PageTransition(
                                child: rejected_applicants_review_insights(),
                                type: PageTransitionType.fade,
                              ),
                            );
                          },
                          child: Center(
                            child: Container(
                              margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                              height: 50,
                              width: 280,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.white.withOpacity(0.7),
                                    spreadRadius: 3,
                                    blurRadius: 2,
                                    offset:
                                    const Offset(0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: const Padding(
                                padding: EdgeInsets.fromLTRB(15,10,0,0),
                                child: Text(
                                  'Rejected Applications',
                                  style: TextStyle(
                                    fontFamily: 'Raleway',
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: (){
                            Navigator.push(
                              context,
                              PageTransition(
                                child: selected_players_review_insights(),
                                type: PageTransitionType.fade,
                              ),
                            );
                          },
                          child: Center(
                            child: Container(
                              margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                              height: 50,
                              width: 280,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.white.withOpacity(0.7),
                                    spreadRadius: 3,
                                    blurRadius: 2,
                                    offset:
                                    const Offset(0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: const Padding(
                                padding: EdgeInsets.fromLTRB(15,10,0,0),
                                child: Text(
                                  'Selected players',
                                  style: TextStyle(
                                    fontFamily: 'Raleway',
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: (){
                            Navigator.push(
                              context,
                              PageTransition(
                                child: substituted_player_reports(),
                                type: PageTransitionType.fade,
                              ),
                            );
                          },
                          child: Center(
                            child: Container(
                              margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                              height: 50,
                              width: 280,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.white.withOpacity(0.7),
                                    spreadRadius: 3,
                                    blurRadius: 2,
                                    offset:
                                    const Offset(0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: const Padding(
                                padding: EdgeInsets.fromLTRB(15,10,0,0),
                                child: Text(
                                  'Substituted players',
                                  style: TextStyle(
                                    fontFamily: 'Raleway',
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
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
