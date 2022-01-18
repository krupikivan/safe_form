import 'package:safe_form/models/checked_item.dart';
import 'package:safe_form/models/item_detail.dart';
import 'package:safe_form/models/section.dart';
import 'package:safe_form/models/section_items.dart';
import 'package:safe_form/services/api_service.dart';
import 'package:safe_form/utilities/exception/custom_networking_exception.dart';
import 'package:safe_form/utilities/failures/failure.dart';
import 'package:safe_form/utilities/failures/failures.dart';
import 'package:safe_form/utilities/locator.dart';

class SectionNetworking {
  final _apiService = locator<ApiService>();

  Future updateSection(SectionItems section) async {
    try {
      final body = section.toJson;
      _apiService.put(
        path: '/items/${section.sectionId}',
        data: body,
      );
    } catch (e) {
      rethrow;
    }
  }

  Future createItem(Section section) async {
    try {
      final body = {
        'id': section.id,
        'title': section.title,
        'items': [],
      };
      _apiService.post(
        path: '/items',
        data: body,
      );
    } catch (e) {
      rethrow;
    }
  }

  Future addChecked(String item, int sectionId) async {
    try {
      final body = {
        'item': item,
        'sectionId': sectionId,
      };
      _apiService.post(
        path: '/checked',
        data: body,
      );
    } catch (e) {
      rethrow;
    }
  }

  Future removeChecked(CheckedItem item) async {
    try {
      _apiService.delete(
        path: '/checked/${item.id}',
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Section>> getAllSections() async {
    try {
      final response = await _apiService.get(
        path: '/sections',
      );
      return (response as List)
          .map(
            (e) => Section.fromJson(e),
          )
          .toList();
    } on NoInternetConnectionFailure {
      throw const Failure('No Internet connection');
    } catch (e) {
      rethrow;
    }
  }

  Future<List<CheckedItem>> getCheckedItems() async {
    try {
      final response = await _apiService.get(
        path: '/checked',
      );
      return (response as List)
          .map(
            (e) => CheckedItem.fromJson(e),
          )
          .toList();
    } catch (e) {
      rethrow;
    }
  }

  Future<SectionItems> getSectionItems(int sectionId) async {
    try {
      final response = await _apiService.get(
        path: '/items/$sectionId',
      );
      return SectionItems.fromJson(response);
    } on BadRequestException {
      throw const ItemNotExistFailure();
    } catch (e) {
      rethrow;
    }
  }

  Future<ItemDetail> getItemDetail(int sectionId, String title) async {
    try {
      final response = await _apiService.get(
        path: '/items/$sectionId',
      );
      final jsonDetail = response['items'] as List;
      final itemDetail = jsonDetail.where((e) => e['title'] == title).toList();
      if (itemDetail.isEmpty) {
        return ItemDetail(title: title);
      } else {
        final itemDetail = jsonDetail.firstWhere((e) => e['title'] == title);
        return ItemDetail.fromJson(itemDetail);
      }
    } catch (e) {
      rethrow;
    }
  }
}
