import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SpinKitSpinningLines(
          itemCount: 10,
          size: 200,
          color: Theme.of(context).colorScheme.secondary,
        ),
      ],
    );
  }
}

class ErrorDisplay extends StatelessWidget {
  const ErrorDisplay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: Container(
            color: const Color(0XFF202125),
            child: const Center(
              child: Image(
                image: AssetImage("assets/images/error.png"),
              ),
            ),
          ),
        )
      ],
    );
  }
}
