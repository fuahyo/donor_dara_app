// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import 'package:donor_darah/data/model/jadwal_donor/schedule_data_response.dart';
import 'package:donor_darah/domain/model/data/jadwal_donor/schedule_data.dart';
import 'package:donor_darah/domain/model/data/jadwal_donor/schedule_schedule_data.dart';

part 'schedule_collection_response.g.dart';

abstract class ScheduleCollectionResponseMapper {
  ScheduleData toScheduleData();
}

@JsonSerializable()
class ScheduleCollectionResponse implements ScheduleCollectionResponseMapper {
  String? date;
  // List<ScheduleDataResponse>? schedule;
  ScheduleDataResponse? schedule;

  ScheduleCollectionResponse({
    this.date,
    this.schedule,
  });

  factory ScheduleCollectionResponse.fromJson(Map<String, dynamic> json) =>
      _$ScheduleCollectionResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ScheduleCollectionResponseToJson(this);

  @override
  ScheduleData toScheduleData() {
    return ScheduleData(
      date ?? '',
      schedule?.toScheduleScheduleData() ??
          ScheduleScheduleData(
            "",
            "",
            "",
            "",
            "",
            0,
          ),
    );

    // ? Jika Schedule berupa List Array
    // ? jangan lupa flutter pub run build_runner build --delete-conflicting-outputs
    // return ScheduleData(
    //   date ?? "",
    //   schedule?.map((e) => e.toScheduleScheduleData()).toList() ?? List.empty(),
    // );
  }
}
