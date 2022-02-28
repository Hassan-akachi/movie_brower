// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_title_result.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SearchTitleResultAdapter extends TypeAdapter<SearchTitleResult> {
  @override
  final int typeId = 3;

  @override
  SearchTitleResult read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SearchTitleResult(
      title: fields[0] as String?,
      page: fields[1] as int?,
      found: fields[2] as bool?,
      totalResultFound: fields[3] as int?,
      movieSummary: (fields[4] as List?)?.cast<MovieSummary>(),
    );
  }

  @override
  void write(BinaryWriter writer, SearchTitleResult obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.page)
      ..writeByte(2)
      ..write(obj.found)
      ..writeByte(3)
      ..write(obj.totalResultFound)
      ..writeByte(4)
      ..write(obj.movieSummary);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SearchTitleResultAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
