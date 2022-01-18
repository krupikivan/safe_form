import 'package:flutter/material.dart';
import 'package:safe_form/models/section.dart';
import 'package:safe_form/screens/section_detail_screen.dart';
import 'package:safe_form/screens/section_list_screen.dart';
import 'package:safe_form/view_models/section_detail_view_model.dart';
import 'package:safe_form/view_models/section_list_view_model.dart';

import 'app_page_transition.dart';
import 'route_names.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SectionListRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: SectionListScreen(
          viewModel: SectionListViewModel(),
        ),
      );
    case SectionDetail:
      final section = settings.arguments as Section;
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: SectionDetailScreen(
          viewModel: SectionDetailViewModel(section: section),
        ),
      );
    default:
      throw Exception('${settings.name} route not handled');
  }
}

AppPageTransition _getPageRoute({
  String? routeName,
  Widget? viewToShow,
  bool fullScreenDialog = false,
  dynamic arguments,
}) {
  return AppPageTransition(
    settings: RouteSettings(name: routeName, arguments: arguments),
    fullScreenDialog: fullScreenDialog,
    type: fullScreenDialog
        ? PageTransitionType.fade
        : PageTransitionType.rightToLeft,
    child: viewToShow!,
  );
}
