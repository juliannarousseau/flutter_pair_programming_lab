import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_pair_programming_lab/src/data/datasources/action_datasource_interface.dart';
import 'package:flutter_pair_programming_lab/src/data/models/action_model.dart';

class ActionDatasourceImpl implements ActionDatasourceInterface {
  final List<ActionModel> _actions = [];

  @override
  Future<ActionModel> getActionById({required int id}) async {
    if (_actions.isEmpty) await getActions();

    return _actions.firstWhere(
      (action) => action.id == id,
      orElse: () => throw Exception('Ação com ID $id não encontrada'),
    );
  }

  @override
  Future<List<ActionModel>> getActions() async {
    await Future.delayed(const Duration(milliseconds: 500));

    final jsonString = await rootBundle.loadString('assets/mock/actions.json');
    final List<dynamic> actionsJson = json.decode(jsonString);

    final actions =
        actionsJson.map((json) => ActionModel.fromJson(json)).toList();
        
    _actions.clear();
    _actions.addAll(actions);
    return actions;
  }

  @override
  Future<void> updateAction({required ActionModel action}) async {
    final index = _actions.indexWhere((a) => a.id == action.id);

    if (index == -1) {
      throw Exception('Ação com ID ${action.id} não encontrada');
    }

    _actions[index] = action;
  }
}
