class ApiEndPoints {
  static const customerSupportNumber = "+919667888199";
  static const baseUrl = 'https://cpaas-staging.messagecentral.com/';
  static const login = 'user/v2/user/login/otp';
  static const signup = 'user/v2/user/createAccount';
  static const countries = '/user/v1.0/user/countries';
  static const otp = 'user/v2/user/signup/otp';
  static const validateOtp = 'user/v2/user/signup/validate';
  static const getUserDetails = 'user/v2/user/getUserDetails';
  static const resendOtp = 'user/v1.0/user/resend/otp';

  //Dashboard API Start
  static const analyticsVerifyNowCallOtpApi = 'reports/v1.0/analytics/otp';
  static const analyticsVerifyNowCallSmsApi =
      'reports/v1.0/analytics/otp?type=SMS';
  //Dashboard API End

  //Verify A user API Start
  static const verifyAUserApi = 'verification/v3/send';
  static const verifyAUserOtpVerificationApi = 'verification/v3/validateOtp';
  static const verifyAUserUpdateBrandNameApi =
      'user/v1.0/user/editBrandName'; //PUT API params brandName,customerId,authToken

  static const findByCustomerId = 'user/v1.0/user/findByCustomerId';

  static const walletCreditsBalance = 'wallet/credits/balance';
  //Verify A user API End

  //Send A SMS Start
  static const sendASmsApi = 'verification/v3/send';
//Send A SMS End

  static const forgetpasswordemail =
      'user/v2/user/forgetPassword/otp'; // prms only email for confirm button
  static const forgetpasswordOtp =
      'user/v1.0/user/resetPassword/validate'; // prms - 'code': otp,'email': email, 'verificationId': verificationId,

  static const resetpassword = "user/v1.0/user/resetPassword";
  static const countryCode = "user/v1.0/user/countries";
  static const String stripPayment = 'wallet/credits/initiatePayment';
  static const String updatePhoneOtp = "user/v1.0/user/updatePhone/otp";
  static const String updatePhone = "user/v1.0/user/updatePhone";
  static const String updatePassword = 'user/v1.0/user/updatePassword';
  static const String updateUserAccount = 'user/v1.0/user/update';
  static const String paymentHistory = 'wallet/credits/purchased/history';
  static const String lowBalance =
      'core/v1.0/notification/getLowBalanceAlertDetail';
  static const String savelowBalanceAlertDetail =
      'core/v1.0/notification/saveLowBalanceAlertDetail';
  static const analytics = 'reports/v1.0/analytics/otp';
  static const checkoffereligibility = 'user/v1/offers/checkOfferEligibility';
  static const checkOffer = 'user/v1/offers/checkForOffers';
  static const detailsReporting = 'reports/getDetailedReports';
  static const downloadDetailReporting = 'reports/downloadDetailReporting';

  static const searchDetailedReporting = 'reports/searchDetailedReporting';

  /// ragister api

  static const steponeRegisterSaveAPi = 'verification/v1.1/register/saveDemo';
  static const steponeRegisterGetdemo = 'verification/v1.1/register/getDemo';
}

class AppUrl {
  static const String termNCond = "core/apiDocument/termsAndConditions";
  static const String privacyPolicy = "core/apiDocument/privacyPolicy";
  static const String userPolicy = "core/apiDocument/usePolicy";
  static const String verifyNowApiDoc = "core/apiDocument/verifyNow";
}
