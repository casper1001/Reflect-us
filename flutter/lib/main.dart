import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reflectus2/core/storage/storage_handler.dart';
import 'package:reflectus2/screens/chooseoption_screen.dart';
import 'package:reflectus2/screens/community_screen.dart';
import 'package:reflectus2/screens/homestste_screen.dart';
import 'package:reflectus2/screens/login_screen.dart';
import 'package:reflectus2/screens/profile_screen.dart';
import 'package:reflectus2/screens/siginup_screen.dart';
import 'package:reflectus2/screens/welcome_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'core/middlewares/home_middleware.dart';

void main() async{
  await StorageHandler.init();
  // await StorageHandler().removeToken();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
        builder: (_,__,___) =>
            GetMaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                useMaterial3: true,
              ),
              getPages: [
                GetPage(
                    name: '/', page: ()=> const WelcomeScreen(),
                    middlewares: [
                      HomeMiddleware()
                    ]
                ),
                GetPage(
                    name: '/SignIn', page: ()=> SignInscreen(),
                ),
                GetPage(
                    name: '/SignUp', page: ()=> SignUpScreen(),
                ),
                GetPage(
                    name: '/Home', page: ()=> const HomeStateScreen(),
                ),
                GetPage(
                    name: '/Profile', page: ()=> const ProfileScreen(),
                ),
                GetPage(
                    name: '/ChooseOptions', page: ()=> const ChooseOptionsScreen(),
                ),
                GetPage(
                    name: '/CommunityScreen', page: ()=> CommunityScreen(),
                ),
              ],
            )
    );
  }
}
