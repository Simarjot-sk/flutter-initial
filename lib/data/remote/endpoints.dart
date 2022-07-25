class Endpoints {
  Endpoints._();

  //base url
  static const baseUrl = 'https://mmfinfotech.co/zumi/api';
  static const authority = 'mmfinfotech.co';
  static const path = 'zumi/api';

  // auth APIs
  static const signIn = 'userLogin';
  static const parentSignUp = 'userSignup';
  static const rvnSignUp = 'rvnSignup';
  static const forgotPasswordRequestOTP = 'forgot';
  static const forgotPasswordVerifyOTP = 'otpvarify';
  static const forgotPasswordResendOTP = 'forgotresendotp';
  static const createNewPassword = 'changePassword';
  static const phoneVerificationRequestOTP = 'phoneVerify';
  static const phoneVerificationResendOTP = 'resendotp';
  static const updateRCVSNumber = 'rcvsRegister';
  static const userDetails = 'profile';

  //sos
  static const getSosContacts = 'soslist';
  static const addSosContacts = 'addsos';
  static const sendLocationSos = 'sendlocation';
}
