part of 'balance_bloc.dart';

sealed class BalanceState extends Equatable {
  const BalanceState();
  
  @override
  List<Object> get props => [];
}

final class BalanceInitial extends BalanceState {}

class BalanceLoaded extends BalanceState {
  final Portfolio balance;

  final List<History> history;


  const BalanceLoaded(this.balance, this.history );

  @override
  List<Object> get props => [balance, history];
}

class BalanceLoading extends BalanceState {}

class BalanceError extends BalanceState {
  final String message;

  const BalanceError(this.message);

  @override
  List<Object> get props => [message];
}