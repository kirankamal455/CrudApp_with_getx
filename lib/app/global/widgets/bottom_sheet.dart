import 'package:crud_app_flutter/app/modules/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

int k = 0;
bool dataIsAvailable = false;

class BottomUpSheet {
  int? id;
  final String? name;
  final String? age;
  final String? rollno;
  final BuildContext context;
  final bool? dataIsAvailable;

  BottomUpSheet({
    this.name,
    this.id,
    this.dataIsAvailable,
    this.age,
    this.rollno,
    required this.context,
  });
  final DataController dataController = Get.put(DataController());
// This function will be working  when the floating button is pressed
// It will also be working when you want to update an student
  void studentsDetailsForm() async {
    // if dataIsAvailable != true -> create new student
    //  if  dataIsAvailable == true -> update an existing student
    if (dataIsAvailable != true) {
      dataController.nameController.text = name!;
      dataController.ageController.text = age!;
      dataController.rollnoController.text = rollno!;
    }
    Get.bottomSheet(
        Container(
          padding: EdgeInsets.only(
            top: 15,
            left: 15,
            right: 15,
            // this will prevent the soft keyboard from covering the text fields
            bottom: context.mediaQueryViewInsets.bottom + 50,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextFormField(
                controller: dataController.nameController,
                decoration: const InputDecoration(hintText: 'Student Name'),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: dataController.ageController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(hintText: 'Age'),
              ),
              TextFormField(
                controller: dataController.rollnoController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(hintText: 'Roll No'),
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () async {
                    // Save Student
                    if (id == null) {
                      await dataController.addStudentButtonClicked();
                      if (k == 0) {
                        Get.rawSnackbar(
                          message: 'Successfully Added a Student',
                          backgroundColor: Colors.yellow,
                        );
                      }
                    }
                    if (id != null) {
                      dataController.updateStudentDetails(id!);
                    }
                    // Clear the text fields
                    dataController.nameController.text = '';
                    dataController.ageController.text = '';
                    dataController.rollnoController.text = '';

                    // Close the bottom sheet
                    Get.back();
                  },
                  child: Text(
                      id == null ? 'Add Student' : 'Update student Details'),
                ),
              )
            ],
          ),
        ),
        backgroundColor: Colors.white);
  }
}
