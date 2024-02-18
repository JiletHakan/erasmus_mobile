import 'package:mobile_erasmus/screens/styles.dart';
import 'package:flutter/material.dart';
import 'display_screen.dart';
import 'set_screen.dart';

class ActionScreen extends StatelessWidget {
  const ActionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('ACTION'),
        ),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Transform.scale(
          scale: 1.5,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //display button
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const DisplayScreen()),
                  );
                },
                style: ButtonStyles.pressedButtonStyle(),
                child: const Text('Display'),
              ),
              const SizedBox(height: 20),
              //set button
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SetScreen()),
                  );
                },
                style: ButtonStyles.pressedButtonStyle(),
                child: const Text('Set'),
              ),
              const SizedBox(height: 80),
              //back button
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                style: ButtonStyles.pressedButtonStyle(),
                child: const Text('Back'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
