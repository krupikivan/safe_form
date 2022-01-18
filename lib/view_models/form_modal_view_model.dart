import 'package:safe_form/models/item_detail.dart';
import 'package:safe_form/networking/section_networking.dart';
import 'package:safe_form/utilities/locator.dart';

import 'base_view_model.dart';

class FormModalViewModel extends BaseViewModel {
  FormModalViewModel({required String title, required int sectionId})
      : _title = title,
        _sectionId = sectionId;

  final _sectionNetworking = locator<SectionNetworking>();

  final String _title;
  final int _sectionId;
  late ItemDetail _itemDetail;

  String get title => _title;

  ItemDetail get itemDetail => _itemDetail;

  Future get getItemDetails async {
    try {
      _itemDetail = await _sectionNetworking.getItemDetail(_sectionId, _title);
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }

  void setDate(String value) {
    _itemDetail = _itemDetail.copyWith(date: value);
    notifyListeners();
  }

  void setProblem(String value) {
    _itemDetail = _itemDetail.copyWith(problem: value);
    notifyListeners();
  }

  void setAction(String value) {
    _itemDetail = _itemDetail.copyWith(action: value);
    notifyListeners();
  }
}
