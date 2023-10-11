import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PlayerProfileScreen extends StatelessWidget {
  final Map<String, dynamic> player;

  PlayerProfileScreen({required this.player});

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
                    '${player['name']}',
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
                          'Year : ${player['year']}',
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
                          'Course : ${player['course']}',
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
                          'Gender : ${player['gender']}',
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
                          'Roll no: ${player['roll_no']}',
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
                      'DOB : ${player['dob']}',
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
                          'height : ${player['height']} cms',
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
                          'weight: ${player['weight']} kg',
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
                      'position: ${player['pp']}',
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
                      'Strong foot: ${player['strong_foot']}',
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
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(20,0,0,0),
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [
                                Colors.white,
                                Colors.white,

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
                              print("You pressed Elevated Button");
                              selectApplicant('${player['name']}');
                              Navigator.pop(context, true);
                            },
                            child: Container(
                              height: 35,
                              width: 140,
                              child: const Text(
                                '🟢\nConfirm Selection',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'Raleway',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(30,5,0,0),
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [
                                Colors.white,
                                Colors.white,

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
                              print("You pressed Elevated Button");
                              substituteApplicant('${player['name']}');
                              // Navigate back to the parent page (applicant_list)
                              Navigator.pop(context, true); // Pass a result indicating success
                            },
                            child: Container(
                              height: 35,
                              width: 70,
                              child: const Text(
                                '🔵\nSubstitute',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'Raleway',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  Future<void> selectApplicant(String applicantName) async {
    final apiUrl = Uri.parse('http://192.168.0.106:3009/select-applicant'); // Replace with your Node.js API URL
    final response = await http.put(
      apiUrl,
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'applicantName': applicantName}),
    );

    if (response.statusCode == 200) {
      // Status updated successfully
      print('Status updated successfully');
      // You can add any further actions or UI updates here
      Fluttertoast.showToast(
          msg: '${applicantName} has been selected.' ,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }
  }

  Future<void> substituteApplicant(String applicantName) async {
    final apiUrl = Uri.parse('http://192.168.0.106:3011/substitute-applicant'); // Replace with your Node.js API URL
    final response = await http.put(
      apiUrl,
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'applicantName': applicantName}),
    );

    if (response.statusCode == 200) {
      // Status updated successfully
      print('Status updated successfully');
      // You can add any further actions or UI updates here
      Fluttertoast.showToast(
          msg: '${applicantName} has been substituted.' ,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }
  }
}
