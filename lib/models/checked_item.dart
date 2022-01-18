import 'package:equatable/equatable.dart';

class CheckedItem extends Equatable {
  const CheckedItem({
    required this.item,
    required this.id,
    required this.sectionId,
  });

  factory CheckedItem.fromJson(Map<String, dynamic> json) {
    return CheckedItem(
      item: json['item'],
      id: json['id'],
      sectionId: json['sectionId'],
    );
  }

  final String item;
  final int id;
  final int sectionId;

  @override
  List<Object?> get props => [
        item,
        id,
        sectionId,
      ];

  @override
  bool? get stringify => true;
}
