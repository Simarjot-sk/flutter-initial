import 'package:built_value/standard_json_plugin.dart';
import 'package:built_value/serializer.dart';
import 'package:zumi_app/data/remote/model/response_dto.dart';
import 'package:zumi_app/data/remote/model/user_dto.dart';
part 'default_serializers.g.dart';

@SerializersFor([ResponseDto, UserDto])
final Serializers serializers =
    (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
