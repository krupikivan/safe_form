import 'package:equatable/equatable.dart';
import 'package:safe_form/models/item_detail.dart';

class SectionItems extends Equatable {
  const SectionItems({
    required this.sectionId,
    required this.items,
    required this.title,
  });

  factory SectionItems.fromJson(Map<String, dynamic> json) {
    return SectionItems(
      sectionId: json['id'],
      title: json['title'],
      items:
          (json['items'] as List).map((e) => ItemDetail.fromJson(e)).toList(),
    );
  }

  Map<String, dynamic> get toJson => {
        'id': sectionId,
        'items': items.map((e) => e.toJson).toList(),
        'title': title,
      };

  final int sectionId;
  final String title;
  final List<ItemDetail> items;

  @override
  List<Object?> get props => [
        sectionId,
        items,
        title,
      ];

  @override
  bool? get stringify => true;
}
