import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:zumi_app/data/remote/model/default_serializers.dart';
import 'package:zumi_app/data/remote/model/response_dto.dart';

///Parses a jsonEncoded string to an object of type ResponseDto<T>.
///T can be any built_value class with serializer defined with [Serializers]
ResponseDto<T> parseResponseDto<T>(dynamic jsonString) {
  final specifiedType = FullType(ResponseDto, [FullType(T)]);
  final serializersWithBuilder = (serializers.toBuilder()
        ..addBuilderFactory(specifiedType, ResponseDtoBuilder<T>.new))
      .build();
  final result = serializersWithBuilder.deserialize(
    jsonString,
    specifiedType: specifiedType,
  );
  return result as ResponseDto<T>;
}

///similar to [parseResponseDto], but should be used in special case when
///`data` field in the response is a List, instead of a json object
ResponseDto<BuiltList<T>> parseResponseList<T>(dynamic jsonString) {
  final specifiedType = FullType(ResponseDto, [
    FullType(BuiltList, [FullType(T)])
  ]);
  final serializersWithBuilder = (serializers.toBuilder()
        ..addBuilderFactory(
            FullType(BuiltList, [FullType(T)]), ListBuilder<T>.new)
        ..addBuilderFactory(
            specifiedType, ResponseDtoBuilder<BuiltList<T>>.new))
      .build();
  final result = serializersWithBuilder.deserialize(
    jsonString,
    specifiedType: specifiedType,
  );
  return result as ResponseDto<BuiltList<T>>;
}
