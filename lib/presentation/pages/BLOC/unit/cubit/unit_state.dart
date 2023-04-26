part of 'unit_cubit.dart';

class UnitState extends Equatable {
  const UnitState();

  @override
  List<Object> get props => [];
}

class UnitInitial extends UnitState {}

class UnitIsLoading extends UnitState {}

class UnitIsLoaded extends UnitState {}

class UnitIsSucces extends UnitState {
  final UnitData data;

  const UnitIsSucces({required this.data});
}

// ignore: must_be_immutable
class UnitIsFailed extends UnitState {
  String? message;

  UnitIsFailed({this.message});
}
