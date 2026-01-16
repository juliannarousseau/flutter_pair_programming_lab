// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_pair_programming_lab/src/commons/enum/status_enum.dart';
import 'package:flutter_pair_programming_lab/src/commons/enum/type_enum.dart';

class ActionEntity {
  final int id;
  final String title;
  final String description;
  final TypeEnum type;
  final StatusEnum status;

  ActionEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.type,
    required this.status,
  });

  ActionEntity copyWith({
    int? id,
    String? title,
    String? description,
    TypeEnum? type,
    StatusEnum? status,
  }) {
    return ActionEntity(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      type: type ?? this.type,
      status: status ?? this.status,
    );
  }
}
