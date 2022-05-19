import 'package:crud_app_flutter/app/core/values/colors.dart';
import 'package:crud_app_flutter/app/data/services/firebase_auth.dart';

import 'package:crud_app_flutter/app/global/widgets/bottom_sheet.dart';
import 'package:crud_app_flutter/app/modules/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetView<DataController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Students Details',
          style: TextStyle(color: Colors.black),
        ),
        automaticallyImplyLeading: false,
        elevation: 5,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              signOutUser();
            },
          ),
        ],
      ),
      body: controller.obx(
        (students) => students != null
            ? ListView.builder(
                itemCount: students.length,
                itemBuilder: (context, index) {
                  var student = students[index];
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(
                        color: context.theme.backgroundColor,
                        width: 1,
                      ),
                    ),
                    color: const Color.fromARGB(252, 252, 252, 255),
                    margin: const EdgeInsets.all(8),
                    child: ListTile(
                      leading: const Icon(
                        Icons.account_circle_rounded,
                        size: 45,
                      ),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            student.name,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Age:${student.age}',
                          ),
                          Text(
                            'RollNo:${student.rollno}',
                          ),
                        ],
                      ),
                      trailing: SizedBox(
                        width: 100,
                        child: Row(
                          children: [
                            IconButton(
                              icon:
                                  const Icon(Icons.edit, color: Colors.yellow),
                              onPressed: () {
                                final details = BottomUpSheet(
                                    id: student.id,
                                    name: student.name,
                                    age: student.age,
                                    rollno: student.rollno,
                                    context: context,
                                    dataController: controller);

                                details.studentsDetailsForm();
                              },
                            ),
                            IconButton(
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                              onPressed: () {
                                int? a = student.id;
                                var result = controller.deleteStudent(a!);
                                if (result == 0) {
                                  Get.rawSnackbar(
                                    message: 'Successfully deleted a Student',
                                    backgroundColor: red,
                                  );
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                })
            : const Center(child: Text("No students")),
        onLoading: const Center(child: CircularProgressIndicator()),
        onEmpty: const Text('No data found'),
        onError: (error) => Center(
          // optional
          child: Text(
            ' $error',
            style: const TextStyle(fontSize: 18, color: Colors.red),
            textAlign: TextAlign.center,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          final detailsForm =
              BottomUpSheet(context: context, dataController: controller);
          detailsForm.studentsDetailsForm();
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      backgroundColor: lightyellow,
    );
  }
}
