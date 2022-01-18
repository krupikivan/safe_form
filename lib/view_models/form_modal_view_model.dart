import 'package:image_picker/image_picker.dart';
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
  XFile? _file;
  ItemDetail get itemDetail => _itemDetail;
  XFile? get file => _file;

  Future get getItemDetails async {
    try {
      _itemDetail = await _sectionNetworking.getItemDetail(_sectionId, _title);
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }

  Future openCamera() async {
    final ImagePicker _picker = ImagePicker();
    _file = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 40,
    );
    _itemDetail = _itemDetail.copyWith(image: _file);
    notifyListeners();
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
