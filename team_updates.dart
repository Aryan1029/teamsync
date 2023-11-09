import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher_string.dart';

class team_updates extends StatefulWidget {
  final Map<String, dynamic> player;
  const team_updates({super.key, required this.player});

  @override
  State<team_updates> createState() => _team_updatesState();
}

class _team_updatesState extends State<team_updates> {
  bool isAdded = false;
  bool isSelected = false;
  bool isSubstituted = false;

  @override
  void initState() {
    super.initState();
    // Call didChangeDependencies explicitly to initialize the state
    didChangeDependencies();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Fetch the applicant data whenever the dependencies change
    if (widget.player['team'] != 'NA') {
      setState(() {
        isAdded = true;
      });
    }
    if (widget.player['application_status'] == 'selected') {
      setState(() {
        isSelected = true;
      });
    }

    if (widget.player['application_status'] == 'substituted') {
      setState(() {
        isSubstituted = true;
      });
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
              preferredSize: const Size(100, 125),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: const Text(
                      'Team Updates',
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
                      'Stay on your toes lad',
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
                        if (isAdded)
                          Padding(
                            padding: const EdgeInsets.all(12),
                            child: Text(
                              "⚽You have been added to Team : ${widget.player['team']}",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Raleway',
                                fontSize: 18,
                                color: Colors
                                    .white, // You can choose your desired color
                              ),
                            ),
                          )
                        else
                          const SizedBox.shrink(),
                        if (isSelected)
                          Container(
                            margin: const EdgeInsets.all(10),
                            child: Column(children: [
                              const Text(
                                "⚽Congratulations you have been selected in the team.",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Raleway',
                                  fontSize: 18,
                                  color: Colors
                                      .white, // You can choose your desired color
                                ),
                              ),
                              GestureDetector(
                                child: Container(
                                  margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                                  width: 450,
                                  decoration: BoxDecoration(
                                    color: Colors.black26,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Center(
                                      child: Text(
                                        "⚽Join the Group Chat",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Raleway',
                                          fontSize: 18,
                                          color: Colors
                                              .white, // You can choose your desired color
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                onTap: () {
                                  launchUrlString(
                                      'https://chat.whatsapp.com/LW0qHFtj0lp8XraeZlN7sh');
                                },
                              ),
                            ],
                            ),
                          )
                        else
                          const SizedBox.shrink(), // This will render an empty space if not applied
                        if (isSubstituted)
                          const Padding(
                            padding: EdgeInsets.all(15.0),
                            child: Text(
                              "⚽ Better Luck Next Time!",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                fontFamily: 'raleway',
                                color: Colors.white,// You can choose your desired color
                              ),
                            ),
                          )
                        else
                          const SizedBox.shrink(),
                        const SizedBox(
                          height: 20,
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
