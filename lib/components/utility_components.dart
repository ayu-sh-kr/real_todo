import 'package:flutter/material.dart';
import 'package:real_todo/components/buttons.dart';

AppBar getAppBar(String title) {
  return AppBar(
    backgroundColor: Colors.yellow[400],
    shadowColor: Colors.black,
    elevation: 4.0,
    titleTextStyle: const TextStyle(
        color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
    title: Center(child: Text(title)),
  );
}


class DialogBox extends StatelessWidget {
  final TextEditingController controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  DialogBox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel
  });


  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow[300],
      shape: const RoundedRectangleBorder(),
      content: SizedBox(
        height: 120,
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.yellow[100],
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.yellow),
                ),
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.yellow, width: 2.0),
                ),
                hintText: 'Enter the task',
              ),
            ),
            const SizedBox(height: 5,),
            // Save Button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ButtonComponent(text: 'Save', onPressed: onSave),
                // const SizedBox(width: 15,),
                ButtonComponent(text: 'Cancel', onPressed: onCancel),
              ],
            )
          ],
        ),
      ),
    );
  }
}
