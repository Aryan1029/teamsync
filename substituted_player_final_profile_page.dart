import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class substituted_player_final_profile_page extends StatefulWidget {
  final Map<String, dynamic> applicant;

  const substituted_player_final_profile_page({Key? key, required this.applicant})
      : super(key: key);

  @override
  State<substituted_player_final_profile_page> createState() => _substituted_player_final_profile_pageState();
}

class _substituted_player_final_profile_pageState extends State<substituted_player_final_profile_page> {
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
            preferredSize: const Size(100, 600),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                  padding: const EdgeInsets.all(70),
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/profile_pic.png'),
                      fit: BoxFit.fitHeight,
                    ),
                    shape: BoxShape.circle,
                  ),
                ),
                Container(
                  width: 400,
                  height: 57,
                  margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Text(
                    '${widget.applicant['name']}',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 42,
                      fontFamily: 'Raleway',
                    ),
                  ),
                ),
                Row(
                  children: [
                    Container(
                      width: 150,
                      height: 45,
                      margin: EdgeInsets.fromLTRB(20, 20, 0, 10),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.blue.shade300,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          textAlign: TextAlign.center,
                          'Year : ${widget.applicant['year']}',
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            fontFamily: 'Raleway',
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 160,
                      height: 45,
                      margin: const EdgeInsets.fromLTRB(10, 20, 0, 10),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.blue.shade300,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          textAlign: TextAlign.center,
                          'Course : ${widget.applicant['course']}',
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            fontFamily: 'Raleway',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      width: 150,
                      height: 45,
                      margin: EdgeInsets.fromLTRB(20, 0, 0, 10),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.blue.shade300,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          textAlign: TextAlign.center,
                          'Gender : ${widget.applicant['gender']}',
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            fontFamily: 'Raleway',
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 160,
                      height: 45,
                      margin: const EdgeInsets.fromLTRB(10, 0, 0, 10),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.blue.shade300,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          textAlign: TextAlign.center,
                          'Roll no: ${widget.applicant['roll_no']}',
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            fontFamily: 'Raleway',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  width: 185,
                  height: 45,
                  margin: EdgeInsets.fromLTRB(10, 0, 0, 10),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.blue.shade300,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      textAlign: TextAlign.center,
                      'DOB : ${widget.applicant['dob']}',
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        fontFamily: 'Raleway',
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Container(
                      width: 165,
                      height: 45,
                      margin: EdgeInsets.fromLTRB(20, 0, 0, 10),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.blue.shade300,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          textAlign: TextAlign.center,
                          'height : ${widget.applicant['height']} cms',
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            fontFamily: 'Raleway',
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 145,
                      height: 45,
                      margin: const EdgeInsets.fromLTRB(10, 0, 0, 10),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.blue.shade300,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          textAlign: TextAlign.center,
                          'weight: ${widget.applicant['weight']} kg',
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            fontFamily: 'Raleway',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  width: 180,
                  height: 45,
                  margin: const EdgeInsets.fromLTRB(10, 0, 0, 10),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.blue.shade300,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      textAlign: TextAlign.center,
                      'position: ${widget.applicant['pp']}',
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        fontFamily: 'Raleway',
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 180,
                  height: 45,
                  margin: const EdgeInsets.fromLTRB(10, 0, 0, 10),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.blue.shade300,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      textAlign: TextAlign.center,
                      'Strong foot: ${widget.applicant['strong_foot']}',
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        fontFamily: 'Raleway',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          backgroundColor: Colors.blue.shade700,
          elevation: 0.0,
        ),
        body: Container(
          height: 220,
          margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
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
                  const Text(
                    'Status:',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Raleway',
                      fontSize: 20,
                    ),
                  ),
                  Container(
                    margin: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 20),
                    child: Text(
                      '${widget.applicant['application_status']}',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Raleway',
                        fontSize: 18,
                        color: Colors.black,
                      ),
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
