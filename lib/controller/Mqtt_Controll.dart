import 'package:flutter/material.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';
import 'package:typed_data/typed_data.dart' as typed;

class ServoControlApp extends StatefulWidget {
  @override
  _ServoControlAppState createState() => _ServoControlAppState();
}

class _ServoControlAppState extends State<ServoControlApp> {
  late MqttServerClient client;
  bool servoOn = false;

  @override
  void initState() {
    super.initState();
    // Initialize MQTT client with WebSocket
    client = MqttServerClient('bfeb9b2049c04beb8186d746dac0f019.s1.eu.hivemq.cloud', 'flutter_client');
    client.port = 8884; // Use WebSocket port 8884
    client.useWebSocket = true; // Enable WebSocket
    client.logging(on: true);
    client.keepAlivePeriod = 20;
    client.onDisconnected = _onDisconnected;
    client.connectionMessage = MqttConnectMessage()
        .authenticateAs('username', 'password')
        .keepAliveFor(20)
        .withWillTopic('willtopic')
        .withWillMessage('Servo Control App disconnected')
        .startClean();
    client.connect();
  }

  void _onDisconnected() {
    // Handle disconnection
  }

  void _toggleServo() {
    String message = servoOn ? 'off' : 'on';
    // Using MqttClientPayloadBuilder to create the payload
    MqttClientPayloadBuilder builder = MqttClientPayloadBuilder();
    builder.addString(message);

    // Assert that builder.payload is not null using the null-aware operator (!)
    typed.Uint8Buffer payload = builder.payload!;

    client.publishMessage('servo/control', MqttQos.exactlyOnce, payload);
    setState(() {
      servoOn = !servoOn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Servo Control'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: _toggleServo,
                child: Text(servoOn ? 'Turn Off Servo' : 'Turn On Servo'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(ServoControlApp());
}
