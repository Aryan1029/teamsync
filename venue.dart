import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:page_transition/page_transition.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:teamsync/Screens/LoginScreen.dart';
import 'package:url_launcher/url_launcher_string.dart';

class venue extends StatefulWidget {
  const venue({super.key});

  @override
  State<venue> createState() => _venueState();
}

class _venueState extends State<venue> {
  TextEditingController email=TextEditingController();
  TextEditingController pass=TextEditingController();
  String chk_err="";
  String data = '';

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
              preferredSize: const Size(100, 150),
              child: Container(
                width: 400,

                margin: EdgeInsets.fromLTRB(11, 0, 0, 0),
                child: const Text(
                  'Venue & Timing',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 47,
                    fontFamily: 'Raleway',
                  ),
                ),
              )),
          backgroundColor: Colors.blue.shade700,
          elevation: 0.0,
        ),
        body: Container(
          height: 750,
          margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
            color: Colors.white,
          ),
          child: Center(

            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  QrImageView(
                    data: 'https://maps.app.goo.gl/3C6qQp9dh6MUAkdN6',
                    backgroundColor: Colors.white,
                    version: QrVersions.auto,
                    size: 300.0,
                  ),
                  Text('Report at the above venue on 21st October at 10pm',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Raleway',
                        fontSize: 16,
                      ),
                  ),
                  GestureDetector(
                    child: Container(
                      margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                      width: 250,
                      decoration: BoxDecoration(
                        color: Colors.black26,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Center(
                          child: Text(
                            "📌Go to Maps",
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
                          'https://maps.app.goo.gl/3C6qQp9dh6MUAkdN6');
                    },
                  ),
                  // ElevatedButton(onPressed: (){ print('boom');}, child: Text('Tester'))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
