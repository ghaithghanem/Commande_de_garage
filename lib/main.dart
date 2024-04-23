import 'package:commande_de_garage/splashcreen.dart';
import 'package:commande_de_garage/view/login_screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: SplashScreen(),
      initialBinding: BindingsBuilder(() {
        // Instantiate and register ResetPasswordController
        //Get.put(ResetPasswordController());
        // Register UserService as a singleton
        //Get.put<UserService>(UserService());
        //Get.put(UserController());
        //Get.put(EntryPoint());
      }),
      getPages: [
        GetPage(name: '/login', page: () => LoginScreen()),

        // ... other pages
      ],
    );
  }
}

