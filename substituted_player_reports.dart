import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import '../widgets/approved_applicant_list_widget.dart';
import '../widgets/selected_players_widget.dart';
import '../widgets/substituted_players_widget.dart';

class substituted_player_reports extends StatefulWidget {
  const substituted_player_reports({super.key});

  @override
  State<substituted_player_reports> createState() => substituted_player_reportsState();
}

class substituted_player_reportsState extends State<substituted_player_reports> {
  int applicantCount = 0; // Initialize the count to 0
  @override
  Future<void> fetchApplicants() async {
    final response = await http.get(Uri.parse('http://192.168.0.106:3012/substituted_applicant_list?'));
    // final response = await http.get(Uri.parse('http://10.100.47.19:3005/approved_applicant_list?'));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      final count = data.length; // Extract the count from the API response
      setState(() {
        applicantCount = count; // Update the state variable with the count
      });
    } else {
      // Handle API error
      print('Failed to fetch data: ${response.statusCode}');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchApplicants(); // Call the fetchData method when the widget is first created
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
                      'Substituted Players',
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
                    child: Text(
                      'Current Count : $applicantCount',
                      style: const TextStyle(
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
              width: 300,
              margin: const EdgeInsets.fromLTRB(20, 50, 20, 0),
              child: ListView(
                children: [
                  Container(
                    height: 400,
                    width: 200,
                    margin: EdgeInsets.all(0),
                    child:substituted_players_widget(updateCallback: () async {
                      await fetchApplicants(); // Update the applicant list
                    },),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 20, 0, 0) ,
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
                          primary: Colors.transparent,
                          onSurface: Colors.transparent,
                          shadowColor: Colors.transparent,
                          //make color or elevated button transshparent
                          elevation: 0.0,
                        ),
                        onPressed: (){
                          // Navigator.push(
                          //   context,
                          //   PageTransition(
                          //     child: created_teams(),
                          //     type: PageTransitionType.fade,
                          //   ),
                          // );
                          Navigator.pop(context);
                        },
                        child: Container(
                          margin: const EdgeInsetsDirectional.fromSTEB(8, 5, 8, 0),
                          height: 30,
                          width: 225,
                          child: const Text(
                            'Go back to reports',
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

}
