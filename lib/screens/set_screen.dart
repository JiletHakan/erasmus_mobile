import 'package:mobile_erasmus/screens/styles.dart';
import 'package:flutter/material.dart';
import 'set_button_screen.dart';
import 'set_leds_screen.dart';

class SetScreen extends StatelessWidget {
  const SetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('SET'),
        ),
        automaticallyImplyLeading: false,
      ),
      body: Transform.scale(
        scale: 1.3,
        child: Center(
          child: ListView(
            padding: const EdgeInsets.all(16.0),
            children: [
              _buildSetItem('BUTTON', () {
                // 'BUTTON' butonu tıklandığında SetButtonScreen'e yönlendir
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SetButtonScreen()),
                );
              }),
              _buildSetItem('SWITCH LEDs', () {
                // 'SWITCH LEDs' butonu tıklandığında SetLedsScreen'e yönlendir
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SetLedsScreen()),
                );
              }),
              const SizedBox(height: 50.0),
              Align(
                alignment: Alignment.bottomCenter,
                //back button
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

  Widget _buildSetItem(String label, VoidCallback onPressed) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 100.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
            const SizedBox(height: 10.0),
            TextButton(
              onPressed: onPressed,
              child: Text(
                label,
                style: const TextStyle(fontSize: 16.0),
              ),
            ),
            const SizedBox(height: 10.0),
          ],
        ),
      ),
    );
  }
}
