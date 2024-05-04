import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';
import 'package:typed_data/typed_data.dart' as typed;

class MqttService {
  static late MqttServerClient client;

  // Initialize MQTT client
  static void initialize() {
    //client = MqttServerClient('broker_address', 'client_id');
    client = MqttServerClient('bfeb9b2049c04beb8186d746dac0f019.s1.eu.hivemq.cloud', 'flutter_client');
    client.port = 8884; // Use WebSocket port 8884
    client.useWebSocket = true; // Enable WebSocket
    client.logging(on: true);
    client.keepAlivePeriod = 20;
   // client.onDisconnected = _onDisconnected;
    // Initialize other client configurations
    client.connectionMessage = MqttConnectMessage()
        .authenticateAs('username', 'password')
        .keepAliveFor(20)
        .withWillTopic('willtopic')
        .withWillMessage('Servo Control App disconnected')
        .startClean();
    // Connect to MQTT broker
    client.connect();
  }

  // Publish message to MQTT topic
  static void publishMessage(String topic, MqttQos qos, typed.Uint8Buffer payload) {
    client.publishMessage(topic, qos, payload);
  }
}
