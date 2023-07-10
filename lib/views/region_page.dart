import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:valstore/main.dart';
import 'package:valstore/services/riot_service.dart';

const List<String> list = <String>['eu', 'na', 'ap', 'kr'];

Map<String, String> names = {
  "eu": "Europe",
  "na": "North America",
  "ap": "Asia / Pacific",
  "kr": "Korea"
};

class RegionPage extends StatelessWidget {
  const RegionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF16141a),
      appBar: AppBar(
        backgroundColor: Color(0xFF16141a),
        elevation: 0,
        title: const Text("Select Region"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              "In order to work properly you need to select your region",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            const Center(
              child: DropdownButtonExample(),
            ),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
              onPressed: () async {
                final prefs = await SharedPreferences.getInstance();
                prefs.setString("region", RiotService.region);
                navigatorKey.currentState!.pushNamed("/login");
              },
              child: const Text("Continue"),
            ),
          ],
        ),
      ),
    );
  }
}

class DropdownButtonExample extends StatefulWidget {
  const DropdownButtonExample({super.key});

  @override
  State<DropdownButtonExample> createState() => _DropdownButtonExampleState();
}

class _DropdownButtonExampleState extends State<DropdownButtonExample> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      iconSize: 20,
      value: dropdownValue,
      icon: const Icon(FontAwesomeIcons.earthEurope),
      elevation: 16,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 18,
      ),
      underline: const SizedBox(),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
          RiotService.region = value;
        });
      },
      items: list.map<DropdownMenuItem<String>>(
        (String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Container(child: Text(names[value] ?? value)),
          );
        },
      ).toList(),
    );
  }
}
