import 'package:equatable/equatable.dart';

class Section extends Equatable {
  const Section({
    required this.id,
    required this.title,
    required this.items,
  });

  factory Section.fromJson(Map<String, dynamic> json) {
    return Section(
      id: json['id'],
      title: json['title'],
      items: (json['items'] as List).map((e) => e as String).toList(),
    );
  }

  Map<String, dynamic> get toJson => {
        'id': id,
        'title': title,
      };

  final int id;
  final String title;
  final List<String> items;

  @override
  List<Object?> get props => [
        id,
        title,
        items,
      ];

  @override
  bool? get stringify => true;
}
