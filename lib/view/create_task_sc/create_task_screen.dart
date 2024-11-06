import 'dart:ui';
import 'package:bottom_picker/bottom_picker.dart';
import 'package:bottom_picker/resources/arrays.dart';
import 'package:daytask/controller/home_screen_controller.dart';
import 'package:daytask/utils/color_constants.dart';
import 'package:daytask/view/global_widgets/custom_textfield.dart';
import 'package:daytask/view/global_widgets/custom_title.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CreateTaskScreen extends StatefulWidget {
  const CreateTaskScreen({super.key});

  @override
  State<CreateTaskScreen> createState() => _CreateTaskScreenState();
}

class _CreateTaskScreenState extends State<CreateTaskScreen> {
  TextEditingController taskController = TextEditingController();
  TextEditingController taskDetailsController = TextEditingController();
  DateTime dateTime = DateTime.now();
  DateTime dataTime = DateTime.now();
  // dynamic savingTime;
  int? id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Create Task",
          style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: ColorConstants.TextColor),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CustomTitle(
            title: "Task Title",
          ),
          CustomTextfield(
            controller: taskController,
            text: "What is your task?",
          ),
          CustomTitle(
            title: "Task Details",
          ),
          CustomTextfield(
            controller: taskDetailsController,
            text: "What to do?",
          ),
          CustomTitle(
            title: "Time & Date",
          ),
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  BottomPicker.date(
                    pickerTitle: Text(
                      'Set Task Date & Time',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.blue,
                      ),
                    ),
                    dateOrder: DatePickerDateOrder.dmy,
                    initialDateTime: dateTime,
                    maxDateTime: DateTime(2100),
                    minDateTime: DateTime(2020),
                    pickerTextStyle: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                    onChange: (date) {
                      setState(() {
                        dateTime = date;
                      });
                    },
                    onSubmit: (date) {
                      setState(() {
                        dateTime = date;
                      });
                    },
                    bottomPickerTheme: BottomPickerTheme.plumPlate,
                  ).show(context);
                },
                child: Text("Select Date"),
              ),
              SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  BottomPicker.time(
                    pickerTitle: Text(
                      'Set your next meeting time',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.orange,
                      ),
                    ),
                    onSubmit: (time) {
                      print(time);
                      dataTime = time;
                    },
                    onClose: (time) {
                      print('Picker closed');
                      dataTime = time;
                    },
                    bottomPickerTheme: BottomPickerTheme.orange,
                    use24hFormat: true,
                    initialTime: Time(
                      minutes: 23,
                    ),
                    maxTime: Time(
                      hours: 23,
                    ),
                  ).show(context);
                },
                child: Text("Select Time"),
              )
            ],
          ),
          SizedBox(
            width: 200,
            child: ElevatedButton(
              style: ButtonStyle(
                maximumSize: WidgetStatePropertyAll(Size.fromWidth(400)),
                backgroundColor:
                    MaterialStateProperty.all(ColorConstants.ButtonColor),
              ),
              onPressed: () async {
                if (id == null) {
                  await HomeScreenController.addTask(
                      task: taskController.text,
                      details: taskDetailsController.text,
                      time: dateTime.toString(),
                      date: dataTime.toString());
                  print(dateTime);
                  print(dataTime);

                  setState(() {});
                  Navigator.pop(context);
                }
                //    String taskName = taskController.text;
                // String details = taskDetailsController.text;
              },
              child: Text(
                "Save Task",
                style: TextStyle(color: ColorConstants.TextColor),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
