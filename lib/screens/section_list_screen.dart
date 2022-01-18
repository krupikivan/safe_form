import 'package:flutter/material.dart';
import 'package:safe_form/utilities/notifier_state.dart';
import 'package:safe_form/view_models/section_list_view_model.dart';
import 'package:safe_form/widgets/custom_scaffold.dart';
import 'package:safe_form/widgets/section_item_widget.dart';

import 'base_view.dart';

class SectionListScreen extends StatelessWidget {
  const SectionListScreen({Key? key, required this.viewModel})
      : super(key: key);
  final SectionListViewModel viewModel;
  @override
  Widget build(BuildContext context) {
    return BaseView<SectionListViewModel>(
      viewModel: viewModel,
      onModelReady: (model) => model.fetchAllSections,
      builder: (context, viewModel, _) => CustomScaffold(
        isLoading: viewModel.notifierState == NotifierState.loading,
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            children: viewModel.sections
                .map(
                  (e) => SectionItem(
                    section: e,
                    onTap: (section) =>
                        viewModel.navigateToSectionDetail(section),
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
