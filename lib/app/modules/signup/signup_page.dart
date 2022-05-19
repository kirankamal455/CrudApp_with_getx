import 'package:crud_app_flutter/app/global/widgets/elevated_button.dart';
import 'package:crud_app_flutter/app/global/widgets/text_field.dart';
import 'package:crud_app_flutter/app/modules/signup/signup_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreen extends GetView<SignUpController> {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign up')),
      body: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key: controller.signUpFormKey,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: <Widget>[
              const SizedBox(height: 80),
              const Heading(text: 'Register'),
              const SizedBox(height: 30),
              Container(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  controller: controller.signupemailController,
                  validator: controller.validator1,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.all(15),
                    labelText: 'Email Id',
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: TextFormField(
                  obscureText: true,
                  controller: controller.signupPasswordController,
                  validator: controller.validator2,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.all(15),
                    labelText: 'Password',
                  ),
                ),
              ),
              const SizedBox(height: 40),
              Button(
                key1: controller.signUpFormKey,
                text: 'Sign Up',
                state: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
