import 'package:flutter_pair_programming_lab/src/commons/enum/status_enum.dart';
import 'package:flutter_pair_programming_lab/src/commons/enum/type_enum.dart';
import 'package:flutter_pair_programming_lab/src/domain/entities/action_entity.dart';

class ActionModel {
  final int id;
  final String title;
  final String description;
  final TypeEnum type;
  final StatusEnum status;
  final String shareUrl;

  ActionModel({
    required this.id,
    required this.title,
    required this.description,
    required this.type,
    required this.status,
    required this.shareUrl,
  });

  factory ActionModel.fromJson(Map<String, dynamic> json) {
    return ActionModel(
      id: json['id'] ?? -1,
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      type: TypeEnum.values.firstWhere(
        (e) => e.name.toLowerCase() == json['type'].replaceAll('_', ''),
        orElse: () => throw Exception('Tipo inválido: ${json['type']}'),
      ),
      status: StatusEnum.values.firstWhere(
        (e) => e.name == json['status'],
        orElse: () => throw Exception('Status inválido: ${json['status']}'),
      ),
      shareUrl: json['shareUrl'] ?? '',
    );
  }

  factory ActionModel.fromEntity(ActionEntity entity) {
    return ActionModel(
      id: entity.id,
      title: entity.title,
      description: entity.description,
      type: entity.type,
      status: entity.status,
      shareUrl: entity.shareUrl,
    );
  }

  ActionEntity toEntity() {
    return ActionEntity(
      id: id,
      title: title,
      description: description,
      type: type,
      status: status,
      shareUrl: shareUrl,
    );
  }
}
