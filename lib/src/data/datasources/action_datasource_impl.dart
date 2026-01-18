import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_pair_programming_lab/src/data/datasources/action_datasource_interface.dart';
import 'package:flutter_pair_programming_lab/src/data/models/action_model.dart';

class ActionDatasourceImpl implements ActionDatasourceInterface {
  List<ActionModel> _actions = [];

  @override
  Future<List<ActionModel>> getActions() async {
    await Future.delayed(Duration(milliseconds: 300));

    final jsonString = await rootBundle.loadString('assets/mock/actions.json');
    final List<dynamic> actionsJson = json.decode(jsonString);

    _actions = ActionModel.fromJsonList(actionsJson);
    return _actions;
  }

  @override
  Future<void> updateAction(ActionModel action) async {
    final index = _actions.indexWhere((a) => a.id == action.id);
    if (index == -1) {
      throw Exception('Ação com ID ${action.id} não encontrada.');
    }
    _actions[index] = action;
  }
}
