// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_pair_programming_lab/src/domain/entities/action_entity.dart';
import 'package:flutter_pair_programming_lab/src/commons/enum/status_enum.dart';
import 'package:flutter_pair_programming_lab/src/commons/enum/type_enum.dart';

class ActionModel {
  final int id;
  final String title;
  final String description;
  final TypeEnum type;
  final StatusEnum status;

  ActionModel({
    required this.id,
    required this.title,
    required this.description,
    required this.type,
    required this.status,
  });

  factory ActionModel.fromJson(Map<String, dynamic> json) {
    return ActionModel(
      id: json['id'] ?? -1,
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      type: TypeEnum.values.firstWhere(
        (e) => e.value.toString() == json['type'],
      ),
      status: StatusEnum.values.firstWhere(
        (e) => e.value.toString() == json['status'],
      ),
    );
  }

  factory ActionModel.fromEntity(ActionEntity entity) {
    return ActionModel(
      id: entity.id,
      title: entity.title,
      description: entity.description,
      type: entity.type,
      status: entity.status,
    );
  }

  ActionEntity toEntity() {
    return ActionEntity(
      id: id,
      title: title,
      description: description,
      type: type,
      status: status,
    );
  }

  static List<ActionModel> fromJsonList(List<dynamic> jsonList) =>
      jsonList.map((json) => ActionModel.fromJson(json)).toList();
}
