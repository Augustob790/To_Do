import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repositories/period_repository.dart';
import 'period_events.dart';
import 'period_states.dart';

class PeriodFlutterBloc extends Bloc<PeriodEvents, PeriodState> {
  final repository = PeriodRepositoryImpl();

  PeriodFlutterBloc() : super(PeriodInitialState()) {
    on<LoadPeriodEvents>(((event, emit) async {
      emit(PeriodsLoadSucessState(periods: await repository.getAllPeriods()));
    }));

    on<AddPeriodEvents>(((event, emit) async {
      emit(PeriodsAddSucessState(period: repository.addPeriod(event.period)));
    }));

    on<UpdatePeriodEvents>(((event, emit) {
      emit(PeriodsUpdateSucessState(period: repository.updatePeriod(event.period)));
    }));

    on<DeletePeriodEvents>(((event, emit) {
      emit(PeriodsDeleteSucessState(id: repository.deletePeriod(event.id)));
    }));
  }
}
