// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'time_record_status.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TimeRecordStatusAdapter extends TypeAdapter<TimeRecordStatus> {
  @override
  final int typeId = 2;

  @override
  TimeRecordStatus read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return TimeRecordStatus.initial;
      case 1:
        return TimeRecordStatus.started;
      case 2:
        return TimeRecordStatus.finished;
      default:
        return TimeRecordStatus.initial;
    }
  }

  @override
  void write(BinaryWriter writer, TimeRecordStatus obj) {
    switch (obj) {
      case TimeRecordStatus.initial:
        writer.writeByte(0);
        break;
      case TimeRecordStatus.started:
        writer.writeByte(1);
        break;
      case TimeRecordStatus.finished:
        writer.writeByte(2);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TimeRecordStatusAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
