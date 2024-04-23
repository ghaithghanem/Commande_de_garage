import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'car_entry_screen.dart';
import 'car_exit_screen.dart';


class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  int _selectedIndex = 0; // Initialize the selected index// Define PageController
  late PageController _pageController; // Declare the PageController
  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _selectedIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _navigateToScreen(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _pageController.animateToPage(
      index,
      duration: Duration(milliseconds: 300), // Adjust animation duration as needed
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _pageController, // Use PageController
              physics: NeverScrollableScrollPhysics(), // Disable scrolling
              onPageChanged: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              children: [
                CarEntryScreen(), // Home Screen
                CarExitScreen(), // Task Screen
       // Profile Screen
              ],
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showCustomAlert(context);
          //Get.toNamed('/add_user');
        },
        backgroundColor: Color(0xFF040C6C), // Set the background color to #B40741
        foregroundColor: Colors.white,
        elevation: 0,
        shape: CircleBorder(),
        child: Icon(
          Icons.add,
          size: 45, // Adjust size as needed
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        notchMargin: 5.0,
        shape: CircularNotchedRectangle(),
        color: Color(0xCB757CFF),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,
          children: [
            IconButton(
              icon: ColorFiltered(
                colorFilter: ColorFilter.mode(
                  _selectedIndex == 0 ? Colors.green : Colors.white,
                  BlendMode.srcIn,
                ),
                child: SizedBox(
                  width: 42,
                  height: 42,
                  child: Image.asset('assets/images/top.png'),
                ),
              ),
              onPressed: () => _navigateToScreen(0), // Navigate to Home Screen
            ),
            IconButton(
              icon: ColorFiltered(
                colorFilter: ColorFilter.mode(
                  _selectedIndex == 1 ? Colors.red : Colors.white,
                  BlendMode.srcIn,
                ),
                child: SizedBox(
                  width: 30,
                  height: 30,
                  child: Image.asset('assets/images/bas.png'),
                ),
              ),
              onPressed: () => _navigateToScreen(1), // Navigate to Task Screen
            ),

          ],
        ),
      ),
    );
  }
  void _showCustomAlert(BuildContext context) {
    bool switchValue = false; // Initial switch value

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return AlertDialog(
              title: Text(
                'Lampe',
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF757CFF), // Set the color here
                  // Add more text styles as needed
                ),
               // textAlign: TextAlign.center, // Center align the text
              ),
              backgroundColor: Colors.white,
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    'assets/images/torche.png', // Provide your image path here
                    width: 100,
                    height: 100,
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      Switch(
                        value: switchValue,
                        onChanged: (value) {
                          setState(() {
                            switchValue = value;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Close the alert dialog
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.red), // Set button background color
                    foregroundColor: MaterialStateProperty.all<Color>(Colors.white), // Set text color
                  ),
                  child: Text('Close'),
                ),


              ],
            );
          },
        );
      },
    );
  }

}