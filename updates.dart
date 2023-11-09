import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:page_transition/page_transition.dart';
import 'package:teamsync/Screens/team_updates.dart';
import 'package:teamsync/Screens/venue.dart';

class updates extends StatefulWidget {
  final Map<String, dynamic> player;
  const updates({super.key,required this.player});

  @override
  State<updates> createState() => _updatesState();
}

class _updatesState extends State<updates> {
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
          automaticallyImplyLeading: false,
          bottom: PreferredSize(
              preferredSize: const Size(100, 125),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: const Text(
                      'Up-to-Date',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 45,
                        fontFamily: 'Raleway',
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: const Text(
                      'kick off!',
                      style: TextStyle(
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
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
                                child: const venue(),
                                type: PageTransitionType.fade,
                              ),
                            );
                          },
                          child: Center(
                            child: Container(
                              margin: const EdgeInsets.fromLTRB(0, 80, 0, 20),
                              height: 50,
                              width: 280,
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
                                    color: Colors.white.withOpacity(0.7),
                                    spreadRadius: 3,
                                    blurRadius: 2,
                                    offset:
                                    const Offset(0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: const Padding(
                                padding: EdgeInsets.fromLTRB(15,0,0,0),
                                child: Text(
                                  'Venue & Timing',
                                  style: TextStyle(
                                    fontFamily: 'Raleway',
                                    fontSize: 35,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Center(
                          child: GestureDetector(
                            onTap: (){
                              Navigator.push(
                                context,
                                PageTransition(
                                  child: team_updates(player:widget.player),
                                  type: PageTransitionType.fade,
                                ),
                              );
                            },
                            child: Container(
                              margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                              height: 50,
                              width: 280,
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
                                    color: Colors.white.withOpacity(0.7),
                                    spreadRadius: 3,
                                    blurRadius: 2,
                                    offset:
                                    const Offset(0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: const Padding(
                                padding: EdgeInsets.fromLTRB(27,0,0,0),
                                child: Text(
                                  'Team updates',
                                  style: TextStyle(
                                    fontFamily: 'Raleway',
                                    fontSize: 35,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
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
