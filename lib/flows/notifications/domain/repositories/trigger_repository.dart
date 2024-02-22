import 'package:either_dart/either.dart';
import 'package:make_it/flows/notifications/data/datasources/trigger_datasource.dart';
import 'package:make_it/flows/notifications/data/models/trigger_model.dart';
import 'package:make_it/services/network/failures/failure.dart';

abstract class ITriggerRepository {
  Future<Either<Failure, List<TriggerModel>>> getTriggers();
}

class TriggerRepository extends ITriggerRepository {
  TriggerRepository(this._dataSource);
  final ITriggerDataSource _dataSource;

  @override
  Future<Either<Failure, List<TriggerModel>>> getTriggers() async {
    try {
      final result = await _dataSource.getTriggers();
      return Right(result);
    } catch (e, trace) {
      return Left(Failure.from(e, trace));
    }
  }
}
