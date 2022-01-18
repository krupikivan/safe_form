import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:safe_form/view_models/base_view_model.dart';

class BaseView<T extends BaseViewModel> extends StatefulWidget {
  const BaseView({
    Key? key,
    required this.builder,
    required this.viewModel,
    this.onModelReady,
  }) : super(key: key);

  final T viewModel;
  final Function(T)? onModelReady;
  final Widget Function(BuildContext context, T model, Widget? child) builder;

  @override
  _BaseViewState<T> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends BaseViewModel> extends State<BaseView<T>> {
  @override
  void initState() {
    if (widget.onModelReady != null) {
      widget.onModelReady!(widget.viewModel);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>.value(
      value: widget.viewModel,
      child: Consumer<T>(builder: widget.builder),
    );
  }
}
