/*import 'package:firebase_database/firebase_database.dart';

class FirebaseService {
  final DatabaseReference _temperatureRef =
      FirebaseDatabase.instance.ref().child('temperature');
  final DatabaseReference _longitudeRef =
      FirebaseDatabase.instance.ref().child('longitude');
  final DatabaseReference _latitudeRef =
      FirebaseDatabase.instance.ref().child('latitude');
  final DatabaseReference _buttonsStateRef =
      FirebaseDatabase.instance.ref().child('buttonState');
  final DatabaseReference _ledsStateRef =
      FirebaseDatabase.instance.ref().child('isLedOn');
  final DatabaseReference _timestampRef =
      FirebaseDatabase.instance.ref().child('time');

  // Örnek bir asenkron metod
  Future<String> getTemperature() async {
    DataSnapshot snapshot = (await _temperatureRef.once()) as DataSnapshot;
    return snapshot.value.toString();
  }

  // Diğer verileri çekmek için benzer metodları ekleyebilirsiniz.

  // Veri yazma örneği
  Future<void> setTemperature(String temperature) async {
    await _temperatureRef.set(temperature);
  }
}
*/