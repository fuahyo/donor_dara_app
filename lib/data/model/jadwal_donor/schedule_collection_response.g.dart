// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_collection_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ScheduleCollectionResponse _$ScheduleCollectionResponseFromJson(
        Map<String, dynamic> json) =>
    ScheduleCollectionResponse(
      date: json['date'] as String?,
      schedule: json['schedule'] == null
          ? null
          : ScheduleDataResponse.fromJson(
              json['schedule'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ScheduleCollectionResponseToJson(
        ScheduleCollectionResponse instance) =>
    <String, dynamic>{
      'date': instance.date,
      'schedule': instance.schedule,
    };
