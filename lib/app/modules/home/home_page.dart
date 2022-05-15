import 'package:crud_app_flutter/app/core/values/colors.dart';
import 'package:crud_app_flutter/app/data/services/firebase_auth.dart';
import 'package:crud_app_flutter/app/data/services/local_database.dart';
import 'package:crud_app_flutter/app/global/widgets/bottom_sheet.dart';
import 'package:crud_app_flutter/app/modules/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetView<DataController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DataController dataController = Get.put(DataController());
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
      body: Obx(
        () => ListView.builder(
            itemCount: dataController.mylist.length,
            itemBuilder: (context, index) {
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
                        dataController.mylist[index].name,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Age:${dataController.mylist[index].age}',
                      ),
                      Text(
                        'RollNo:${dataController.mylist[index].rollno}',
                      ),
                    ],
                  ),
                  trailing: SizedBox(
                    width: 100,
                    child: Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit, color: Colors.yellow),
                          onPressed: () {
                            final details = BottomUpSheet(
                                id: dataController.mylist[index].id,
                                name: dataController.mylist[index].name,
                                age: dataController.mylist[index].age,
                                rollno: dataController.mylist[index].rollno,
                                context: context);

                            details.studentsDetailsForm();
                          },
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                          onPressed: () {
                            int? a = dataController.mylist[index].id;
                            CrudDB().deleteStudent(a!);
                            Get.rawSnackbar(
                              message: 'Successfully deleted a Student',
                              backgroundColor: red,
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          final detailsForm =
              BottomUpSheet(context: context, dataIsAvailable: true);
          detailsForm.studentsDetailsForm();
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      backgroundColor: lightyellow,
    );
  }
}
