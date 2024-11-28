import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:quantum/src/core/dependency_injection.dart';
import 'package:quantum/src/core/utils/log.dart';
import 'package:quantum/src/feature/balance/models/asset.dart';
import 'package:quantum/src/feature/balance/models/history.dart';
import 'package:quantum/src/feature/balance/models/portfolio.dart';
import 'package:quantum/src/feature/balance/repository/repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'balance_event.dart';
part 'balance_state.dart';

class BalanceBloc extends Bloc<BalanceEvent, BalanceState> {
  final RepositoryBalance _repository = locator<RepositoryBalance>();

  BalanceBloc() : super(BalanceInitial()) {
    on<LoadBalance>(_onLoadBalances);
    on<UpdateBalance>(_onUpdateBalance);
    on<SaveBalance>(_onSaveBalance);
    on<RemoveBalance>(_onRemoveBalance);
  }

  Future<void> _onLoadBalances(
    LoadBalance event,
    Emitter<BalanceState> emit,
  ) async {
    emit(BalanceLoading());
    try {
      final SharedPreferences pref = await SharedPreferences.getInstance();
      final balance = await _repository.load();

      final history = pref
              .getStringList('history')
              ?.map((e) => History.fromMap(History.fromJson(e).toMap()))
              .toList() ??
          [];

      emit(BalanceLoaded(Portfolio(assets: balance), history));
    } catch (e) {
      logger.e(e);
      emit(const BalanceError('Failed to load asset'));
    }
  }

  Future<void> _onUpdateBalance(
    UpdateBalance event,
    Emitter<BalanceState> emit,
  ) async {
    try {
      final oldAsset = (state as BalanceLoaded)
          .balance
          .assets
          .firstWhere((element) => element.id == event.asset.id);
      await _repository.update(event.asset);

      final SharedPreferences pref = await SharedPreferences.getInstance();
      final history = pref
              .getStringList('history')
              ?.map((e) => History.fromMap(History.fromJson(e).toMap()))
              .toList() ??
          [];
      history.add(History(
          asset: event.asset,
          oldAsset: oldAsset,
          balance: (state as BalanceLoaded).balance.totalValue,
          date: DateTime.now(),
          type: 'update'));
      pref.setStringList('history', history.map((e) => e.toJson()).toList());

      add(LoadBalance());
    } catch (e) {
      emit(const BalanceError('Failed to update asset'));
    }
  }

  Future<void> _onSaveBalance(
    SaveBalance event,
    Emitter<BalanceState> emit,
  ) async {
    try {
      await _repository.save(event.asset);
      final SharedPreferences pref = await SharedPreferences.getInstance();
      final history = pref
              .getStringList('history')
              ?.map((e) => History.fromMap(History.fromJson(e).toMap()))
              .toList() ??
          [];
      history.add(History(
          asset: event.asset,
          balance: (state as BalanceLoaded).balance.totalValue,
          date: DateTime.now(),
          type: 'add'));
      pref.setStringList('history', history.map((e) => e.toJson()).toList());

      add(LoadBalance());
    } catch (e) {
      logger.e(e);
      emit(const BalanceError('Failed to save balance'));
    }
  }

  Future<void> _onRemoveBalance(
    RemoveBalance event,
    Emitter<BalanceState> emit,
  ) async {
    try {
      await _repository.remove(event.asset);
      final SharedPreferences pref = await SharedPreferences.getInstance();
      final history = pref
              .getStringList('history')
              ?.map((e) => History.fromMap(History.fromJson(e).toMap()))
              .toList() ??
          [];
      history.add(History(
          asset: event.asset,
          balance: (state as BalanceLoaded).balance.totalValue,
          date: DateTime.now(),
          type: 'delete'));
      pref.setStringList('history', history.map((e) => e.toJson()).toList());
      add(LoadBalance());
    } catch (e) {
      logger.e(e);
      emit(const BalanceError('Failed to remove transaction'));
    }
  }
}
