library locale;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:contentful.dart/src/models/models.dart';
import 'package:contentful.dart/src/models/serializers/serializers.dart';

part 'locale.g.dart';

abstract class Locale implements Built<Locale, LocaleBuilder> {
  String get code;
  String get name;

  @BuiltValueField(wireName: 'default')
  bool get isDefault;

  @nullable
  String get fallbackCode;

  Sys get sys;

  Locale._();

  factory Locale([updates(LocaleBuilder b)]) = _$Locale;

  String toJson() {
    return json.encode(serializers.serializeWith(Locale.serializer, this));
  }

  static Locale fromJson(String jsonString) {
    return serializers.deserializeWith(
        Locale.serializer, json.decode(jsonString));
  }

  static Serializer<Locale> get serializer => _$localeSerializer;
}