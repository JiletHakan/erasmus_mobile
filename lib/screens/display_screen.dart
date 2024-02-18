import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
//import 'package:fl_chart/fl_chart.dart';

class DisplayScreen extends StatefulWidget {
  const DisplayScreen({Key? key}) : super(key: key);

  @override
  _DisplayScreenState createState() => _DisplayScreenState();
}

class _DisplayScreenState extends State<DisplayScreen> {
  late final DatabaseReference _databaseReference;
  String latitude = '';
  String longitude = '';
  String time = '';
  String buttonState = '';
  bool isLedOn = false;
  String temperature = '';

  @override
  void initState() {
    super.initState();
    _databaseReference = FirebaseDatabase.instance.ref();
    _listenToFirebaseChanges();
  }

  void _listenToFirebaseChanges() {
    _databaseReference
        .child('locations')
        .child('latitude')
        .onValue
        .listen((event) {
      setState(() {
        latitude = (event.snapshot.value ?? '').toString();
      });
    });

    _databaseReference
        .child('locations')
        .child('longitude')
        .onValue
        .listen((event) {
      setState(() {
        longitude = (event.snapshot.value ?? '').toString();
      });
    });

    _databaseReference.child('timestamp').onValue.listen((event) {
      setState(() {
        time = event.snapshot.value.toString();
      });
    });

    _databaseReference.child('buttons_state').onValue.listen((event) {
      setState(() {
        buttonState = (event.snapshot.value ?? '').toString();
      });
    });

    _databaseReference.child('leds_state').onValue.listen((event) {
      setState(() {
        isLedOn = (event.snapshot.value ?? false) as bool;
      });
    });

    _databaseReference.child('temperature').onValue.listen((event) {
      final dynamic value = event.snapshot.value;
      if (value is double) {
        setState(() {
          temperature = value.toStringAsFixed(2);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('DISPLAY'),
        ),
        automaticallyImplyLeading: false,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildDigitalClockWidget(),
          _buildTemperatureWidget(),
          const SizedBox(height: 30.0),
          _buildLocationWidget(),
          const SizedBox(height: 30.0),
          _buildSegmentedButtonWidget(),
          const SizedBox(height: 30.0),
          _buildLedWidget(),
          const SizedBox(height: 40.0),
          Align(
            alignment: Alignment.bottomCenter,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Back'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTemperatureWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: 20.0,
        ),
        Container(
          width: 150.0,
          height: 150.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: (double.tryParse(temperature) ?? 0) > 30
                ? Colors.red
                : Colors.green,
          ),
          child: Center(
            child: Text(
              '$temperature°C',
              style: const TextStyle(
                fontSize: 20.0,
                color: Colors.white,
              ),
            ),
          ),
        ),
        const SizedBox(height: 20.0),
        Text(
          'Temperature: $temperature °C',
          style: const TextStyle(fontSize: 16.0),
        ),
      ],
    );
  }

  Widget _buildLocationWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildInfoCard('Latitude', latitude),
        _buildInfoCard('Longitude', longitude),
      ],
    );
  }

  Widget _buildDigitalClockWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        _buildInfoCard('Time', time),
      ],
    );
  }

  Widget _buildSegmentedButtonWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildInfoCard('Buttons State', buttonState),
        const SizedBox(height: 12.0),
        Container(
          width: 50.0,
          height: 50.0,
          decoration: BoxDecoration(
            color: isLedOn ? Colors.green : Colors.grey,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              isLedOn ? 'ON' : 'OFF',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16.0,
              ),
            ),
          ),
        ),
        const SizedBox(height: 20.0),
      ],
    );
  }

  Widget _buildLedWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildInfoCard('LEDs State', buttonState),
        const SizedBox(height: 12.0),
        Container(
          width: 50.0,
          height: 50.0,
          decoration: BoxDecoration(
            color: isLedOn ? Colors.green : Colors.grey,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              isLedOn ? 'ON' : 'OFF',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16.0,
              ),
            ),
          ),
        ),
        const SizedBox(height: 20.0),
      ],
    );
  }

  Widget _buildInfoCard(String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
        const SizedBox(height: 12.0),
        Text(
          value,
          style: const TextStyle(fontSize: 16.0),
        ),
        const SizedBox(height: 20.0),
      ],
    );
  }
}
