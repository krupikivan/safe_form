import 'package:flutter/material.dart';
import 'package:safe_form/models/item_detail.dart';
import 'package:safe_form/screens/base_view.dart';
import 'package:safe_form/services/navigation_service.dart';
import 'package:safe_form/utilities/locator.dart';
import 'package:safe_form/view_models/form_modal_view_model.dart';

import 'custom_icon_widget.dart';
import 'custom_text_field_widget.dart';

class FormModal extends StatefulWidget {
  const FormModal({
    Key? key,
    required this.viewModel,
    required this.onSave,
  }) : super(key: key);
  final FormModalViewModel viewModel;
  final Function(ItemDetail) onSave;

  @override
  State<FormModal> createState() => _FormModalState();
}

class _FormModalState extends State<FormModal> {
  late TextEditingController _actionController;
  late TextEditingController _problemController;
  late TextEditingController _dateController;

  @override
  void initState() {
    _actionController = TextEditingController();
    _problemController = TextEditingController();
    _dateController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const separator = SizedBox(
      height: 30,
    );
    return BaseView<FormModalViewModel>(
      viewModel: widget.viewModel,
      onModelReady: (model) async {
        await model.getItemDetails;
        _actionController.text = model.itemDetail.action ?? '';
        _problemController.text = model.itemDetail.problem ?? '';
        _dateController.text = model.itemDetail.date ?? '';
      },
      builder: (context, viewModel, _) => SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomIcon(
                    size: 35,
                    icon: Icons.close,
                    onTap: locator<NavigationService>().currentState.pop,
                  ),
                ],
              ),
              Text(
                viewModel.title,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 20),
              ),
              separator,
              CustomTextField(
                controller: _problemController,
                onChanged: viewModel.setProblem,
                label: 'Potential Problem',
                maxLines: 3,
              ),
              separator,
              CustomTextField(
                controller: _actionController,
                onChanged: viewModel.setAction,
                label: 'Recommended action',
                maxLines: 6,
              ),
              separator,
              CustomTextField(
                onTap: () async {
                  final date = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2010),
                    lastDate: DateTime.now(),
                  );
                  _dateController.text = date.toString().substring(0, 10);
                  viewModel.setDate(_dateController.text);
                },
                label: 'Date Corrected',
                maxLines: 1,
                controller: _dateController,
                readOnly: true,
              ),
              separator,
              GestureDetector(
                onTap: () => widget.onSave(viewModel.itemDetail),
                child: Container(
                  height: 40,
                  width: 80,
                  decoration: const BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      'Save',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
