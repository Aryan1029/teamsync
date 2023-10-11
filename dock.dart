import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:teamsync/Screens/apply.dart';
import 'package:teamsync/Screens/qr.dart';
import 'package:page_transition/page_transition.dart';
import 'package:teamsync/Screens/update_profile.dart';
import 'package:teamsync/Screens/updates.dart';

class dock extends StatefulWidget {
  final String email;
  const dock({super.key, required this.email});

  @override
  State<dock> createState() => _dockState();
}

class _dockState extends State<dock> {
  late final Map<String, dynamic> application_form_values;
   Map<String, dynamic> applicantData={};

  bool hasApplied = false;
  bool isApproved=false;
  bool isPending=false;
  bool isRejected=false;

  @override
  void initState() {
    super.initState();
    // Call didChangeDependencies explicitly to initialize the state
    didChangeDependencies();
  }
  Future<void> didChangeDependencies() async {
    super.didChangeDependencies();
    // Fetch the applicant data whenever the dependencies change
    await fetchApplicantData(widget.email).then((result) {
      if (result.containsKey('error')) {
        print(result['error']);
      } else {
        applicantData = result['applicant'];
        print('Applicant Name: ${applicantData['name']}');
        // Print other applicant data as needed

        // Check if the user has applied
        if (applicantData['email'] == widget.email) {
          setState(() {
            hasApplied = true;
          });
        }
        if (applicantData['application_status'] == 'substituted' ||
            applicantData['application_status'] == 'approved') {
          setState(() {
            isApproved = true;
          });
        }
        if (applicantData['email'] == widget.email &&
            applicantData['application_status'] == 'selected') {
          setState(() {
            hasApplied = true;
            isApproved = true;
          });
        }

        if (applicantData['application_status'] == 'pending') {
          setState(() {
            isPending = true;
          });
        }
        if (applicantData['application_status'] == 'rejected') {
          setState(() {
            isRejected = true;
          });
        }
      }
    });
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
                Row(
                  children: [
                    Column(
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(20, 60, 0, 0),
                          child: const Text(
                            'Welcome!',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 45,
                              fontFamily: 'Raleway',
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(20, 0, 0, 10),
                          child: const Text(
                            'user dashboard',
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
                    Container(
                      height: 85,
                      width: 85,
                      margin: EdgeInsets.fromLTRB(30, 60, 0, 25),
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/profile_pic.png'),
                          fit: BoxFit.fitHeight,
                        ),
                        shape: BoxShape.circle,
                      ),
                      ),
                  ],
                ),
              ],
            ),
          ),
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
                  height: 20,
                ),
                if (hasApplied && isApproved)
                  const Text(
                    'Application status: approved',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.green, // You can choose your desired color
                    ),
                  )
                else
                  SizedBox.shrink(),
                if (hasApplied && isPending)
                  const Text(
                    'Application status: pending',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black, // You can choose your desired color
                    ),
                  )
                else
                  SizedBox.shrink(), // This will render an empty space if not applied
                const SizedBox(
                  height: 20,
                ),
                if (hasApplied && isRejected)
                  const Text(
                    'Application status: rejected',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.red, // You can choose your desired color
                    ),
                  )
                else
                  SizedBox.shrink(), // This will render an empty space if not applied
                const SizedBox(
                  height: 20,
                ),

                Row(
                  children: [
                    GestureDetector(
                      onTap: () async {
                        print(isPending);
                        if(hasApplied){
                          Fluttertoast.showToast(
                            msg: "You've already applied.",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0,
                          );
                        }else{
                          application_form_values = await Navigator.push(
                            context,
                            PageTransition(
                              child: apply(email: widget.email),
                              type: PageTransitionType.fade,
                            ),
                          ) as Map<String, dynamic>;
                        }

                      },
                      child: Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          color: Colors.blue.shade300,
                          borderRadius: BorderRadius.circular(15),
                          gradient: LinearGradient(colors: [
                            Colors.blue.shade200,
                            Colors.blue.shade700,
                          ]),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.4),
                              spreadRadius: 10,
                              blurRadius: 7,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        margin:
                            const EdgeInsetsDirectional.fromSTEB(25, 0, 0, 0),
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0, 55, 0, 0),
                        child: const Text(
                          textAlign: TextAlign.center,
                          'Apply',
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
                        print('pending or not : ${isPending}');
                        didChangeDependencies();
                        if(hasApplied==false){
                          Fluttertoast.showToast(
                            msg: "User Application not found, apply first.",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0,
                          );
                        }else if(isPending==true){
                          Navigator.push(
                            context,
                            PageTransition(
                              child: update_profile(email: applicantData['email'], applicantData: applicantData),
                              type: PageTransitionType.fade,
                            ),
                          );
                        }else{
                          Fluttertoast.showToast(
                            msg: "Profiles of only pending applications can be edited",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0,
                          );
                        }
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
                              offset: const Offset(
                                  0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        margin: const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0, 55, 0, 0),
                        child: const Text(
                          textAlign: TextAlign.center,
                          'Update Profile',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 23,
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
                      onTap: () async {
                        if (!hasApplied) {
                          // Show a Flutter toast if the user hasn't applied
                          Fluttertoast.showToast(
                            msg: "User Application not found, apply first.",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0,
                          );
                        }else if(!isApproved){
                          Fluttertoast.showToast(
                            msg: "Application yet to be approved for gaining access to this section.",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0,
                          );
                        }
                        else {
                          Navigator.push(
                            context,
                            PageTransition(
                              child: updates(player:applicantData),
                              type: PageTransitionType.fade,
                            ),
                          );
                        }
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
                              offset: const Offset(
                                  0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        margin:
                            const EdgeInsetsDirectional.fromSTEB(25, 30, 0, 30),
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0, 55, 0, 0),
                        child: const Text(
                          textAlign: TextAlign.center,
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
                      onTap: () {
                        Navigator.push(
                          context,
                          PageTransition(
                            child: qr(result: applicantData),
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
                          gradient: LinearGradient(colors: [
                            Colors.blue.shade700,
                            Colors.blue.shade200,
                          ]),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.4),
                              spreadRadius: 10,
                              blurRadius: 7,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        margin: EdgeInsetsDirectional.fromSTEB(10, 30, 0, 30),
                        padding: EdgeInsetsDirectional.fromSTEB(0, 55, 0, 0),
                        child: const Text(
                          textAlign: TextAlign.center,
                          'QR',
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
                ElevatedButton(
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
                        fontSize: 16.0);
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        const MaterialStatePropertyAll<Color>(Colors.white38),
                    shadowColor:
                        const MaterialStatePropertyAll<Color>(Colors.white),
                    foregroundColor:
                        const MaterialStatePropertyAll<Color>(Colors.black),
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
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<Map<String, dynamic>> fetchApplicantData(String email) async {
    final url = Uri.parse('http://192.168.0.106:3008/fetchApplicantData');
    final headers = {'Content-Type': 'application/json'};
    final body = jsonEncode({'email': email});

    try {
      final response = await http.post(url, headers: headers, body: body);

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        print(jsonData);
        return jsonData;
      } else if (response.statusCode == 404) {
        // Applicant not found
        return {'error': 'No applicant found with this email'};
      } else {
        // Handle other error cases
        return {'error': 'Error fetching applicant data'};
      }
    } catch (e) {
      // Handle network or other errors
      return {'error': 'Error: $e'};
    }
  }

}

