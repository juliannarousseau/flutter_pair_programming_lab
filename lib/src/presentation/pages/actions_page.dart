import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pair_programming_lab/src/commons/enum/status_enum.dart';
import 'package:flutter_pair_programming_lab/src/domain/entities/action_entity.dart';
import 'package:flutter_pair_programming_lab/src/presentation/cubit/action_cubit.dart';
import 'package:flutter_pair_programming_lab/src/presentation/cubit/action_state.dart';
import 'package:flutter_pair_programming_lab/src/presentation/widgets/action_item.dart';

class ActionsPage extends StatelessWidget {
  const ActionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ações'),
      ),
      body: BlocBuilder<ActionCubit, ActionState>(
        builder: (context, state) {
          return switch (state) {
            ActionInitialState() || ActionLoadingState() => _LoadingView(),
            ActionEmptyState() => _EmptyView(),
            ActionSuccessState() => _SuccessView(actions: state.actions),
            ActionErrorState() => _ErrorView(message: state.message),
          };
        },
      ),
    );
  }
}

class _SuccessView extends StatelessWidget {
  final List<ActionEntity> actions;

  const _SuccessView({
    required this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: actions.length,
        separatorBuilder: (_, __) => SizedBox(height: 8),
        itemBuilder: (context, index) {
          return ActionItem(
            id: actions[index].id.toString(),
            title: actions[index].title,
            description: actions[index].description,
            type: actions[index].type.name,
            isChecked: actions[index].status == StatusEnum.done,
            onChanged: (value) {
              context.read<ActionCubit>().toggleActionStatus(actions[index].id);
            },
          );
        },
      ),
    );
  }
}

class _LoadingView extends StatelessWidget {
  const _LoadingView();

  @override
  Widget build(BuildContext context) {
    return Center(child: CircularProgressIndicator());
  }
}

class _EmptyView extends StatelessWidget {
  const _EmptyView();

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Nenhuma ação disponível'));
  }
}

class _ErrorView extends StatelessWidget {
  final String message;

  const _ErrorView({
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Erro: $message'));
  }
}
