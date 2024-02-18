import 'package:mobile_erasmus/screens/styles.dart';
import 'package:flutter/material.dart';

class SetButtonScreen extends StatefulWidget {
  const SetButtonScreen({super.key});

  @override
  _SetButtonScreenState createState() => _SetButtonScreenState();
}

class _SetButtonScreenState extends State<SetButtonScreen> {
  List<String> buttonList = ['Button 1', 'Button 2', 'Button 3'];
  String selectedButton = 'Button 1';
  bool isButtonOn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('SET BUTTON SCREEN'),
        ),
        automaticallyImplyLeading: false,
      ),
      body: Transform.scale(
        scale: 1.5,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 0, 16),
          child: Column(
            mainAxisAlignment:
                MainAxisAlignment.center, // Tüm öğeleri dikeyde ortala
            children: [
              _buildDropdownMenu(),
              const SizedBox(height: 20.0),
              _buildOnOffButtons(),
              const SizedBox(height: 20.0),
              Align(
                alignment: Alignment.center, // Align ile yatayda ortala
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
      value: selectedButton,
      onChanged: (newValue) {
        setState(() {
          selectedButton = newValue!;
        });
      },
      items: buttonList.map((button) {
        return DropdownMenuItem<String>(
          value: button,
          child: Text(button),
        );
      }).toList(),
    );
  }

  Widget _buildOnOffButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center, // Yatayda ortala
      children: [
        ElevatedButton(
          onPressed: () {
            setState(() {
              isButtonOn = true;
            });
          },
          style: ButtonStyles.pressedButtonStyle(),
          child: const Text('On'),
        ),
        const SizedBox(width: 20.0),
        ElevatedButton(
          onPressed: () {
            setState(() {
              isButtonOn = false;
            });
          },
          style: ButtonStyles.pressedButtonStyle(),
          child: const Text('Off'),
        ),
        const SizedBox(width: 20.0),
        //Text('Button is ${isButtonOn ? 'On' : 'Off'}'),
      ],
    );
  }
}
