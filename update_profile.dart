import 'dart:convert';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
// import 'package:toast/toast.dart';
import 'package:http/http.dart' as http;
import 'package:page_transition/page_transition.dart';
import 'package:teamsync/Screens/qr.dart';

class update_profile extends StatefulWidget {
  final String email;
  final Map<String, dynamic> applicantData;

  const update_profile({super.key, required this.email, required this.applicantData});

  @override
  State<update_profile> createState() => _update_profileState();
}

class _update_profileState extends State<update_profile> {
  String selectedGender = 'Male';
  String selectedYear = 'FY';
  String selectedCourse='BSc';
  String selectedfoot='left';
  String selectedpp='defense';

  TextEditingController dateInput = TextEditingController();
  TextEditingController name=TextEditingController();
  TextEditingController roll_no=TextEditingController();
  TextEditingController height= TextEditingController();
  TextEditingController weight= TextEditingController();
  @override
  void initState() {
    dateInput.text = "";
    @override
    void initState() {
      // Initialize fields with data from applicantData
      name.text = widget.applicantData['name'];
      selectedGender = widget.applicantData['gender'];
      dateInput.text = widget.applicantData['dob'];
      selectedYear = widget.applicantData['year'];
      selectedCourse = widget.applicantData['course'];
      roll_no.text = widget.applicantData['roll_no'];
      height.text = widget.applicantData['height'];
      weight.text = widget.applicantData['weight'];
      selectedfoot = widget.applicantData['strong_foot'];
      selectedpp = widget.applicantData['pp'];

      super.initState();
    }
    super.initState();
  }
  bool _signUp() {
    // Validate name
    final namePattern = RegExp(r'^[a-zA-Z ]+$');
    if (name.text.isEmpty) {
      showToastMessage(context, 'Name cannot be empty');
      return false;
    }else if(!namePattern.hasMatch(name.text)){
      showToastMessage(context, 'Invalid name entered.');
      return false;
    }

    // Validate other fields
    if (dateInput.text.isEmpty) {
      showToastMessage(context, 'Date has not been entered.');
      return false;
    }else if(!isDateValid(dateInput.text)){
      showToastMessage(context, 'Invalid date entry.');
      return false;
    }

    final rollNoPattern = RegExp(r'^[ABCD][0][7-9][0-9]$');
    if (roll_no.text.isEmpty ) {
      showToastMessage(context, 'Enter Roll no.');
      return false;
    }else if(!rollNoPattern.hasMatch(roll_no.text)){
      showToastMessage(context, 'Invalid Roll no entered.');
      return false;
    }

    final heightPattern = RegExp(r'^\d+$');
    if (height.text.isEmpty || !heightPattern.hasMatch(height.text)) {
      showToastMessage(context, 'Enter height..');
      return false;
    }else if(!heightPattern.hasMatch(height.text)){
      showToastMessage(context, 'Invalid height value.');
      return false;
    }

    final weightPattern = RegExp(r'^\d+$');
    if (weight.text.isEmpty) {
      showToastMessage(context, 'Enter weight.');
      return false;
    }else if(!weightPattern.hasMatch(weight.text)){
      showToastMessage(context, 'Invalid weight value.');
      return false;
    }

    return true;
  }

