import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  String? name;
   HomePage({Key? key,required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
          mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Hello ',),
                Text('$name',
                style: const TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
                ),
                const Text(', wish you are doing well ^^',),
              ],
            )
          ],
        ),
      ),
    );
  }
}
