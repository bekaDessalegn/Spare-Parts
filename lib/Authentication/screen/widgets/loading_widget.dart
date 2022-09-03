import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {

  final Widget child;
  LoadingWidget({required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        Center(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.grey.withOpacity(0.55),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                CircularProgressIndicator(),
                SizedBox(width: 25.50),
                Text("Loading..."),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