  bool isDateValid(String dateStr) {
    try {
      final date = DateFormat('yyyy-MM-dd').parse(dateStr);
      final lowerDate = DateFormat('yyyy-MM-dd').parse('2000-01-01');
      final upperDate = DateFormat('yyyy-MM-dd').parse('2005-12-31');
      return date.isAfter(lowerDate) && date.isBefore(upperDate);
    } catch (e) {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    String mailid=widget.email;
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
                    child: const Text(
                      'Update Profile',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 45,
                        fontFamily: 'Raleway',
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: const Text(
                      'Need a change?',
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
                    margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                    // height: 55,
                    // width: 20,
                    child: TextField(
                      controller: name,
                      autofocus: false,
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
                        hintText: "Name",
                        hintStyle: const TextStyle(
                          color: Colors.white,
                        ),
                        prefixIcon: const Icon(
                          Icons.people,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(10, 0, 0, 10),
                        decoration: BoxDecoration(
                          color: Colors.blue.shade300,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: DropdownButton<String>(
                          value: selectedGender,
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedGender = newValue!;
                            });
                          },
                          alignment: Alignment.center,
                          items:
                          <String>['Male', 'Female'].map((String gender) {
                            return DropdownMenuItem<String>(
                              value: gender,
                              child: Padding(
                                padding: const EdgeInsets.all(7.0),
                                child: Text(
                                  textAlign: TextAlign.center,
                                  gender,
                                  style: const TextStyle(
                                    fontFamily: 'Raleway',
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    // color: Colors.white,
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(8, 0, 0, 10),
                        width: 200,
                        height: 50,
                        child: TextField(
                          controller: dateInput,
                          style: const TextStyle(
                            fontFamily: 'Raleway',
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            suffixIcon: const Icon(Icons.calendar_today),
                            labelText: "Date of Birth" ,//label text of field
                            labelStyle: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
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
                            //editing controller of this TextField
                          ),
                          readOnly: true,
                          //set it true, so that user will not able to edit text
                          onTap: () async {
                            DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1950),
                                //DateTime.now() - not to allow to choose before today.
                                lastDate: DateTime(2100));

                            if (pickedDate != null) {
                              print(
                                  pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                              String formattedDate =
                              DateFormat('yyyy-MM-dd').format(pickedDate);
                              print(
                                  formattedDate); //formatted date output using intl package =>  2021-03-16
                              setState(() {
                                dateInput.text =
                                    formattedDate; //set output date to TextField value.
                              });
                            } else {}
                          },
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(10, 0, 0, 10),
                        decoration: BoxDecoration(
                          color: Colors.blue.shade300,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: DropdownButton<String>(

                          value: selectedYear,
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedYear = newValue!;
                            });
                          },
                          alignment: Alignment.center,
                          items:
                          <String>['FY', 'SY', 'TY'].map((String st_year) {
                            return DropdownMenuItem<String>(
                              value: st_year,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  textAlign: TextAlign.center,
                                  st_year,
                                  style: const TextStyle(
                                    fontFamily: 'Raleway',
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    // color: Colors.white,
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(10, 0, 0, 10),
                        decoration: BoxDecoration(
                          color: Colors.blue.shade300,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: DropdownButton<String>(

                          value: selectedCourse,
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedCourse = newValue!;
                            });
                          },
                          alignment: Alignment.center,
                          items:
                          <String>['BSc','BCom','BA'].map((String st_course) {
                            return DropdownMenuItem<String>(
                              value: st_course,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  textAlign: TextAlign.center,
                                  st_course,
                                  style: const TextStyle(
                                    fontFamily: 'Raleway',
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    // color: Colors.white,
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(10, 0, 0, 10),
                        width: 125,
                        height: 48,
                        child: TextField(
                          controller: roll_no,
                          autofocus: false,
                          style: const TextStyle(
                            fontFamily: 'Raleway',
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
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
                            labelText: 'Roll no.',
                            hintText: "Ex-*D092",
                            hintStyle: const TextStyle(
                              color: Colors.white,
                            ),
                            labelStyle: const TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(10, 0, 0, 10),
                        width: 125,
                        height: 48,
                        child: TextField(
                          controller: height,
                          autofocus: false,
                          style: const TextStyle(
                            fontFamily: 'Raleway',
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
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
                            labelText: 'height(in cms)',
                            labelStyle: const TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(10, 0, 0, 10),
                        width: 165,
                        height: 48,
                        child: TextField(
                          controller: weight,
                          autofocus: false,
                          style: const TextStyle(
                            fontFamily: 'Raleway',
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
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
                            labelText: 'weight(in kgs)',
                            labelStyle: const TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child:const Text(
                          '*Strong foot : ',
                          style: TextStyle(
                            fontFamily: 'Raleway',
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(30, 0, 0, 10),
                        decoration: BoxDecoration(
                          color: Colors.blue.shade300,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: DropdownButton<String>(
                          value: selectedfoot,
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedfoot = newValue!;
                            });
                          },
                          alignment: Alignment.center,
                          items:
                          <String>['right', 'left'].map((String st_foot) {
                            return DropdownMenuItem<String>(
                              value: st_foot,
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(55,0,51,0),
                                child: Text(
                                  textAlign: TextAlign.center,
                                  st_foot,
                                  style: const TextStyle(
                                    fontFamily: 'Raleway',
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    // color: Colors.white,
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child:const Text(
                          '*Preferred Position : ',
                          style: TextStyle(
                            fontFamily: 'Raleway',
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(10, 0, 0, 10),
                        decoration: BoxDecoration(
                          color: Colors.blue.shade300,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: DropdownButton<String>(
                          value: selectedpp,
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedpp = newValue!;
                            });
                          },
                          alignment: Alignment.center,
                          items:
                          <String>['attack', 'midfield','defense','goalkeeper'].map((String st_pp) {
                            return DropdownMenuItem<String>(
                              value: st_pp,
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(10,0,10,0),
                                child: Text(
                                  textAlign: TextAlign.center,
                                  st_pp,
                                  style: const TextStyle(
                                    fontFamily: 'Raleway',
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    // color: Colors.white,
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                  DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.blue.shade600,
                          Colors.blue.shade900,

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
                        Future<String?> device_token=extract_token();
                        if (!_signUp()) {
                          return; // Validation failed, don't proceed further
                        }
                        Map<String, dynamic> result = {
                          'email': mailid, // Replace with actual user's email
                          'name': name.text,
                          'gender': selectedGender,
                          'dob': dateInput.text,
                          'year': selectedYear,
                          'course': selectedCourse,
                          'roll_no': roll_no.text,
                          'height': height.text,
                          'weight': weight.text,
                          'strong_foot': selectedfoot,
                          'pp': selectedpp,
                          'application_status': 'pending', // You can set an initial status
                          'device_token':device_token,
                        };
                        print(result);
                        onApplicationSubmit(context,mailid);
                        // qr(result: result,);
                        Navigator.pop(
                          context,
                          result,
                        );

                        print("You pressed Elevated Button");
                      },
                      child: Container(
                        margin:
                        const EdgeInsetsDirectional.fromSTEB(8, 5, 8, 0),
                        height: 30,
                        width: 225,
                        child: const Text(
                          'Update Application Profile',
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  Future<void> submitApplication(BuildContext context,Map<String, dynamic> applicationData) async {
    final url = Uri.parse('http://192.168.0.106:3004/addApplicant');
    // final url = Uri.parse('http://192.168.58.234:3004/addApplicant');

    try {
      final response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(applicationData),
      );

      if (response.statusCode == 200) {
        // Application submitted successfully
        showToastMessage(context,'Application submitted successfully');
      } else {
        // Error submitting application
        showToastMessage(context,'Error submitting application');
      }
    } catch (e) {
      // Handle any network or server-related errors here
      print('Error: $e');
      showToastMessage(context,'Error: $e');
    }
  }

  void showToastMessage(BuildContext context, String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black,
      textColor: Colors.white,
    );
  }

// ...

// Call this function when the submit button is pressed
  Future<void> onApplicationSubmit(BuildContext context, String mailid) async {
    final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

    // Get the device token
    String? deviceToken = await _firebaseMessaging.getToken();
    // Gather updated applicant's data and create a map
    Map<String, dynamic> updatedApplicationData = {
      'email': mailid, // Replace with actual user's email
      'name': name.text,
      'gender': selectedGender,
      'dob': dateInput.text,
      'year': selectedYear,
      'course': selectedCourse,
      'roll_no': roll_no.text,
      'height': height.text,
      'weight': weight.text,
      'strong_foot': selectedfoot,
      'pp': selectedpp,
      'application_status': 'pending', // You can set an initial status
      'device_token': deviceToken,
    };
    print(deviceToken);
    // Call the updateApplication function to send the updated data to your API
    updateProfile(context, updatedApplicationData);
  }
  Future<String?> extract_token() async {
    final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

    // Get the device token
    String? deviceToken = await _firebaseMessaging.getToken();
    return deviceToken;
  }

  Future<void> updateProfile(BuildContext context, Map<String, dynamic> userData) async {
    final String apiUrl = 'http://192.168.0.106:3001/updateProfile'; // Replace with your server URL

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(userData),
      );

      if (response.statusCode == 200) {
        // User profile updated successfully
        showToastMessage(context, 'Profile updated successfully');
      } else if (response.statusCode == 404) {
        // User not found
        showToastMessage(context, 'User not found');
      } else {
        // Error updating profile
        showToastMessage(context, 'Error updating profile');
      }
    } catch (e) {
      // Handle any network or server-related errors here
      print('Error: $e');
      showToastMessage(context, 'Error: $e');
    }
  }
}
