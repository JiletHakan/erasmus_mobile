import 'package:mobile_erasmus/screens/device_screen.dart';
import 'package:mobile_erasmus/screens/styles.dart';
import 'package:flutter/material.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  // Seçilen değeri tutmak için bir değişken
  String selectedDevice = 'Location 1';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('LOCATIONS')),
      ),
      body: Transform.scale(
        scale: 1.5,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // DropdownButton widget
                DropdownButton<String>(
                  value: selectedDevice,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedDevice = newValue!;
                    });
                  },
                  items: <String>['Location 1']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 30),

                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DevicePage()),
                    );
                  },
                  style: ButtonStyles.pressedButtonStyle(),
                  child: const Text('Select'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
