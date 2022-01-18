import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

class ItemDetail extends Equatable {
  const ItemDetail({
    this.problem,
    this.action,
    this.date,
    this.image,
    required this.title,
  });

  factory ItemDetail.fromJson(Map<String, dynamic> json) {
    return ItemDetail(
      problem: json['problem'],
      action: json['action'],
      title: json['title'],
      date: json['date'],
    );
  }

  Future<Map<String, dynamic>> get toJson async => {
        'problem': problem,
        'action': action,
        'date': date,
        'title': title,
        if (image != null) 'image': await image!.readAsBytes()
      };

  ItemDetail copyWith({
    String? problem,
    String? action,
    String? date,
    XFile? image,
  }) =>
      ItemDetail(
        title: title,
        image: image ?? this.image,
        action: action ?? this.action,
        problem: problem ?? this.problem,
        date: date ?? this.date,
      );

  final String title;
  final String? problem;
  final String? action;
  final String? date;
  final XFile? image;

  @override
  List<Object?> get props => [
        problem,
        date,
        action,
        title,
      ];

  @override
  bool? get stringify => true;
}
