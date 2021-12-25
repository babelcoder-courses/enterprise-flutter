// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_article.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FavoriteArticleAdapter extends TypeAdapter<FavoriteArticle> {
  @override
  final int typeId = 0;

  @override
  FavoriteArticle read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FavoriteArticle(
      id: fields[0] as int,
      title: fields[1] as String,
      categoryName: fields[2] as String,
      image: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, FavoriteArticle obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.categoryName)
      ..writeByte(3)
      ..write(obj.image);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FavoriteArticleAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
