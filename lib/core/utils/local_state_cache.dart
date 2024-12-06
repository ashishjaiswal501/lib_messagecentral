import 'package:shared_preferences/shared_preferences.dart';

class LocalStateCache {
  static LocalStateCache _instance = LocalStateCache._internal();

  factory LocalStateCache() {
    return _instance;
  }

  LocalStateCache._internal();

  static void reset() {
    _instance = LocalStateCache._internal();
  }

  late SharedPreferences prefs;
  Future createCache() => initializePersistedState();
  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _authToken = prefs.getString('authToken') ?? _authToken;
      _customerId = prefs.getString('customerId') ?? _customerId;
      _balance = prefs.getString('balance') ?? _balance;
      _phoneNo = prefs.getString('phoneNo') ?? _phoneNo;
      _countryCode = prefs.getString('countryCode') ?? _countryCode;
      _isVerificationOtp = prefs.getBool('verifyotp') ?? false;
      _paymentStatus = prefs.getString('payment') ?? _paymentStatus;
      _fName = prefs.getString('ff_fName') ?? _fName;
      _lName = prefs.getString('ff_lName') ?? _lName;
      _emailId = prefs.getString('ff_email') ?? _emailId;
      _isInitialStepSignup = prefs.getBool('initialSignup') ?? false;
      _brandName = prefs.getString('brandName') ?? _brandName;
      _verificationId = prefs.getString('verificationId') ?? _verificationId;
      _routeIndex = prefs.getInt('routeindex') ?? _routeIndex;
    });
  }

  void clearChache() async {
    setAuthToken = '';
    customerId = '';
    phoneNo = '';
    setpaymentStatus = '';
    setBalance = '';
    isVerificationOtp = false;
    setisInitialStepSignup = false;
    prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  String _authToken = '';
  String get authToken => _authToken;
  set setAuthToken(String value) {
    _authToken = value;
    prefs.setString('authToken', value);
  }

  String _paymentStatus = '';
  String get paymentStatus => _paymentStatus;
  set setpaymentStatus(String value) {
    _paymentStatus = value;
    prefs.setString('payment', value);
  }

  String _balance = '';
  String get balance => _balance;
  set setBalance(String value) {
    _balance = value;
    prefs.setString('balance', value);
  }

  String _customerId = '';
  String get customerId => _customerId;
  set customerId(String value) {
    _customerId = value;
    prefs.setString('customerId', value);
  }

  String _phoneNo = '';
  String get phoneNo => _phoneNo;
  set phoneNo(String value) {
    _phoneNo = value;
    prefs.setString('phoneNo', value);
  }

  String _countryCode = '';
  String get countryCode => _countryCode;
  set countryCode(String value) {
    _countryCode = value;
    prefs.setString('countryCode', value);
  }

  bool _isVerificationOtp = false;
  bool get isVerificationOtp => _isVerificationOtp;
  set isVerificationOtp(bool value) {
    _isVerificationOtp = value;
    prefs.setBool('verifyotp', value);
  }

  bool _isInitialStepSignup = false;
  bool get isInitialStepSignup => _isInitialStepSignup;
  set setisInitialStepSignup(bool value) {
    _isInitialStepSignup = value;
    prefs.setBool('initialSignup', value);
  }

  String _fName = '';
  String get fName => _fName;
  set fName(String value) {
    _fName = value;
    prefs.setString('ff_fName', value);
  }

  String _lName = '';
  String get lName => _lName;
  set lName(String value) {
    _lName = value;
    prefs.setString('ff_lName', value);
  }

  String _emailId = '';
  String get email => _emailId;
  set emailId(String value) {
    _emailId = value;
  }

  String _brandName = '';
  String get brandName => _brandName;
  set setBrandName(String value) {
    _brandName = value;
    prefs.setString('brandName', _brandName);
  }

  String _verificationId = '';
  String get verificationId => _verificationId;
  set setVerificationId(String value) {
    _verificationId = value;
    prefs.setString('verificationId', _verificationId);
  }

  int _routeIndex = 0;
  int get routeIndex => _routeIndex;
  set setrouteIndex(int value) {
    _routeIndex = value;
    prefs.setInt('routeindex', _routeIndex);
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}
