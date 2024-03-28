import '../../domain/model/ period_model.dart';

abstract class PeriodState {
  List<Period> periods;
  dynamic period;

  PeriodState({
    this.period,
    required this.periods,
  });
}

class PeriodInitialState extends PeriodState {
  PeriodInitialState() : super(periods: []);
}

class PeriodsLoadSucessState extends PeriodState {
  PeriodsLoadSucessState({required List<Period> periods})
      : super(periods: periods);
}

class PeriodsAddSucessState extends PeriodState {
  PeriodsAddSucessState({required period}) : super(period: period, periods: []);
}

class PeriodsUpdateSucessState extends PeriodState {
  PeriodsUpdateSucessState({required period})
      : super(period: period, periods: []);
}

class PeriodsDeleteSucessState extends PeriodState {
  PeriodsDeleteSucessState({required id}) : super(period: id, periods: []);
}
