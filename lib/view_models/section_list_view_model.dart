import 'package:safe_form/models/section.dart';
import 'package:safe_form/networking/section_networking.dart';
import 'package:safe_form/services/navigation_service.dart';
import 'package:safe_form/utilities/locator.dart';
import 'package:safe_form/utilities/route_names.dart';

import 'base_view_model.dart';

class SectionListViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _sectionNetworking = locator<SectionNetworking>();
  final List<Section> _sections = [];
  Section? _sectionSelected;

  List<Section> get sections => _sections;
  Section? get sectionSelected => _sectionSelected;

  Future get fetchAllSections async {
    final list = await _sectionNetworking.getAllSections();
    _sections.addAll(list);
    notifyListeners();
  }

  Future navigateToSectionDetail(Section value) async {
    _navigationService.navigateTo(SectionDetail, arguments: value);
  }
}
