part of 'balance_bloc.dart';

sealed class BalanceEvent extends Equatable {
  const BalanceEvent();

  @override
  List<Object> get props => [];
}

class LoadBalance extends BalanceEvent {}

class UpdateBalance extends BalanceEvent {
  final Asset asset;

  const UpdateBalance(this.asset);

  @override
  List<Object> get props => [asset];
}

class SaveBalance extends BalanceEvent {
  final Asset asset;

  const SaveBalance(this.asset);

  @override
  List<Object> get props => [asset];
}

class RemoveBalance extends BalanceEvent {
  final Asset asset;

  const RemoveBalance(this.asset);

  @override
  List<Object> get props => [asset];
}

