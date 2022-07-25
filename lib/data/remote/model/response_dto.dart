import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'response_dto.g.dart';

abstract class ResponseDto<DATA>
    implements Built<ResponseDto<DATA>, ResponseDtoBuilder<DATA>> {
  int get status;

  String get message;

  @BuiltValueField(wireName: 'success')
  bool get isSuccessful;

  DATA? get data;

  ResponseDto._();

  static Serializer<ResponseDto> get serializer => _$responseDtoSerializer;

  factory ResponseDto([void Function(ResponseDtoBuilder<DATA>)? updates]) =
      _$ResponseDto<DATA>;
}
