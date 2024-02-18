import 'package:mobile_erasmus/screens/styles.dart';
import 'package:flutter/material.dart';

class SetLedsScreen extends StatefulWidget {
  const SetLedsScreen({super.key});

  @override
  _SetLedsScreenState createState() => _SetLedsScreenState();
}

class _SetLedsScreenState extends State<SetLedsScreen> {
  List<String> ledList = ['LED 1', 'LED 2', 'LED 3'];
  String selectedLed = 'LED 1';
  bool areLedsOn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('SET LEDS SCREEN'),
        ),
        automaticallyImplyLeading: false,
      ),
      body: Transform.scale(
        scale: 1.5,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 16, 0, 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildDropdownMenu(),
              const SizedBox(height: 20.0),
              _buildOnOffButtons(),
              const SizedBox(height: 20.0),
              Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ButtonStyles.pressedButtonStyle(),
                  child: const Text('Back'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDropdownMenu() {
    return DropdownButton<String>(
      value: selectedLed,
      onChanged: (newValue) {
        setState(() {
          selectedLed = newValue!;
        });
      },
      items: ledList.map((led) {
        return DropdownMenuItem<String>(
          value: led,
          child: Text(led),
        );
      }).toList(),
    );
  }

  Widget _buildOnOffButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () {
            setState(() {
              areLedsOn = true;
            });
          },
          style: ButtonStyles.pressedButtonStyle(),
          child: const Text('On'),
        ),
        const SizedBox(width: 20.0),
        ElevatedButton(
          onPressed: () {
            setState(() {
              areLedsOn = false;
            });
          },
          style: ButtonStyles.pressedButtonStyle(),
          child: const Text('Off'),
        ),
        const SizedBox(width: 20.0),
        //Text('LEDs are ${areLedsOn ? 'On' : 'Off'}'),
      ],
    );
  }
}
