import 'package:flutter/material.dart';
class EventCard extends StatefulWidget{
  const EventCard({super.key});
  @override
  State<EventCard> createState() => _EventCard();


}
class _EventCard extends State<EventCard>{


  @override
  Widget build(BuildContext context) {
    return Container(
      margin:const EdgeInsets.all(25),
      padding: const  EdgeInsets.all(25),
      decoration:  BoxDecoration(
        color: Colors.deepPurple,
        borderRadius: BorderRadius.circular(8),
      ),

    );
  }}