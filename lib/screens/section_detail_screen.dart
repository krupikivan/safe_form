import 'package:flutter/material.dart';
import 'package:safe_form/screens/base_view.dart';
import 'package:safe_form/utilities/notifier_state.dart';
import 'package:safe_form/view_models/section_detail_view_model.dart';
import 'package:safe_form/widgets/check_list.dart';
import 'package:safe_form/widgets/custom_scaffold.dart';

class SectionDetailScreen extends StatelessWidget {
  const SectionDetailScreen({Key? key, required this.viewModel})
      : super(key: key);
  final SectionDetailViewModel viewModel;
  @override
  Widget build(BuildContext context) {
    return BaseView<SectionDetailViewModel>(
      viewModel: viewModel,
      onModelReady: (model) => viewModel.getSectionItems,
      builder: (context, viewModel, _) => CustomScaffold(
        isLoading: viewModel.notifierState == NotifierState.loading,
        appBar: AppBar(
          backgroundColor: Colors.black12,
          title: Text(viewModel.section.title),
        ),
        body: ListView.separated(
          separatorBuilder: (context, index) => const Divider(),
          itemBuilder: (BuildContext context, int index) => CheckList(
            onChanged: (value) =>
                viewModel.updateChecked(value, viewModel.allItems[index]),
            item: viewModel.allItems[index],
            sectionId: viewModel.sectionId,
            onSave: viewModel.updateItem,
            selected: viewModel.containItem(viewModel.allItems[index]),
          ),
          itemCount: viewModel.allItems.length,
        ),
      ),
    );
  }
}
