import 'package:mobile_erasmus/screens/styles.dart';
import 'package:flutter/material.dart';
import 'action_screen.dart';

class DevicePage extends StatefulWidget {
  const DevicePage({super.key});

  @override
  _DevicePageState createState() => _DevicePageState();
}

class _DevicePageState extends State<DevicePage> {
  bool deviceChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('DEVICE'),
        ),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 100),
                child: Transform.scale(
                  scale: 1.5,
                  child: Checkbox(
                    value: deviceChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        deviceChecked = value ?? false;
                      });
                    },
                  ),
                ),
              ),
              const Text('DEVICE I', style: TextStyle(fontSize: 30)),
            ],
          ),
          const SizedBox(height: 20),
          Transform.scale(
            scale: 1.5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  style: ButtonStyles.pressedButtonStyle(),
                  child: const Text('Back'),
                ),
                const SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () {
                    if (deviceChecked) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ActionScreen()),
                      );
                    }
                  },
                  style: ButtonStyles.pressedButtonStyle(),
                  child: const Text('Next'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
