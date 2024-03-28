import 'dart:async';

import '../../data/repositories/period_repository.dart';
import '../../domain/model/ period_model.dart';
import 'period_events.dart';
import 'period_states.dart';

class PeriodBloc {
  final PeriodRepository repository;

  final StreamController<PeriodEvents> _inputPeriodsController =
      StreamController<PeriodEvents>();
  final StreamController<PeriodState> _outputPeriodsController =
      StreamController<PeriodState>();

  Sink<PeriodEvents> get inputPeriods => _inputPeriodsController.sink;
  Stream<PeriodState> get stream => _outputPeriodsController.stream;

  PeriodBloc(this.repository) {
    _inputPeriodsController.stream.listen(_mapEventToState);
  }

  _mapEventToState(PeriodEvents event) async {
    List<Period> periods = [];
    if (event is LoadPeriodEvents) {
      periods = await repository.getAllPeriods();
    } else if (event is AddPeriodEvents) {
      await repository.addPeriod(event.period);
    } else if (event is UpdatePeriodEvents) {
      await repository.updatePeriod(event.period);
    } else if (event is DeletePeriodEvents) {
      await repository.deletePeriod(event.id);
    }
    _outputPeriodsController.add(PeriodsLoadSucessState(periods: periods));
  }
}
