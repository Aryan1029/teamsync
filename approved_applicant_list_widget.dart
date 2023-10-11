import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:page_transition/page_transition.dart';
import 'package:teamsync/Screens/approved_applicant_final_profile_page.dart';

import '../Screens/ApplicantProfilePage.dart';

class approved_applicant_list_widget extends StatefulWidget {
  final VoidCallback updateCallback; //Callback Function
  const approved_applicant_list_widget({super.key,required this.updateCallback});
  @override
  State<approved_applicant_list_widget> createState() => _approved_applicant_list_widgetState();
}

class _approved_applicant_list_widgetState extends State<approved_applicant_list_widget> {
  @override
  Future<List<Map<String, dynamic>>> fetchApplicants() async {
    final response =
    await http.get(Uri.parse('http://192.168.0.106:3005/approved_applicant_list?'));
    // await http.get(Uri.parse('http://10.100.47.19:3005/approved_applicant_list?'));
    if (response.statusCode == 200) {
      // If the server returns a 200 OK response, parse the JSON
      final List<dynamic> data = json.decode(response.body);
      return data.cast<Map<String, dynamic>>();
    } else {
      // If the server did not return a 200 OK response,
      // throw an exception or handle the error as needed.
      throw Exception('Failed to load data');
    }
  }

  void navigateToProfilePage(BuildContext context, Map<String, dynamic> data) async{
    // Navigator.pushNamed(context, ApplicantProfilePage(applicant: applicant) as String);
    print(data.runtimeType);
    final result= await Navigator.push(
      context,
      PageTransition(
        child: approved_applicant_final_profile_page(applicant: data),
        type: PageTransitionType.fade,
      ),
    );
    if (result == true) {
      // Fetch and update the applicant list again
      widget.updateCallback(); // Call the callback to refresh the list
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: fetchApplicants(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator(); // Show a loading indicator while fetching data
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          final applicants = snapshot.data ?? [];
          final applicantCount = applicants.length;
          return ListView.builder(
            itemCount: applicantCount,
            itemBuilder: (context, index) {
              final applicant = applicants[index];
              return Container(
                margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: ElevatedButton(
                  onPressed: () {
                    print(applicant);
                    navigateToProfilePage(context, applicant);
                  },
                  style: ButtonStyle(
                    backgroundColor:
                    const MaterialStatePropertyAll<Color>(Colors.white54),
                    shadowColor:
                    const MaterialStatePropertyAll<Color>(Colors.white),
                    foregroundColor:
                    const MaterialStatePropertyAll<Color>(Colors.black),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    )),
                  ),
                  child: Container(
                    // margin: EdgeInsets.all(10),
                    // child: Text(
                    //   'ID: ${applicant['id']}, Name: ${applicant['name']}, Position: ${applicant['pp']}',
                    //   style: TextStyle(fontSize: 16),
                    // ),
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 10, 60, 10),
                          padding: const EdgeInsets.all(40),
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/profile_pic.png'),
                              fit: BoxFit.cover,
                            ),
                            shape: BoxShape.circle,
                          ),
                        ),
                        Text(
                          '${applicant['name']}',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        }
      },
    );
  }
}

