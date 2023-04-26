import 'package:bloc/bloc.dart';

import 'package:donor_darah/domain/base/authentication_headers_request.dart';
import 'package:donor_darah/domain/model/data/jadwal_donor/schedule_data.dart';
import 'package:donor_darah/domain/repository/jadwal_donor/jadwal_donor_repository.dart';
import 'package:equatable/equatable.dart';

import '../../../../base/result_entity.dart';

part 'jadwal_donor_state.dart';

class JadwalDonorCubit extends Cubit<JadwalDonorState> {
  final JadwalDonorRepository repository;

  JadwalDonorCubit(this.repository) : super(JadwalDonorInitial());

  Future<void> fetchSchedule({
    required String accesToken,
    required int unitId,
  }) async {
    emit(JadwalDonorIsLoading());

    final response = await repository.fetchSchedule(
      AuthenticationHeadersRequest("accesToken"),
      unitId,
    );

    if (response is ResultSucces) {
      emit(JadwalDonorIsSuccess((response as ResultSucces).data));
    } else {
      emit(JadwalDonorIsError(message: (response as ResultError).message));
    }
  }
}
