import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

import 'package:toast/toast.dart';

import '../widgets/applicant_list_widget.dart';
import '../widgets/approved_applicant_list_widget.dart';
import 'PlayerProfileScreen.dart';

class created_teams extends StatefulWidget {
  const created_teams({super.key});

  @override
  State<created_teams> createState() => _created_teamsState();
}

class _created_teamsState extends State<created_teams> {
  int applicantCount = 0; // Initialize the count to 0
  List<dynamic> team1 = []; // Store the data of team 1 here
  List<dynamic> team2 = []; // Store the data of team 2 here
  void showToastMessage() {
    Toast.show("This is a toast message",
        gravity: Toast.bottom,
        backgroundColor: Colors.black,
        duration: Toast.lengthShort);
  }


  Future<void> fetchFootballTeams() async {
    final response =
        await http.get(Uri.parse('http://192.168.0.106:3006/generate-teams'));
    // await http.get(Uri.parse('http://10.100.47.19:3006/generate-teams'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        team1 = data['team1'] ?? [];
        team2 = data['team2'] ?? [];
      });
    } else {
      // Handle API error
      print('Failed to fetch football teams');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchFootballTeams(); // Call the fetchData method when the widget is first created
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
            preferredSize: const Size(100, 100),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: const Text(
                    'Team Rosters',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 45,
                      fontFamily: 'Raleway',
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
              margin: const EdgeInsets.fromLTRB(20, 30, 20, 0),
              child: ListView(
                children: [
                  Container(
                    height: 250,
                    width: 100,
                    child: TeamList(
                      teamName: 'Team 1',
                      players: team1,
                    ),
                  ),
                  Container(
                    height: 250,
                    width: 100,
                    child: TeamList(
                      teamName: 'Team 2',
                      players: team2,
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

class TeamList extends StatelessWidget {
  final String teamName;
  final List<dynamic> players;

  TeamList({
    required this.teamName,
    required this.players,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      margin: EdgeInsets.all(8.0),
      child: Column(
        children: [
          ListTile(
            title: Text(
              teamName,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: players.length,
              itemBuilder: (context, index) {
                final player = players[index];
                if (player != null) {
                  return GestureDetector(
                    onTap: () {
                      // Navigate to the player's profile screen
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              PlayerProfileScreen(player: player),
                        ),
                      );
                    },
                    child: ListTile(
                      title: Text(player['name']),
                      subtitle: Text('Position: ${player['pp']}'),
                      // Add more player information here
                    ),
                  );
                }
                return const SizedBox(); // Return an empty widget if player is null
              },
            ),
          ),
        ],
      ),
    );
  }
}
