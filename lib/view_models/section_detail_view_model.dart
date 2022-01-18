import 'package:safe_form/models/checked_item.dart';
import 'package:safe_form/models/item_detail.dart';
import 'package:safe_form/models/section.dart';
import 'package:safe_form/models/section_items.dart';
import 'package:safe_form/networking/section_networking.dart';
import 'package:safe_form/services/navigation_service.dart';
import 'package:safe_form/utilities/failures/failures.dart';
import 'package:safe_form/utilities/locator.dart';

import 'base_view_model.dart';

class SectionDetailViewModel extends BaseViewModel {
  SectionDetailViewModel({required Section section}) : _section = section;
  final _navigatorService = locator<NavigationService>();
  final _sectionNetworking = locator<SectionNetworking>();

  final Section _section;

  SectionItems? _sectionItems;

  ItemDetail? get itemDetail => _itemDetail;
  Section get section => _section;

  List<String> get allItems => _section.items;

  int get sectionId => _section.id;

  bool containItem(item) => _selectedItems
      .where((e) => e.sectionId == _section.id)
      .map((e) => e.item)
      .contains(item);

  final List<CheckedItem> _selectedItems = [];

  ItemDetail? _itemDetail;

  Future get getSectionItems async {
    try {
      await getCheckedItems();
      _sectionItems = await _sectionNetworking.getSectionItems(_section.id);
    } on ItemNotExistFailure {
      await _sectionNetworking.createItem(_section);
      _sectionItems = await _sectionNetworking.getSectionItems(_section.id);
    }
  }

  Future updateItem(ItemDetail item) async {
    _sectionItems!.items.removeWhere((ItemDetail e) => e.title == item.title);
    _sectionItems!.items.add(item);
    await _sectionNetworking.updateSection(_sectionItems!);
    notifyListeners();
    _navigatorService.pop();
  }

  Future getCheckedItems() async {
    final list = await _sectionNetworking.getCheckedItems();
    _selectedItems.clear();
    _selectedItems.addAll(list);
    notifyListeners();
  }

  Future updateChecked(bool? value, String item) async {
    if (value != null) {
      if (value) {
        await _sectionNetworking.addChecked(item, _section.id);
      } else {
        final _checked = _selectedItems
            .where((e) => e.sectionId == _section.id)
            .firstWhere((e) => e.item == item);
        await _sectionNetworking.removeChecked(_checked);
      }
      await getCheckedItems();
    }
  }
}
