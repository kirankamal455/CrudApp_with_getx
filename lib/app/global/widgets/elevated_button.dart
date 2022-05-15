import 'package:crud_app_flutter/app/data/services/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';

class Button extends StatelessWidget {
  final bool? state;
  final GlobalKey<FormState> key1;
  final String text;
  const Button({
    required this.key1,
    Key? key,
    required this.text,
    this.state,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.put(AuthController());

    return Container(
      height: 46,
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: ElevatedButton(
        onPressed: () {
          authController.userSignInAndSighnUp(
            key: key1,
            state: state,
          );
        },
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(80.0),
            ),
          ),
        ),
        child: Text(text, style: const TextStyle(fontSize: 16)),
      ),
    );
  }
}
