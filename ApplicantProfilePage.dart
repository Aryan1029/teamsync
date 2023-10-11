import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApplicantProfilePage extends StatefulWidget {
  final Map<String, dynamic> applicant;

  const ApplicantProfilePage({Key? key, required this.applicant})
      : super(key: key);

  @override
  State<ApplicantProfilePage> createState() => _ApplicantProfilePageState();
}

class _ApplicantProfilePageState extends State<ApplicantProfilePage> {
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
                    'Review Application.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Raleway',
                      fontSize: 16,
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(60,0,0,0),
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
                              approveApplicant('${widget.applicant['name']}');
                              Navigator.pop(context, true);
                            },
                            child: Container(
                              height: 35,
                              width: 55,
                              child: const Text(
                                '✔️\nApprove',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'Raleway',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(60,5,0,0),
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
                              deleteApplicant('${widget.applicant['name']}');
                              // Navigate back to the parent page (applicant_list)
                              Navigator.pop(context, true); // Pass a result indicating success
                            },
                            child: Container(
                              height: 35,
                              width: 55,
                              child: const Text(
                                '❌\nReject',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'Raleway',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red,
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
  void deleteApplicant(String applicantName) async {
    final url = Uri.parse('http://192.168.0.106:3002/rejectApplicant');
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode({'applicant_name': applicantName}),
    );

    if (response.statusCode == 200) {
      print('${applicantName}\'s application rejected');
      Fluttertoast.showToast(
          msg: '${applicantName}\'s application has been successfully rejected' ,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
    } else {
      print('Failed to change the status');
    }
  }
  Future<void> approveApplicant(String applicantName) async {
    final apiUrl = Uri.parse('http://192.168.0.106:3003/approve-applicant'); // Replace with your Node.js API URL

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
          msg: '${applicantName}\'s application is approved.' ,
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
