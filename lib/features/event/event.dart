import 'package:flutter/material.dart';

class EventPage extends StatelessWidget {
  const EventPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Event Page",
        style: TextStyle(
          color: Color.fromARGB(255, 61, 24, 24),
          fontSize: 45,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}