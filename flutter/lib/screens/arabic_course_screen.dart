import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../widget/Custom_scaffold.dart';

class ArabicCoursePage extends StatefulWidget{
  const ArabicCoursePage({super.key});
  @override
  State<ArabicCoursePage> createState() => _ArabicCoursePage();


}
class _ArabicCoursePage extends State<ArabicCoursePage>{

  @override
  Widget build(BuildContext context)
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



              child: ListView(
                children: [

                  SizedBox(
                    height: 40,
                    child:  Text(
                      '  Course 1 ',
                      style: TextStyle(
                        fontSize: 30.0,
                        fontFamily: 'Agbalumo',
                        fontWeight: FontWeight.w900,
                        color: Colors.indigoAccent.shade200,
                      ),),


                  ),
                  const SizedBox(
                    height: 20,
                  ),



                  TimelineTile(isFirst: true,
                    alignment: TimelineAlign.manual,
                    lineXY: 0.01,
                    beforeLineStyle:  LineStyle(color: Colors.deepPurple.shade100,),
                    indicatorStyle:  IndicatorStyle(
                      width: 40,
                      color: Colors.deepPurple.shade100,


                    ),
                    endChild: Card(
                      margin: const EdgeInsets.all(10),
                      elevation: 5, // Adjust the elevation as needed
                      child: Container(

                        padding: const EdgeInsets.all(16),
                        child:  Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('جلسة الأحرف الأبجدية '
                              ,
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'Agbalumo',
                                color:Colors.indigoAccent.shade100,
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
                    beforeLineStyle:  LineStyle(color: Colors.deepPurple.shade100,),
                    indicatorStyle:  IndicatorStyle(
                      width: 40,
                      color: Colors.deepPurple.shade100,


                    ),
                    endChild: Card(
                      margin: const EdgeInsets.all(10),
                      elevation: 5, // Adjust the elevation as needed
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        child:  Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('جلسة الأرقام ',
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'Agbalumo',
                                color:Colors.indigoAccent.shade100,
                              ),),
                            const SizedBox(height: 10),
                            // Add more widgets as needed
                          ],
                        ),
                      ),
                    ),),

                  TimelineTile(
                    isLast: true,
                    alignment: TimelineAlign.manual,
                    lineXY: 0.01,
                    beforeLineStyle:  LineStyle(color: Colors.deepPurple.shade100,),
                    indicatorStyle:  IndicatorStyle(
                      width: 40,
                      color: Colors.deepPurple.shade100,


                    ),
                    endChild: Card(
                      margin: const EdgeInsets.all(10),
                      elevation: 5, // Adjust the elevation as needed
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        child:  Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('اختبار 1',
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'Agbalumo',
                                color:Colors.indigoAccent.shade100,),),
                            const SizedBox(height: 10),
                            // Add more widgets as needed
                          ],
                        ),
                      ),
                    ),

                  ),

                  SizedBox(

                    child: Text('  Course 2',
                      style: TextStyle(
                        fontSize: 30.0,
                        fontFamily: 'Agbalumo',
                        fontWeight: FontWeight.w900,
                        color: Colors.indigoAccent.shade200,
                      ),),

                  ),
                  const SizedBox(
                    height: 10,
                  ),



                  TimelineTile(
                    isFirst: true,
                    alignment: TimelineAlign.manual,
                    lineXY: 0.01,
                    beforeLineStyle:  LineStyle(color: Colors.deepPurple.shade100,),
                    indicatorStyle:  IndicatorStyle(
                      width: 40,
                      color: Colors.deepPurple.shade100,


                    ),
                    endChild: Card(
                      margin: const EdgeInsets.all(10),
                      elevation: 5, // Adjust the elevation as needed
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        child:   Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('جلسة الأطعمة',
                              style: TextStyle(
                                fontFamily: 'Agbalumo',
                                fontSize: 20,
                                color:Colors.indigoAccent.shade100,),),
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
                    beforeLineStyle:  LineStyle(color: Colors.deepPurple.shade100,),
                    indicatorStyle:  IndicatorStyle(
                      width: 40,
                      color: Colors.deepPurple.shade100,


                    ),
                    endChild: Card(
                      margin: const EdgeInsets.all(10),
                      elevation: 5, // Adjust the elevation as needed
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        child:  Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('جلسة الحيوانات ',
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'Agbalumo',
                                color:Colors.indigoAccent.shade100,),),
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
                    beforeLineStyle:  LineStyle(color: Colors.deepPurple.shade100,),
                    indicatorStyle:  IndicatorStyle(
                      width: 40,
                      color: Colors.deepPurple.shade100,


                    ),
                    endChild: Card(
                      margin: const EdgeInsets.all(10),
                      elevation: 5, // Adjust the elevation as needed
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        child:  Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('اختبار 2',
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'Agbalumo',
                                color:Colors.indigoAccent.shade100,),),
                            const SizedBox(height: 10),
                            // Add more widgets as needed
                          ],
                        ),
                      ),
                    ),
                  ),

                  SizedBox(

                    child: Text('  Course 3',
                      style: TextStyle(
                        fontSize: 30.0,
                        fontFamily: 'Agbalumo',
                        fontWeight: FontWeight.w900,
                        color: Colors.indigoAccent.shade200,
                      ),),

                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TimelineTile(
                    isFirst: true,
                    alignment: TimelineAlign.manual,
                    lineXY: 0.01,
                    beforeLineStyle:  LineStyle(color: Colors.deepPurple.shade100,),
                    indicatorStyle:  IndicatorStyle(
                      width: 40,
                      color: Colors.deepPurple.shade100,


                    ),
                    endChild: Card(
                      margin: const EdgeInsets.all(10),
                      elevation: 5, // Adjust the elevation as needed
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        child:  Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('جلسة الضمائر',
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'Agbalumo',
                                color:Colors.indigoAccent.shade100,),),
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
                    beforeLineStyle:  LineStyle(color: Colors.deepPurple.shade100,),
                    indicatorStyle:  IndicatorStyle(
                      width: 40,
                      color: Colors.deepPurple.shade100,


                    ),
                    endChild: Card(
                      margin: const EdgeInsets.all(10),
                      elevation: 5, // Adjust the elevation as needed
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        child:  Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('جلسة الأسئلة',
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'Agbalumo',
                                color:Colors.indigoAccent.shade100,),),
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
                    beforeLineStyle:  LineStyle(color: Colors.deepPurple.shade100,),
                    indicatorStyle:  IndicatorStyle(
                      width: 40,
                      color: Colors.deepPurple.shade100,


                    ),
                    endChild: Card(
                      margin: const EdgeInsets.all(10),
                      elevation: 5, // Adjust the elevation as needed
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        child:  Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('اختبار 3',
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'Agbalumo',
                                color:Colors.indigoAccent.shade100,),),
                            const SizedBox(height: 10),
                            // Add more widgets as needed
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(

                    child: Text('  Course 4',
                      style: TextStyle(
                        fontSize: 30.0,
                        fontFamily: 'Agbalumo',
                        fontWeight: FontWeight.w900,
                        color: Colors.indigoAccent.shade200,
                      ),),

                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TimelineTile(isFirst: true,
                    alignment: TimelineAlign.manual,
                    lineXY: 0.01,
                    beforeLineStyle:  LineStyle(color: Colors.deepPurple.shade100,),
                    indicatorStyle:  IndicatorStyle(
                      width: 40,
                      color: Colors.deepPurple.shade100,


                    ),
                    endChild: Card(
                      margin: const EdgeInsets.all(10),
                      elevation: 5, // Adjust the elevation as needed
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        child:  Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('جلسة التحية',
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'Agbalumo',
                                color:Colors.indigoAccent.shade100,),),

                            const SizedBox(height: 10),
                            // Add more widgets as needed
                          ],
                        ),
                      ),
                    ),),
                  TimelineTile(
                    alignment: TimelineAlign.manual,
                    lineXY: 0.01,
                    beforeLineStyle:  LineStyle(color: Colors.deepPurple.shade100,),
                    indicatorStyle:  IndicatorStyle(
                      width: 40,
                      color: Colors.deepPurple.shade100,


                    ),
                    endChild: Card(
                      margin: const EdgeInsets.all(10),
                      elevation: 5, // Adjust the elevation as needed
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        child:  Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('كلمات أخرى',
                              style: TextStyle(
                                fontFamily: 'Agbalumo',
                                fontSize: 20,
                                color:Colors.indigoAccent.shade100,),),
                            const  SizedBox(height: 10),
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
                    beforeLineStyle:  LineStyle(color: Colors.deepPurple.shade100,),
                    indicatorStyle:  IndicatorStyle(
                      width: 40,
                      color: Colors.deepPurple.shade100,


                    ),
                    endChild: Card(
                      margin: const EdgeInsets.all(10),
                      elevation: 5, // Adjust the elevation as needed
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        child:  Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('اختبار 4',
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'Agbalumo',
                                color:Colors.indigoAccent.shade100,),),
                            const SizedBox(height: 10),
                            // Add more widgets as needed
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(

                    child: Text('  Course 5',
                      style: TextStyle(
                        fontSize: 30.0,
                        fontFamily: 'Agbalumo',
                        fontWeight: FontWeight.w900,
                        color: Colors.indigoAccent.shade200,
                      ),),

                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TimelineTile(
                    isFirst: true,
                    alignment: TimelineAlign.manual,
                    lineXY: 0.01,
                    beforeLineStyle:  LineStyle(color: Colors.deepPurple.shade100,),
                    indicatorStyle:  IndicatorStyle(
                      width: 40,
                      color: Colors.deepPurple.shade100,


                    ),
                    endChild: Card(
                      margin: const EdgeInsets.all(10),
                      elevation: 5, // Adjust the elevation as needed
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        child:  Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('جلسة الأسبوع',
                              style: TextStyle(
                                fontFamily: 'Agbalumo',
                                fontSize: 20,
                                color:Colors.indigoAccent.shade100,),),
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
                    beforeLineStyle:  LineStyle(color: Colors.deepPurple.shade100,),
                    indicatorStyle:  IndicatorStyle(
                      width: 40,
                      color: Colors.deepPurple.shade100,


                    ),
                    endChild: Card(
                      margin: const EdgeInsets.all(10),
                      elevation: 5, // Adjust the elevation as needed
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        child:  Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('جلسة الأشهر',
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'Agbalumo',
                                color:Colors.indigoAccent.shade100,),),
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
                    beforeLineStyle:  LineStyle(color: Colors.deepPurple.shade100,),
                    indicatorStyle:  IndicatorStyle(
                      width: 40,
                      color: Colors.deepPurple.shade100,


                    ),

                    endChild: Card(
                      margin: const EdgeInsets.all(10),
                      elevation: 5, // Adjust the elevation as needed
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        child:  Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('اختبار 5',
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'Agbalumo',
                                color:Colors.indigoAccent.shade100,),),
                            const SizedBox(height: 10),
                            // Add more widgets as needed
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(

                    child: Text('  Course 6',
                      style: TextStyle(
                        fontSize: 30.0,
                        fontFamily: 'Agbalumo',
                        fontWeight: FontWeight.w900,
                        color: Colors.indigoAccent.shade200,
                      ),),

                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TimelineTile(
                    isFirst: true,
                    alignment: TimelineAlign.manual,
                    lineXY: 0.01,
                    beforeLineStyle:  LineStyle(color: Colors.deepPurple.shade100,),
                    indicatorStyle:  IndicatorStyle(
                      width: 40,
                      color: Colors.deepPurple.shade100,


                    ),
                    endChild: Card(
                      margin: const EdgeInsets.all(10),
                      elevation: 5, // Adjust the elevation as needed
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        child:  Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('كلمات أخرى',
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'Agbalumo',
                                color:Colors.indigoAccent.shade100,),),
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
                    beforeLineStyle:  LineStyle(color: Colors.deepPurple.shade100,),
                    indicatorStyle:  IndicatorStyle(
                      width: 40,
                      color: Colors.deepPurple.shade100,


                    ),
                    endChild: Card(
                      margin: const EdgeInsets.all(10),
                      elevation: 5, // Adjust the elevation as needed
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        child:  Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('جلسة الجمل ',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: 'Agbalumo',
                                  color:Colors.indigoAccent.shade100,)),
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
                    beforeLineStyle:  LineStyle(color: Colors.deepPurple.shade100,),
                    indicatorStyle:  IndicatorStyle(
                      width: 40,
                      color: Colors.deepPurple.shade100,


                    ),
                    endChild: Card(
                      margin: const EdgeInsets.all(10),
                      elevation: 5, // Adjust the elevation as needed
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        child:  Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('اختبار 6',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: 'Agbalumo',
                                  color:Colors.indigoAccent.shade100,)),
                            const SizedBox(height: 10),
                            // Add more widgets as needed
                          ],
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








