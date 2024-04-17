import 'package:flutter/material.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {

  TextEditingController textEditingController = TextEditingController();

  String _greet = '';

  void _changeGreet(){
    setState(() {
      _greet = 'Hello ${textEditingController.text}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(_greet, ),
                TextField(
                  controller: textEditingController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter the task ...'
                  ),
                ),
                ElevatedButton(onPressed: _changeGreet, child: const Text('Tap')
                )
              ],
            )
        ),
      ),
    );
  }
}
