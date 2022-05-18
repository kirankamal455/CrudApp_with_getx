// import 'package:crud_app_flutter/app/modules/login/login_controller.dart';
// import 'package:crud_app_flutter/app/modules/signup/signup_controller.dart';
// import 'package:crud_app_flutter/app/routes/app_pages.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_instance/get_instance.dart';
// import 'package:get/get_navigation/src/extension_navigation.dart';
// import 'package:get/get_state_manager/get_state_manager.dart';

// import 'i_firebase_service.dart';

// class FirebaseService extends GetxService implements IFirebaseService {
//   String errorMessage = '';
//   final SignUpController signUpController = Get.put(SignUpController());
//   final LoginController loginController = Get.put(LoginController());

//   @override
//   Future<void> userSignInAndSighnUp(
//       {required GlobalKey<FormState> key, required bool? state}) async {
//     if (key.currentState!.validate()) {
//       try {
//         if (state == true) {
//           //validation of signing
//           await FirebaseAuth.instance
//               .signInWithEmailAndPassword(
//                   email: loginController.loginEmailController.text.trim(),
//                   password: loginController.passwordController.text.trim())
//               .then(
//             (value) {
//               Get.offAllNamed(Routes.home);
//             },
//           );
//           //validation of signup
//         } else {
//           await FirebaseAuth.instance
//               .createUserWithEmailAndPassword(
//                   email: signUpController.signupemailController.text.trim(),
//                   password:
//                       signUpController.signupPasswordController.text.trim())
//               .then(
//             (value) {
//               Get.offAllNamed(Routes.home);
//             },
//           );
//         }
//         errorMessage = '';
//       } on FirebaseAuthException catch (e) {
//         errorMessage = e.code;
//         //An error from the firbase will trigger the snack bar
//         Get.rawSnackbar(
//           message: errorMessage,
//           backgroundColor: Colors.red,
//         );
//       }
//     }
//   }

// //Sign-out functionality
//   @override
//   void signOutUser() {
//     FirebaseAuth.instance
//         .signOut()
//         .then((value) => Get.offAllNamed(Routes.login));
//   }
// }
