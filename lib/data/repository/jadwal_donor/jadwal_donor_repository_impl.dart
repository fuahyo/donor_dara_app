import 'dart:convert';

import 'package:donor_darah/data/base/base_remote_response.dart';
import 'package:donor_darah/data/model/jadwal_donor/schedule_collection_response.dart';
import 'package:donor_darah/data/service/remote/jadwal_donor/jadwal_donor_service.dart';
import 'package:donor_darah/domain/base/authentication_headers_request.dart';
import 'package:donor_darah/domain/model/data/jadwal_donor/schedule_data.dart';
import 'package:donor_darah/domain/repository/jadwal_donor/jadwal_donor_repository.dart';

import '../../../base/result_entity.dart';

class JadwalDonorRepositoryImpl implements JadwalDonorRepository {
  final jadwalDonorService = JadwalDonorService();

  @override
  Future<ResultEntity<ScheduleData>> fetchSchedule(
      AuthenticationHeadersRequest header, int unitId) async {
    try {
      final response = await jadwalDonorService.fetchSchedule(header, unitId);
      print("STATUS CODE :${response.statusCode} ");
      print("DATA :${response.body} ");

      if (response.statusCode == 200 || response.statusCode == 201) {
        BaseRemoteResponse<ScheduleCollectionResponse> baseResponse =
            BaseRemoteResponse<ScheduleCollectionResponse>.fromJson(
          jsonDecode(response.body),
          (json) =>
              ScheduleCollectionResponse.fromJson(json as Map<String, dynamic>),
        );

        ScheduleCollectionResponse.fromJson(jsonDecode(response.body));

        if (baseResponse.status == null) {
          return ResultError();
        } else if (baseResponse.status?.code != 0) {
          return ResultError(message: baseResponse.status?.message);
        } else if (baseResponse.data == null) {
          return ResultError(message: baseResponse.status?.message);
        } else {
          return ResultSucces(baseResponse.data!.toScheduleData());
        }
      } else {
        return ResultError(message: "");
      }
    } catch (e) {
      print("ERROR IMPL: ${e.toString()}");
      return ResultError(message: e.toString());
    }
  }
}
