import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reflectus2/screens/siginup_screen.dart';

import '../widget/Custom_scaffold.dart';
import '../widget/welcome_bottom.dart';
import 'login_screen.dart';


class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  CustomScaffold(
      child: Column(
        children: [
          Flexible(
              flex: 6,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 0,
                  horizontal: 40.0,
                ),
                child: Center( child: RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                    children: [
                      TextSpan(
                          text: 'Reflect Us\n',
                          style: TextStyle(
                            fontSize: 50.0,

                            fontFamily: 'Agbalumo',
                            fontWeight: FontWeight.bold,
                            letterSpacing: 4,

                          )),

                    ],
                  ),
                ),
                ),
              )),
          Flexible(
            flex:1 ,
            child: Align(
                alignment: Alignment.bottomRight,
                child: Row(
                  children: [
                    Expanded(child: WelcomeButton(
                      buttonText: 'Sign In',
                      onTap: (){
                        Get.offNamed('SignIn');
                      },
                      color: Colors.transparent,
                      textColor: Colors.white,
                    ),
                    ),
                    Expanded(child: WelcomeButton(
                      buttonText: 'Sign Up',
                      onTap: (){
                        Get.offNamed('SignUp');
                      },
                      color: Colors.white,
                      textColor: Color.fromARGB(200, 20, 20, 150),

                    ),),
                  ],
                )),
          )
        ],
      ),
    );

  }
}