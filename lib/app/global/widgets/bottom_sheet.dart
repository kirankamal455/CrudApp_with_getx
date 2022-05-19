import 'package:crud_app_flutter/app/modules/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:get/get.dart';

class BottomUpSheet {
  int? id;
  final String? name;
  final String? age;
  final String? rollno;
  final DataController dataController;
  final BuildContext context;

  BottomUpSheet({
    this.name,
    this.id,
    this.age,
    this.rollno,
    required this.dataController,
    required this.context,
  });

  GlobalKey<FormState> form = GlobalKey<FormState>();

// This function will be working  when the floating button is pressed
// It will also be working when you want to update an student
  void studentsDetailsForm() async {
    if (id != null) {
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
          child: Form(
            key: form,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                TextFormField(
                  controller: dataController.nameController,
                  validator:
                      ValidationBuilder().minLength(4).maxLength(10).build(),
                  decoration: const InputDecoration(hintText: 'Student Name'),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: dataController.ageController,
                  validator:
                      ValidationBuilder().minLength(1).maxLength(2).build(),
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(hintText: 'Age'),
                ),
                TextFormField(
                  controller: dataController.rollnoController,
                  validator:
                      ValidationBuilder().minLength(1).maxLength(2).build(),
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(hintText: 'Roll No'),
                ),
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: () async {
                      if (form.currentState!.validate()) {
                        if (id == null) {
                          await dataController.addStudentButtonClicked();
                        } else {
                          await dataController.updateStudentDetails(id!);
                        }
                        // Clear the text fields
                        form.currentState?.reset();

                        // // Close the bottom sheet
                        Get.back();
                      }
                    },
                    child: Text(
                        id == null ? 'Add Student' : 'Update student Details'),
                  ),
                )
              ],
            ),
          ),
        ),
        backgroundColor: Colors.white);
  }
}
