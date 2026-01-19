import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pair_programming_lab/src/commons/di/injection.dart';
import 'package:flutter_pair_programming_lab/src/presentation/cubit/action_cubit.dart';
import 'package:flutter_pair_programming_lab/src/presentation/pages/actions_page.dart';

class ActionsRoute {
  static Route<dynamic> route() {
    return MaterialPageRoute(
      builder: (_) {
        return BlocProvider(
          create: (_) => getIt<ActionCubit>()..fetchActions(),
          child: ActionsPage(),
        );
      },
    );
  }
}
