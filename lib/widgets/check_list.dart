import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:safe_form/models/item_detail.dart';
import 'package:safe_form/view_models/form_modal_view_model.dart';
import 'package:safe_form/widgets/custom_icon_widget.dart';
import 'package:safe_form/widgets/form_modal_widget.dart';

class CheckList extends StatelessWidget {
  const CheckList({
    Key? key,
    required this.item,
    required this.onChanged,
    required this.selected,
    required this.onSave,
    required this.sectionId,
  }) : super(key: key);
  final String item;
  final bool selected;
  final int sectionId;
  final Function(bool?) onChanged;
  final Function(ItemDetail) onSave;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Checkbox(
            value: selected,
            onChanged: onChanged,
          ),
          Expanded(
            child: Text(
              item,
              maxLines: 6,
            ),
          ),
          CustomIcon(
            icon: Icons.add,
            onTap: () => showMaterialModalBottomSheet(
              context: context,
              builder: (_) => FormModal(
                onSave: onSave,
                viewModel:
                    FormModalViewModel(title: item, sectionId: sectionId),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
