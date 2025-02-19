import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reflectus2/advance_quize/advance_quiz_lists.dart';
import 'package:reflectus2/advance_quize/advance_quize_screen.dart';

import 'package:timeline_tile/timeline_tile.dart';

import '../core/core_components/nav_bar.dart';
import '../quiz/quiz_lists.dart';
import '../quiz/quiz_screen.dart';
import '../widget/Custom_scaffold.dart';
import 'arabic_course_screen.dart';

class HomeStateScreen extends StatelessWidget {
  const HomeStateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      bottomNavigationBar: const NavBar(inx:0,),
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
              child: ListView(
                children: [
                  Container(
                    height: 80,
                    width: 30,
                    color: Colors.indigoAccent.shade100,
                    alignment: Alignment.center,
                    child: const Text(
                      '   Your Credit Score\n'
                      '                  0',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Row(children: [
                    Text(
                      '  Course 1',
                      style: TextStyle(
                        fontSize: 30.0,
                        fontFamily: 'Agbalumo',
                        fontWeight: FontWeight.w900,
                        color: Colors.indigoAccent.shade200,
                      ),
                    ),
                    Expanded(child: Container()),
                    Text(
                      'Arabic Course',
                      style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.w900,
                        color: Colors.deepPurple.shade200,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ArabicCoursePage()),
                        );
                      },
                      icon: Icon(
                        Icons.arrow_forward,
                        size: 20,
                        color: Colors.deepPurple.shade200,
                      ),
                    )
                  ]),
                  const SizedBox(
                    height: 20,
                  ),
                  TimelineTile(
                    isFirst: true,
                    alignment: TimelineAlign.manual,
                    lineXY: 0.01,
                    beforeLineStyle: LineStyle(
                      color: Colors.deepPurple.shade100,
                    ),
                    indicatorStyle: IndicatorStyle(
                      width: 40,
                      color: Colors.deepPurple.shade100,
                    ),
                    endChild: Card(
                      margin: const EdgeInsets.all(10),
                      elevation: 5, // Adjust the elevation as needed
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Alphabet Session',
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'Agbalumo',
                                color: Colors.indigoAccent.shade100,
                              ),
                            ),
                            const SizedBox(height: 10),
                            // Add more widgets as needed
                          ],
                        ),
                      ),
                    ),
                  ),
                  TimelineTile(
                    alignment: TimelineAlign.manual,
                    lineXY: 0.01,
                    beforeLineStyle: LineStyle(
                      color: Colors.deepPurple.shade100,
                    ),
                    indicatorStyle: IndicatorStyle(
                      width: 40,
                      color: Colors.deepPurple.shade100,
                    ),
                    endChild: Card(
                      margin: const EdgeInsets.all(10),
                      elevation: 5, // Adjust the elevation as needed
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Numbers Session ',
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'Agbalumo',
                                color: Colors.indigoAccent.shade100,
                              ),
                            ),
                            const SizedBox(height: 10),
                            // Add more widgets as needed
                          ],
                        ),
                      ),
                    ),
                  ),
                  TimelineTile(
                    isLast: true,
                    alignment: TimelineAlign.manual,
                    lineXY: 0.01,
                    beforeLineStyle: LineStyle(
                      color: Colors.deepPurple.shade100,
                    ),
                    indicatorStyle: IndicatorStyle(
                      width: 40,
                      color: Colors.deepPurple.shade100,
                    ),
                    endChild: GestureDetector(
                      onTap: ()=> QuizScreen.push(quiz1, "Quiz 1"),
                      child: Card(
                        margin: const EdgeInsets.all(10),
                        elevation: 5, // Adjust the elevation as needed
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Quiz 1',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: 'Agbalumo',
                                  color: Colors.indigoAccent.shade100,
                                ),
                              ),
                              const SizedBox(height: 10),
                              // Add more widgets as needed
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    child: Text(
                      '  Course 2',
                      style: TextStyle(
                        fontSize: 30.0,
                        fontFamily: 'Agbalumo',
                        fontWeight: FontWeight.w900,
                        color: Colors.indigoAccent.shade200,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TimelineTile(
                    isFirst: true,
                    alignment: TimelineAlign.manual,
                    lineXY: 0.01,
                    beforeLineStyle: LineStyle(
                      color: Colors.deepPurple.shade100,
                    ),
                    indicatorStyle: IndicatorStyle(
                      width: 40,
                      color: Colors.deepPurple.shade100,
                    ),
                    endChild: Card(
                      margin: const EdgeInsets.all(10),
                      elevation: 5, // Adjust the elevation as needed
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Food Session',
                              style: TextStyle(
                                fontFamily: 'Agbalumo',
                                fontSize: 20,
                                color: Colors.indigoAccent.shade100,
                              ),
                            ),
                            const SizedBox(height: 10),
                            // Add more widgets as needed
                          ],
                        ),
                      ),
                    ),
                  ),
                  TimelineTile(
                    alignment: TimelineAlign.manual,
                    lineXY: 0.01,
                    beforeLineStyle: LineStyle(
                      color: Colors.deepPurple.shade100,
                    ),
                    indicatorStyle: IndicatorStyle(
                      width: 40,
                      color: Colors.deepPurple.shade100,
                    ),
                    endChild: Card(
                      margin: const EdgeInsets.all(10),
                      elevation: 5, // Adjust the elevation as needed
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Animal Session ',
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'Agbalumo',
                                color: Colors.indigoAccent.shade100,
                              ),
                            ),
                            const SizedBox(height: 10),
                            // Add more widgets as needed
                          ],
                        ),
                      ),
                    ),
                  ),
                  TimelineTile(
                    isLast: true,
                    alignment: TimelineAlign.manual,
                    lineXY: 0.01,
                    beforeLineStyle: LineStyle(
                      color: Colors.deepPurple.shade100,
                    ),
                    indicatorStyle: IndicatorStyle(
                      width: 40,
                      color: Colors.deepPurple.shade100,
                    ),
                    endChild: GestureDetector(
                      onTap: ()=> QuizScreen.push(quiz2, "Quiz 2"),
                      child: Card(
                        margin: const EdgeInsets.all(10),
                        elevation: 5, // Adjust the elevation as needed
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Quiz 2',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: 'Agbalumo',
                                  color: Colors.indigoAccent.shade100,
                                ),
                              ),
                              const SizedBox(height: 10),
                              // Add more widgets as needed
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    child: Text(
                      '  Course 3',
                      style: TextStyle(
                        fontSize: 30.0,
                        fontFamily: 'Agbalumo',
                        fontWeight: FontWeight.w900,
                        color: Colors.indigoAccent.shade200,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TimelineTile(
                    isFirst: true,
                    alignment: TimelineAlign.manual,
                    lineXY: 0.01,
                    beforeLineStyle: LineStyle(
                      color: Colors.deepPurple.shade100,
                    ),
                    indicatorStyle: IndicatorStyle(
                      width: 40,
                      color: Colors.deepPurple.shade100,
                    ),
                    endChild: Card(
                      margin: const EdgeInsets.all(10),
                      elevation: 5, // Adjust the elevation as needed
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Pronouns Session',
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'Agbalumo',
                                color: Colors.indigoAccent.shade100,
                              ),
                            ),
                            const SizedBox(height: 10),
                            // Add more widgets as needed
                          ],
                        ),
                      ),
                    ),
                  ),
                  TimelineTile(
                    alignment: TimelineAlign.manual,
                    lineXY: 0.01,
                    beforeLineStyle: LineStyle(
                      color: Colors.deepPurple.shade100,
                    ),
                    indicatorStyle: IndicatorStyle(
                      width: 40,
                      color: Colors.deepPurple.shade100,
                    ),
                    endChild: Card(
                      margin: const EdgeInsets.all(10),
                      elevation: 5, // Adjust the elevation as needed
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'WH Question Session',
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'Agbalumo',
                                color: Colors.indigoAccent.shade100,
                              ),
                            ),
                            const SizedBox(height: 10),
                            // Add more widgets as needed
                          ],
                        ),
                      ),
                    ),
                  ),
                  TimelineTile(
                    isLast: true,
                    alignment: TimelineAlign.manual,
                    lineXY: 0.01,
                    beforeLineStyle: LineStyle(
                      color: Colors.deepPurple.shade100,
                    ),
                    indicatorStyle: IndicatorStyle(
                      width: 40,
                      color: Colors.deepPurple.shade100,
                    ),
                    endChild: GestureDetector(
                      onTap: () =>AdvanceQuizScreen.push(quiz3, "Quiz 3"),
                      child: Card(
                        margin: const EdgeInsets.all(10),
                        elevation: 5, // Adjust the elevation as needed
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Advanced Quiz ',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: 'Agbalumo',
                                  color: Colors.indigoAccent.shade100,
                                ),
                              ),
                              const SizedBox(height: 10),
                              // Add more widgets as needed
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    child: Text(
                      '  Course 4',
                      style: TextStyle(
                        fontSize: 30.0,
                        fontFamily: 'Agbalumo',
                        fontWeight: FontWeight.w900,
                        color: Colors.indigoAccent.shade200,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TimelineTile(
                    isFirst: true,
                    alignment: TimelineAlign.manual,
                    lineXY: 0.01,
                    beforeLineStyle: LineStyle(
                      color: Colors.deepPurple.shade100,
                    ),
                    indicatorStyle: IndicatorStyle(
                      width: 40,
                      color: Colors.deepPurple.shade100,
                    ),
                    endChild: Card(
                      margin: const EdgeInsets.all(10),
                      elevation: 5, // Adjust the elevation as needed
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Greeting Session',
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'Agbalumo',
                                color: Colors.indigoAccent.shade100,
                              ),
                            ),

                            const SizedBox(height: 10),
                            // Add more widgets as needed
                          ],
                        ),
                      ),
                    ),
                  ),
                  TimelineTile(
                    alignment: TimelineAlign.manual,
                    lineXY: 0.01,
                    beforeLineStyle: LineStyle(
                      color: Colors.deepPurple.shade100,
                    ),
                    indicatorStyle: IndicatorStyle(
                      width: 40,
                      color: Colors.deepPurple.shade100,
                    ),
                    endChild: Card(
                      margin: const EdgeInsets.all(10),
                      elevation: 5, // Adjust the elevation as needed
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'More Words',
                              style: TextStyle(
                                fontFamily: 'Agbalumo',
                                fontSize: 20,
                                color: Colors.indigoAccent.shade100,
                              ),
                            ),
                            const SizedBox(height: 10),
                            // Add more widgets as needed
                          ],
                        ),
                      ),
                    ),
                  ),
                  TimelineTile(
                    isLast: true,
                    alignment: TimelineAlign.manual,
                    lineXY: 0.01,
                    beforeLineStyle: LineStyle(
                      color: Colors.deepPurple.shade100,
                    ),
                    indicatorStyle: IndicatorStyle(
                      width: 40,
                      color: Colors.deepPurple.shade100,
                    ),
                    endChild: GestureDetector(
                      onTap: ()=> QuizScreen.push(quiz4, "Quiz 4"),
                      child: Card(
                        margin: const EdgeInsets.all(10),
                        elevation: 5, // Adjust the elevation as needed
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Quiz 4',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: 'Agbalumo',
                                  color: Colors.indigoAccent.shade100,
                                ),
                              ),
                              const SizedBox(height: 10),
                              // Add more widgets as needed
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    child: Text(
                      '  Course 5',
                      style: TextStyle(
                        fontSize: 30.0,
                        fontFamily: 'Agbalumo',
                        fontWeight: FontWeight.w900,
                        color: Colors.indigoAccent.shade200,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TimelineTile(
                    isFirst: true,
                    alignment: TimelineAlign.manual,
                    lineXY: 0.01,
                    beforeLineStyle: LineStyle(
                      color: Colors.deepPurple.shade100,
                    ),
                    indicatorStyle: IndicatorStyle(
                      width: 40,
                      color: Colors.deepPurple.shade100,
                    ),
                    endChild: Card(
                      margin: const EdgeInsets.all(10),
                      elevation: 5, // Adjust the elevation as needed
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Week Session',
                              style: TextStyle(
                                fontFamily: 'Agbalumo',
                                fontSize: 20,
                                color: Colors.indigoAccent.shade100,
                              ),
                            ),
                            const SizedBox(height: 10),
                            // Add more widgets as needed
                          ],
                        ),
                      ),
                    ),
                  ),
                  TimelineTile(
                    alignment: TimelineAlign.manual,
                    lineXY: 0.01,
                    beforeLineStyle: LineStyle(
                      color: Colors.deepPurple.shade100,
                    ),
                    indicatorStyle: IndicatorStyle(
                      width: 40,
                      color: Colors.deepPurple.shade100,
                    ),
                    endChild: Card(
                      margin: const EdgeInsets.all(10),
                      elevation: 5, // Adjust the elevation as needed
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Month Session',
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'Agbalumo',
                                color: Colors.indigoAccent.shade100,
                              ),
                            ),
                            const SizedBox(height: 10),
                            // Add more widgets as needed
                          ],
                        ),
                      ),
                    ),
                  ),
                  TimelineTile(
                    isLast: true,
                    alignment: TimelineAlign.manual,
                    lineXY: 0.01,
                    beforeLineStyle: LineStyle(
                      color: Colors.deepPurple.shade100,
                    ),
                    indicatorStyle: IndicatorStyle(
                      width: 40,
                      color: Colors.deepPurple.shade100,
                    ),
                    endChild: GestureDetector(
                      onTap: ()=> QuizScreen.push(quiz5, "Quiz 5"),
                      child: Card(
                        margin: const EdgeInsets.all(10),
                        elevation: 5, // Adjust the elevation as needed
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Quiz 5',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: 'Agbalumo',
                                  color: Colors.indigoAccent.shade100,
                                ),
                              ),
                              const SizedBox(height: 10),
                              // Add more widgets as needed
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    child: Text(
                      '  Course 6',
                      style: TextStyle(
                        fontSize: 30.0,
                        fontFamily: 'Agbalumo',
                        fontWeight: FontWeight.w900,
                        color: Colors.indigoAccent.shade200,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TimelineTile(
                    isFirst: true,
                    alignment: TimelineAlign.manual,
                    lineXY: 0.01,
                    beforeLineStyle: LineStyle(
                      color: Colors.deepPurple.shade100,
                    ),
                    indicatorStyle: IndicatorStyle(
                      width: 40,
                      color: Colors.deepPurple.shade100,
                    ),
                    endChild: Card(
                      margin: const EdgeInsets.all(10),
                      elevation: 5, // Adjust the elevation as needed
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'More Words',
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'Agbalumo',
                                color: Colors.indigoAccent.shade100,
                              ),
                            ),
                            const SizedBox(height: 10),
                            // Add more widgets as needed
                          ],
                        ),
                      ),
                    ),
                  ),
                  TimelineTile(
                    alignment: TimelineAlign.manual,
                    lineXY: 0.01,
                    beforeLineStyle: LineStyle(
                      color: Colors.deepPurple.shade100,
                    ),
                    indicatorStyle: IndicatorStyle(
                      width: 40,
                      color: Colors.deepPurple.shade100,
                    ),
                    endChild: Card(
                      margin: const EdgeInsets.all(10),
                      elevation: 5, // Adjust the elevation as needed
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Sentence Session',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: 'Agbalumo',
                                  color: Colors.indigoAccent.shade100,
                                )),
                            const SizedBox(height: 10),
                            // Add more widgets as needed
                          ],
                        ),
                      ),
                    ),
                  ),
                  TimelineTile(
                    isLast: true,
                    alignment: TimelineAlign.manual,
                    lineXY: 0.01,
                    beforeLineStyle: LineStyle(
                      color: Colors.deepPurple.shade100,
                    ),
                    indicatorStyle: IndicatorStyle(
                      width: 40,
                      color: Colors.deepPurple.shade100,
                    ),
                    endChild: GestureDetector(
                      onTap: () =>AdvanceQuizScreen.push(quiz6, "Quiz 6"),
                      child: Card(
                        margin: const EdgeInsets.all(10),
                        elevation: 5, // Adjust the elevation as needed
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Advanced Quiz ',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontFamily: 'Agbalumo',
                                    color: Colors.indigoAccent.shade100,
                                  )),
                              const SizedBox(height: 10),
                              // Add more widgets as needed
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
