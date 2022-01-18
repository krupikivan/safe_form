import 'package:flutter/material.dart';
import 'package:loading_overlay/loading_overlay.dart';

class CustomLoadingOverlay extends StatelessWidget {
  const CustomLoadingOverlay({
    Key? key,
    required this.isLoading,
    required this.child,
  }) : super(key: key);

  final bool isLoading;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return LoadingOverlay(
      isLoading: isLoading,
      color: Colors.black,
      opacity: 0.75,
      child: child,
      progressIndicator: const CircularProgressIndicator(),
    );
  }
}
