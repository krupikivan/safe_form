import 'package:flutter/material.dart';

import 'custom_loading_overlay.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold({
    Key? key,
    required this.body,
    this.appBar,
    this.showSnackbar,
    this.backgroundColor,
    this.isLoading = false,
  }) : super(key: key);
  final Widget body;
  final bool isLoading;
  final Color? backgroundColor;
  final AppBar? appBar;
  final VoidCallback? showSnackbar;
  @override
  Widget build(BuildContext context) {
    return CustomLoadingOverlay(
      isLoading: isLoading,
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: appBar,
        body: body,
      ),
    );
  }

  // void show(String message) {
  //   ScaffoldMessenger.of(_context)
  //     ..hideCurrentSnackBar()
  //     ..showSnackBar(
  //       SnackBar(content: Text(message)),
  //     );
  // }
}
