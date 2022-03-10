// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SettingsModelAdapter extends TypeAdapter<SettingsModel> {
  @override
  final int typeId = 0;

  @override
  SettingsModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SettingsModel(
      firstDayOfTheWeek: fields[0] == null ? 0 : fields[0] as int,
      workingPeriod: fields[1] == null ? 0 : fields[1] as int,
      dailyWorkingHours: fields[2] == null ? 1 : fields[2] as int,
      isFlexibleWorker: fields[3] == null ? false : fields[3] as bool,
      appLanguage: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, SettingsModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.firstDayOfTheWeek)
      ..writeByte(1)
      ..write(obj.workingPeriod)
      ..writeByte(2)
      ..write(obj.dailyWorkingHours)
      ..writeByte(3)
      ..write(obj.isFlexibleWorker)
      ..writeByte(4)
      ..write(obj.appLanguage);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SettingsModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
