import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SpinKitThreeBounce(
      size: 30,
      itemBuilder: (BuildContext context, int index) {
        return const DecoratedBox(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.black,
          ),
        );
      },
    );
  }
}
