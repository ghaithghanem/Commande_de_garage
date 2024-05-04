import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mqtt_client/mqtt_client.dart';

import '../../controller/mqttservice.dart';
import 'package:typed_data/typed_data.dart' as typed;



class CarEntryScreen extends StatefulWidget {
  const CarEntryScreen({super.key});

  @override
  State<CarEntryScreen> createState() => _CarEntryScreenState();
}

class _CarEntryScreenState extends State<CarEntryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Color(0xCB757CFF), // Background color
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2), // Shadow color
            spreadRadius: 2, // Spread radius
            blurRadius: 5, // Blur radius
            offset: Offset(0, 3), // Offset of the shadow
          ),
             ],
              ),

              child: Padding(
                padding: const EdgeInsets.symmetric(vertical:10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top:15 ,left: 15),
                      child: Text(
                        'Bienvue :)',
                        style: TextStyle(
                          fontSize: 22,
                          fontFamily: 'Helvetica Neue',
                          letterSpacing: -0.34,
                          color: Colors.white,
                          fontWeight: FontWeight.bold, // Make the text bold
                        ),
                      ),

                    ),

                    Container(
                      padding: EdgeInsets.fromLTRB(10, 20, 20, 10), // Add padding for top
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/images/garage-intelligent.png',
                            width: 60,
                            height: 60,
                          ),
                          SizedBox(height: 8), // Add some space between the image and text
                          Text(
                            'The Gate',
                            style: TextStyle(
                              fontWeight: FontWeight.bold, // Make the text bold
                              fontSize: 16, // Adjust font size as needed
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 40),
            Row(
              children: [
                SizedBox(width: 15),
                Text(
                  'Nos fonctionnalités',
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF757CFF), // Set the color here
                    // Add more text styles as needed
                  ),
                ),

                SizedBox(width: 10), // Add some space between text and image
                Image.asset(
                  'assets/images/tel.png', // Replace 'your_image.png' with your actual image asset
                  width: 40,
                  height: 40,
                  // Add more image properties as needed
                ),
              ],
            ),




            SizedBox(height: 40),

            Center(
              child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), // Adjust border radius as needed
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2), // Shadow color
                      spreadRadius: 1, // Reduce spread radius
                      blurRadius: 3, // Reduce blur radius
                      offset: Offset(0, 2), // Offset of the shadow
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20), // Same border radius as the container
                  child: Image.asset(
                    'assets/images/6.jpg',
                    width: 180,
                    height: 180,
                  ),
                ),
              ),
            ),


            SizedBox(height: 20),

            Container(
              width: 200.0,
              height: 60.0,
              child: ElevatedButton(
                onPressed: () {
                  // Access MQTT client and publish message
                  MqttService.publishMessage(
                    'garage/door', // MQTT topic for opening the garage door
                    MqttQos.exactlyOnce, // Quality of Service
                    typed.Uint8Buffer()..addAll([1]), // Payload (1 for open command, you may adjust as needed)
                  );
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(35.0),
                  ),
                  primary: Color(0xFF019602),
                ),
                child: Stack(
                  alignment: Alignment.centerRight,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 0.0),
                      child: Text(
                        'Ouvrir',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20), // Adjust padding as needed
                child: Text(
                  'Pour ouvrir le garage, cliquez sur ce bouton',
                  style: TextStyle(
                    fontSize: 14, // Adjust font size as needed
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: Container(
                padding: EdgeInsets.all(10),
                child: Image.asset(
                  'assets/images/4.png',
                  width: 120,
                  height: 120,
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: 200.0,
              height: 60.0,
              child: ElevatedButton(
                onPressed: () {
                  // Add onPressed functionality
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(35.0),
                  ),
                  primary: Color(0xFF555888),
                ),
                child: Stack(
                  alignment: Alignment.centerRight,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 0.0),
                      child: Text(
                        'Verifier',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

            ),
            SizedBox(height: 20),
            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20), // Adjust padding as needed
                child: Text(
                  'Pour vérifier s il y a une voiture dans le garage, cliquez sur ce bouton',
                  style: TextStyle(
                    fontSize: 14, // Adjust font size as needed
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),

            SizedBox(height: 40),
            // Add your other widgets here
          ],
        ),
      ),
    );
  }
}
