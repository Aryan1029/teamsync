import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:http/http.dart' as http;

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
  String venueData = '';
  String venueName = '';
  String venueDate = '';
  String venueTime = '';
  String venueURL = '';
  Future<void> fetchData() async {
    final response = await http.get(Uri.parse('http://192.168.94.234:3019/fetch_venue_details'));

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      setState(() {
        venueData = response.body;
        print(response.body);
        venueName = jsonResponse[0]['venue_name'];
        final date = DateTime.parse(jsonResponse[0]['date']);
        venueDate = DateFormat('dd-MM-yyyy').format(date);
        venueTime = jsonResponse[0]['time'];
        venueURL = jsonResponse[0]['venue'];
      });

    } else {
      setState(() {
        venueData = 'Failed to fetch data.';
      });
    }
  }
  @override
  void initState(){
    super.initState();
    fetchData();
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
          automaticallyImplyLeading: true,
          bottom: PreferredSize(
              preferredSize: const Size(100, 150),
              child: Container(
                width: 400,

                margin: const EdgeInsets.fromLTRB(11, 0, 0, 0),
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
                    data: '${venueURL}',
                    backgroundColor: Colors.white,
                    version: QrVersions.auto,
                    size: 300.0,
                  ),
                  Text('Report at ${venueName}  on ${venueDate} at ${venueTime}',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Raleway',
                        fontSize: 16,
                      ),
                  ),
                  GestureDetector(
                    child: Container(
                      margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
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
                          '${venueURL}');
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
