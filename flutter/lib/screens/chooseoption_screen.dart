import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../themes/theme.dart';
import '../widget/Custom_scaffold.dart';
import 'homestste_screen.dart';



class ChooseOptionsScreen extends StatefulWidget {
  const ChooseOptionsScreen({super.key});

  @override
  State<ChooseOptionsScreen> createState() => _ChooseOptionsScreen();
}

class _ChooseOptionsScreen extends State<ChooseOptionsScreen> {
  final _formSignupKey = GlobalKey<FormState>();
  Set<String> selectedIndexes = {};
  List<String> options = [
    'Sign language is beautiful',
    'Learn a second language',
    'Connect with different people',
    'Enhances brain development',
    'Enhances hearing abilities',
    'Improves your communication skills',
  ];

  @override
  Widget build(BuildContext context) {
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
                  key: _formSignupKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Why do you want to learn sign language?',
                        style: TextStyle(
                          fontSize: 28.0,
                          fontFamily: 'Agbalumo',
                          fontWeight: FontWeight.w900,
                          color: lightColorScheme.primary,
                        ),
                      ),
                      SingleChildScrollView(
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const PageScrollPhysics(),
                          itemCount: options.length,
                          itemBuilder: (context, index) {
                            final option = options[index];
                            return CheckboxListTile(
                              title: Text(
                                option,
                                style: const TextStyle(
                                  fontFamily: 'YourCustomFont',
                                  fontSize: 18.0,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              value: selectedIndexes.contains(option),
                              onChanged: (bool? value) {
                                setState(() {
                                  if (value != null) {
                                    // Toggle the checkbox state
                                    if (selectedIndexes.contains(option)) {
                                      selectedIndexes.remove(option);
                                    } else {
                                      selectedIndexes.add(option);
                                    }
                                  }
                                });
                              },
                            );
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            if (selectedIndexes.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Choose at least one option.'),
                                ),
                              );
                            } else {
                              Get.offAllNamed('/Home');
                            }
                          },
                          child: const Text('Next'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}