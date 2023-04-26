import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'navbar_state.dart';

class BottomNavBarCubit extends Cubit<BottomNavBarState> {
  BottomNavBarCubit() : super(BottomNavBarIsChanged(index: 0));

  void changeIndex(int newIndex) {
    emit(BottomNavBarIsChanged(index: newIndex));
  }
}
