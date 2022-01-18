import 'package:safe_form/models/section.dart';
import 'package:safe_form/networking/section_networking.dart';
import 'package:safe_form/services/navigation_service.dart';
import 'package:safe_form/utilities/failures/failure.dart';
import 'package:safe_form/utilities/locator.dart';
import 'package:safe_form/utilities/notifier_state.dart';
import 'package:safe_form/utilities/route_names.dart';

import 'base_view_model.dart';

class SectionListViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _sectionNetworking = locator<SectionNetworking>();
  final List<Section> _sections = [];
  Section? _sectionSelected;
  Failure? _failure;
  bool get hasError => _failure != null;

  List<Section> get sections => _sections;
  Section? get sectionSelected => _sectionSelected;

  Future get fetchAllSections async {
    try {
      setNotifierState(NotifierState.loading);
      final list = await _sectionNetworking.getAllSections();
      _sections.addAll(list);
      notifyListeners();
    } on Failure catch (f) {
      _failure = f;
    } finally {
      setNotifierState(NotifierState.loaded);
    }
  }

  Future navigateToSectionDetail(Section value) async {
    _navigationService.navigateTo(SectionDetailRoute, arguments: value);
  }
}
