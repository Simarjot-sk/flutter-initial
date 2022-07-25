import 'package:zumi_app/data/local/shared_pref_helper.dart';
import 'package:zumi_app/data/remote/endpoints.dart';
import 'package:zumi_app/data/remote/model/response_dto.dart';
import 'package:zumi_app/data/remote/model/user_dto.dart';
import 'package:zumi_app/data/remote/networking.dart';
import 'package:zumi_app/ui/utils/app_constants.dart';

class AuthRepo {
  ///in memory cache of user
  static UserDto? _userCache;

  static Future<ResponseDto<UserDto>> signIn(
    final String email,
    final String password,
  ) async {
    final requestBody = <String, String>{
      "email": email,
      "password": password,
      "fcm_token": "TEMP_FCM_TOKEN"
    };

    //calling the REST API
    final ResponseDto<UserDto> responseDto = await httpPost<UserDto>(
      Endpoints.signIn,
      requestBody,
    );

    if (responseDto.isSuccessful) {
      _setInitialUserData(responseDto.data!);
    }
    return responseDto;
  }

  static Future<ResponseDto<UserDto>> signUP(
    final String name,
    final String email,
    final String password,
  ) async {
    final requestBody = <String, String>{
      "name": name,
      "email": email,
      "password": password,
      "fcm_token": "TEMP_FCM_TOKEN",
      "latitude": "", //todo fetch user location
      "longitude": ""
    };

    final ResponseDto<UserDto> responseDto = await httpPost<UserDto>(
      Endpoints.rvnSignUp,
      requestBody,
    );
    if (responseDto.isSuccessful) {
      _setInitialUserData(responseDto.data!);
    }
    return responseDto;
  }

  static void _setInitialUserData(final UserDto userDto) {
    Prefs.userId.set(userDto.id);
    Prefs.authToken.set(userDto.token);
    Prefs.isLoggedIn.set(true);
    _userCache = userDto;
  }

  ///returns user details, if cached instance of user details is found, then that is returned,
  ///otherwise an api call is made to load user details.
  ///can return null in case of failure.
  static Future<UserDto?> getUserDetails({bool forceRefresh = false}) async {
    if (_userCache == null || forceRefresh) {
      final requestBody = {"token": Prefs.authToken.get()};

      final response = await httpPost<UserDto>(
        Endpoints.userDetails,
        requestBody,
      );
      if (response.isSuccessful) {
        final userData = response.data!;
        _setInitialUserData(userData);
        return userData;
      }
      return null;
    } else {
      return _userCache;
    }
  }

  static Future<ResponseDto> resendOTP(final String phone) {
    final requestBody = {
      "phone": phone,
      "userId": Prefs.userId.get(),
    };
    return httpPost<UserDto>(Endpoints.phoneVerificationResendOTP, requestBody);
  }

  static void logout() {
    _userCache = null;
    Prefs.clear();
  }
}
