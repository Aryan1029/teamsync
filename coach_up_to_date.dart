import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:page_transition/page_transition.dart';
import 'package:teamsync/Screens/HomeScreen.dart';
import 'package:http/http.dart' as http;
import 'package:teamsync/Screens/updates.dart';
// import 'package:teamsync/Screens/team_coach_up_to_date.dart';
import 'package:teamsync/Screens/venue.dart';

class coach_up_to_date extends StatefulWidget {
  // final Map<String, dynamic> player;
  const coach_up_to_date({super.key});

  @override
  State<coach_up_to_date> createState() => _coach_up_to_dateState();
}

class _coach_up_to_dateState extends State<coach_up_to_date> {
  String selectedGender = 'None'; // Initialize with an option other than 'None'
  String selectedVenue = '';
  String selectedTime = '7:00 AM';
  TextEditingController dateInput = TextEditingController();
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
          // automaticallyImplyLeading: false,
          bottom: PreferredSize(
              preferredSize: const Size(100, 125),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: const Text(
                      'Set Venue & Timing',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                        fontFamily: 'Raleway',
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: const Text(
                      'up-to-date!',
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
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(8, 0, 0, 10),
                    width: 300,
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
                        labelText: "Select Date for your trials",
                        // Label text of field
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
                      ),
                      readOnly: true,
                      onTap: () async {
                        DateTime currentDate = DateTime.now();
                        DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: currentDate,
                          firstDate: currentDate,
                          // Allow selection from today or later
                          lastDate: DateTime(2100),
                        );

                        if (pickedDate != null) {
                          String formattedDate = DateFormat('yyyy-MM-dd')
                              .format(pickedDate);
                          setState(() {
                            dateInput.text = formattedDate;
                          });
                        }
                      },
                    ),
                  ),
                  Container(
                    width: 300,
                    margin: const EdgeInsets.fromLTRB(10, 0, 0, 10),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade300,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: DropdownButton<String>(
                      value: selectedGender,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedGender = newValue!;
                          if (selectedGender ==
                              'Celebrations Turf-Tiger Play') {
                            selectedVenue =
                            'https://maps.app.goo.gl/n63pHwSMcPERVhFH6';
                          }
                          if (selectedGender == 'Citi Mall Turf-Tiger Play') {
                            // Set a Google Maps link for Citi Mall-Tiger Play
                            selectedVenue =
                            'https://maps.app.goo.gl/gYyoFWSxRpbBMTQ7A';
                          }
                          if (selectedGender ==
                              'Ryan Global-Dream Sports Fields') {
                            // Set a Google Maps link for Citi Mall-Tiger Play
                            selectedVenue =
                            'https://maps.app.goo.gl/YmhQe2cSwDEyfjzd8';
                          }
                          print(selectedVenue);
                        });
                      },
                      alignment: Alignment.center,
                      items:
                      <String>[
                        'None',
                        'Celebrations Turf-Tiger Play',
                        'Citi Mall Turf-Tiger Play',
                        'Ryan Global-Dream Sports Fields'
                      ].map((String gender) {
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

                  Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(15, 0, 20, 0),
                        child: const Text(
                          '*Reporting Time : ',
                          style: TextStyle(
                            fontFamily: 'Raleway',
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        width: 127,
                        margin: const EdgeInsets.fromLTRB(10, 0, 0, 10),
                        decoration: BoxDecoration(
                          color: Colors.blue.shade300,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: DropdownButton<String>(
                          alignment: Alignment.center,
                          value: selectedTime,
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedTime = newValue!;
                            });
                          },
                          items: List.generate(13, (int index) {
                            int hour = 7 + index;
                            String time = '$hour:00 AM';
                            if (hour > 12) {
                              hour -= 12;
                              time = '$hour:00 PM';
                            }
                            return DropdownMenuItem<String>(
                              value: time,
                              child: Padding(
                                padding: const EdgeInsets.all(7),
                                child: Text(
                                  time,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontFamily: 'Raleway',
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            );
                          }),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.blue.shade400,
                            Colors.blue.shade800,

                            //add more colors
                          ],
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          disabledForegroundColor: Colors.transparent
                              .withOpacity(0.38),
                          disabledBackgroundColor: Colors.transparent
                              .withOpacity(0.12),
                          shadowColor: Colors.transparent,
                          //make color or elevated button transshparent
                          elevation: 0.0,
                        ),
                        onPressed: () {
                          storeData();
                          Navigator.pop(context);
                        },
                        child: Container(
                          margin: const EdgeInsetsDirectional.fromSTEB(
                              8, 5, 8, 0),
                          height: 30,
                          width: 225,
                          child: const Text(
                            'Submit',
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
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> storeData() async {
    final apiUrl = Uri.parse('http://192.168.94.234:3018/storeData');

    final data = {
      'venue_name': selectedGender,
      'time': selectedTime,
      'venue': selectedVenue,
      'date': dateInput.text,
    };

    print('Sending data to server: $data');

    try {
      final response = await http.post(
        apiUrl,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(data),
      );

      if (response.statusCode == 200) {
        // Application submitted successfully
        showToastMessage(context, 'Venue & timing details saved successfully');
      } else {
        // Error submitting application
        showToastMessage(context, 'Error');
      }
    } catch (e) {
      // Handle any network or server-related errors here
      print('Error: $e');
      showToastMessage(context, 'Error:$e');
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
}
