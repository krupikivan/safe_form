import 'package:equatable/equatable.dart';

class ItemDetail extends Equatable {
  const ItemDetail({
    this.problem,
    this.action,
    this.date,
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

  Map<String, dynamic> get toJson => {
        'problem': problem,
        'action': action,
        'date': date,
        'title': title,
      };

  ItemDetail copyWith({
    String? problem,
    String? action,
    String? date,
  }) =>
      ItemDetail(
        title: title,
        action: action ?? this.action,
        problem: problem ?? this.problem,
        date: date ?? this.date,
      );

  final String title;
  final String? problem;
  final String? action;
  final String? date;

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
