import 'package:flutter_pair_programming_lab/src/data/datasources/action_datasource_impl.dart';
import 'package:flutter_pair_programming_lab/src/data/datasources/action_datasource_interface.dart';
import 'package:flutter_pair_programming_lab/src/data/repositories/action_repository_impl.dart';
import 'package:flutter_pair_programming_lab/src/domain/repositories/action_repository_interface.dart';
import 'package:flutter_pair_programming_lab/src/domain/usecases/get_action_by_id_usecase.dart';
import 'package:flutter_pair_programming_lab/src/domain/usecases/get_actions_usecase.dart';
import 'package:flutter_pair_programming_lab/src/domain/usecases/update_action_status_usecase.dart';
import 'package:flutter_pair_programming_lab/src/presentation/cubit/action_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupInjection() {
  getIt.registerLazySingleton<ActionDatasourceInterface>(
    () => ActionDatasourceImpl(),
  );

  getIt.registerLazySingleton<ActionRepositoryInterface>(
    () => ActionRepositoryImpl(datasource: getIt<ActionDatasourceInterface>()),
  );

  getIt.registerLazySingleton<GetActionsUsecase>(
    () => GetActionsUsecase(
      repository: getIt<ActionRepositoryInterface>(),
    ),
  );

  getIt.registerLazySingleton<GetActionByIdUsecase>(
    () => GetActionByIdUsecase(
      repository: getIt<ActionRepositoryInterface>(),
    ),
  );

  getIt.registerLazySingleton<UpdateActionStatusUsecase>(
    () => UpdateActionStatusUsecase(
      repository: getIt<ActionRepositoryInterface>(),
    ),
  );

  getIt.registerFactory(
    () => ActionCubit(
      getActionsUsecase: getIt<GetActionsUsecase>(),
      getActionByIdUsecase: getIt<GetActionByIdUsecase>(),
      updateActionStatusUsecase: getIt<UpdateActionStatusUsecase>(),
    ),
  );
}
