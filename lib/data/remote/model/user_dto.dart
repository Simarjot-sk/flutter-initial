import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'user_dto.g.dart';

abstract class UserDto implements Built<UserDto, UserDtoBuilder> {
  int get id;

  String get name;

  String get email;

  String? get phone;

  @BuiltValueField(wireName: 'is_adminvarified')
  int? get isAdminVerified;

  String? get latitude;

  @BuiltValueField(wireName: 'longtitude')
  String? get longitude;

  @BuiltValueField(wireName: 'profile_img')
  String? get profileImg;

  String get token;

  @BuiltValueField(wireName: 'user_type')
  int get userType;

  UserDto._();

  static Serializer<UserDto> get serializer => _$userDtoSerializer;

  factory UserDto([void Function(UserDtoBuilder)? updates]) = _$UserDto;
}
