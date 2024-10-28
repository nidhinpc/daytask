import 'package:daytask/controller/home_screen_controller.dart';
import 'package:daytask/utils/color_constants.dart';
import 'package:daytask/view/create_task_sc/create_task_screen.dart';
import 'package:daytask/view/global_widgets/custom_logo.dart';
import 'package:daytask/view/global_widgets/custom_title.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isLoading = true;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) async {
        await HomeScreenController.getAllTasks();
        setState(() {
          _isLoading = false;
        });
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CustomLogo(width: 90, height: 50),
            CustomTitle(title: "Task list")
          ],
        ),
        centerTitle: true,
        backgroundColor: ColorConstants.MainBlack,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CreateTaskScreen(),
            ),
          );

          setState(() {
            _isLoading = true;
          });
          await HomeScreenController.getAllTasks();
          setState(() {
            _isLoading = false;
          });
        },
        child: const Icon(Icons.add),
      ),
      backgroundColor: ColorConstants.Backgroundcolor,
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.separated(
              itemBuilder: (context, index) {
                final task = HomeScreenController.taskList[index];
                return ListTile(
                  onTap: () {},
                  title: Text(
                    task["task"] ?? "No Task Title",
                    style: TextStyle(
                      color: ColorConstants.ButtonColor,
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Row(
                    children: [
                      Text(
                        task["details"] ?? "No Details",
                        style: TextStyle(
                          color: ColorConstants.Textfieldtext,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(width: 10),
                      // Text(
                      //   task["time"] ?? "No Time",
                      //   style: const TextStyle(color: Colors.white),
                      // ),
                      // Text(
                      //   task["date"] ?? "No Date",
                      //   style: const TextStyle(color: Colors.white),
                      // ),
                      Text(
                        task["date"] != null
                            ? DateFormat.jm().format(DateTime.parse(
                                task["date"])) // Format time as 12-hour format
                            : "No Time",
                        style: const TextStyle(color: Colors.white),
                      ),
                      Text(
                        task["time"] != null
                            ? DateFormat.yMMMd().format(DateTime.parse(
                                task["time"])) // Format date as MMM d, yyyy
                            : "No Date",
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () async {
                      await HomeScreenController.removeTask(task["id"]);
                      setState(() {});
                    },
                  ),
                );
              },
              separatorBuilder: (context, index) => const Divider(
                color: ColorConstants.MainBlack,
                thickness: 4,
              ),
              itemCount: HomeScreenController.taskList.length,
            ),
    );
  }
}
