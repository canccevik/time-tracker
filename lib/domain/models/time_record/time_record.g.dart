// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'time_record.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TimeRecordModelAdapter extends TypeAdapter<TimeRecordModel> {
  @override
  final int typeId = 1;

  @override
  TimeRecordModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TimeRecordModel(
      date: fields[0] as DateTime?,
      startDate: fields[1] as DateTime?,
      stopDate: fields[2] as DateTime?,
      totalTimeInMs: fields[3] as int,
      isItOffDay: fields[4] == null ? false : fields[4] as bool,
      status: fields[5] as TimeRecordStatus,
    );
  }

  @override
  void write(BinaryWriter writer, TimeRecordModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.date)
      ..writeByte(1)
      ..write(obj.startDate)
      ..writeByte(2)
      ..write(obj.stopDate)
      ..writeByte(3)
      ..write(obj.totalTimeInMs)
      ..writeByte(4)
      ..write(obj.isItOffDay)
      ..writeByte(5)
      ..write(obj.status);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TimeRecordModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
