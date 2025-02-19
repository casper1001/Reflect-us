import 'package:flutter/material.dart';

import '../themes/theme.dart';
import '../widget/Custom_scaffold.dart';
import 'chooseoption_screen.dart';


class AvatarScreen extends StatefulWidget{
  const AvatarScreen({super.key});
  @override
  State<AvatarScreen> createState() => _AvatarScreen();


}
class _AvatarScreen extends State<AvatarScreen>{
  final _formSignInKey = GlobalKey<FormState>();
  bool rememberPassword = true;

  @override
  Widget build(BuildContext context) {
    {
      return CustomScaffold(
        child: Column(
          children: [
            const Expanded(
              flex: 1,
              child: SizedBox(
                height: 10,
              ),
            ),
            Expanded(
              flex: 7,
              child: Container(
                padding: const EdgeInsets.fromLTRB(25.0, 50.0, 25.0, 20.0),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40.0),
                    topRight: Radius.circular(40.0),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Form(
                    key: _formSignInKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[

                              Text(
                                'Hello,there !\n'
                                    'what should we call you?',
                                style: TextStyle(
                                  fontSize: 22.0,
                                  fontFamily: 'Agbalumo',
                                  fontWeight: FontWeight.w900,
                                  color: lightColorScheme.primary,

                                ),
                              ),
                              const SizedBox(
                                height: 40.0,
                              ),
                              TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter username';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  icon: const Icon(
                                    Icons.person,
                                    color: Colors.blueAccent,),
                                  label: const Text('Username'),
                                  hintText: ' Enter username',
                                  hintStyle: const TextStyle(
                                    color: Colors.black26,
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Colors.black12, // Default border color
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Colors.black12, // Default border color
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 25.0,
                              ),

                              const SizedBox(
                                height: 25.0,
                              ),


                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => const ChooseOptionsScreen()),
                                    );

                                  },

                                  child: const Text('Next'),
                                ),
                              ),
                              const SizedBox(
                                height: 25.0,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Divider(
                                      thickness: 0.7,
                                      color: Colors.grey.withOpacity(0.5),
                                    ),
                                  ),

                                  Expanded(
                                    child: Divider(
                                      thickness: 0.7,
                                      color: Colors.grey.withOpacity(0.5),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 25.0,
                              ),

                              const SizedBox(
                                height: 25.0,
                              ),

                              const SizedBox(
                                height: 20.0,
                              ),
                            ],
                          ),
                        ),
                      ],),
                  ),
                ),
              ),),],
        ),
      );
    }
  }}