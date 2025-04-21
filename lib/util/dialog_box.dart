import 'package:flutter/material.dart';
import 'package:to_do_list/util/dialog_button.dart';
import 'package:to_do_list/util/error_dialog.dart';

class DialogBox extends StatelessWidget {
  final TextEditingController taskName;
  VoidCallback onSave;

  DialogBox({super.key, required this.taskName, required this.onSave});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        height: 125,
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: "enter the task name",
                contentPadding: EdgeInsets.symmetric(horizontal: 2.0),
              ),
              controller: taskName,
            ),

            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DialogButton(
                  text: "save",
                  onPressed: () {
                    if ((taskName.text ?? "").isEmpty ||
                        taskName.text.trim().isEmpty) {
                        ErrorDialog.showErrorDialog(context, "please enter a task");
                    }else if(taskName.text.length >= 30){
                        ErrorDialog.showErrorDialog(context, "the maximum amount of characters is 30");
                    }

                    else {
                      onSave();
                      taskName.clear();
                    }
                  },
                ),

                DialogButton(
                  text: "cancel",
                  onPressed: () {
                    Navigator.pop(context);
                    taskName.clear();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
