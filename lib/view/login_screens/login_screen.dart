import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/login_controller.dart';
import '../gate_screens/welcome_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isPasswordVisible = false;
  FocusNode _emailFocus = FocusNode();
  FocusNode _passwordFocus = FocusNode();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  // Static usernames and passwords
  static const List<String> usernames = ['user1', 'user2', 'user3', 'user4'];
  static const List<String> passwords = ['password1', 'password2', 'password3', 'password4'];

  Color customPrimaryColor = Color(0xFF758E);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    const double horizontalTextFieldPadding = 25.0;

    return GetBuilder<LoginController>(
      init: LoginController(),
      builder: (controller) => Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 40),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Image.asset('assets/images/entrepot.png', width: 190, height: 190),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, bottom: 0.0),
                  child: Center(
                    child: Text(
                      'Commande de garage .',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Helvetica Neue',
                        letterSpacing: -0.34,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 60),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: horizontalTextFieldPadding),
                  child: Container(
                    width: 320,
                    height: 55,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.grey[200],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: TextField(
                        controller: _emailController,
                        focusNode: _emailFocus,
                        decoration: InputDecoration(
                          hintText: '@username',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: horizontalTextFieldPadding),
                  child: Container(
                    width: 320,
                    height: 55,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.grey[200],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: TextField(
                        controller: _passwordController,
                        focusNode: _passwordFocus,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          suffixIcon: IconButton(
                            icon: Icon(
                              _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                            ),
                            onPressed: () {
                              setState(() {
                                _isPasswordVisible = !_isPasswordVisible;
                              });
                            },
                          ),
                          border: InputBorder.none,
                        ),
                        obscureText: !_isPasswordVisible,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 36.0),
                Container(
                  width: 320.0,
                  height: 60.0,
                  child: ElevatedButton(
                    onPressed: () {
                      // Check if entered username and password are correct
                      String enteredUsername = _emailController.text;
                      String enteredPassword = _passwordController.text;
                      bool isUsernameCorrect = false;
                      bool isPasswordCorrect = false;

                      // Check username
                      for (int i = 0; i < usernames.length; i++) {
                        if (enteredUsername == usernames[i]) {
                          isUsernameCorrect = true;
                          // Check password if username is correct
                          if (enteredPassword == passwords[i]) {
                            isPasswordCorrect = true;
                          }
                          break;
                        }
                      }

                      if (isUsernameCorrect && isPasswordCorrect) {
                        Get.to(WelcomeScreen());
                      } else {
                        // Show custom snackbar for incorrect username or password
                        String message;
                        if (!isUsernameCorrect) {
                          message = 'Username is incorrect';
                        } else {
                          message = 'Password is incorrect';
                        }
                        ScaffoldMessenger.of(context).showSnackBar(
                          CustomSnackBar(
                            content: Text(message),
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(35.0),
                      ),
                      primary: Color(0xFF757CFF),
                    ),
                    child: Stack(
                      alignment: Alignment.centerRight,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 30.0),
                          child: Text(
                            'Login',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 16.0),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, bottom: 0.0),
                  child: Center(
                    child: Text(
                      'Forgot Password?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'Helvetica Neue',
                        letterSpacing: -0.34,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
// Custom Snackbar Widget
class CustomSnackBar extends SnackBar {
  CustomSnackBar({
    Key? key,
    required Widget content,
    Color backgroundColor = Colors.red, // Default background color
    Color textColor = Colors.white, // Default text color
  }) : super(
    key: key,
    content: Row(
      children: [
        Icon(
          Icons.warning,
          color: textColor,
        ),
        SizedBox(width: 8), // Adjust spacing between icon and text
        Expanded(
          child: content,
        ),
      ],
    ),
    backgroundColor: backgroundColor,
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(20),
      ),
    ),
    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
  );
}
