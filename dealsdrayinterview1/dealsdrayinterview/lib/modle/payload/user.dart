class OTPSendPayload {
  String? mobileNumber;
  String? deviceId;

  OTPSendPayload({this.mobileNumber, this.deviceId});

  OTPSendPayload.fromJson(Map<String, dynamic> json) {
    mobileNumber = json['mobileNumber'];
    deviceId = json['deviceId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mobileNumber'] = mobileNumber;
    data['deviceId'] = deviceId;
    return data;
  }
}

class VerifySendPayload {
  String? otp;
  String? deviceId;
  String? userId;

  VerifySendPayload({this.otp, this.deviceId, this.userId});

  VerifySendPayload.fromJson(Map<String, dynamic> json) {
    otp = json['otp'];
    deviceId = json['deviceId'];
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['otp'] = otp;
    data['deviceId'] = deviceId;
    data['userId'] = userId;
    return data;
  }
}


class UserRegisterPayload {
  String? email;
  String? password;
  int? referralCode;
  String? userId;

  UserRegisterPayload(
      {this.email, this.password, this.referralCode, this.userId});

  UserRegisterPayload.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
    referralCode = json['referralCode'];
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['password'] = this.password;
    data['referralCode'] = this.referralCode;
    data['userId'] = this.userId;
    return data;
  }
}
