part of 'navbar_cubit.dart';

@immutable
abstract class BottomNavBarState {}

class BottomNavBarInitial extends BottomNavBarState {}

class BottomNavBarIsChanged extends BottomNavBarState {
  final int index;
  BottomNavBarIsChanged({
    required this.index,
  });
}
