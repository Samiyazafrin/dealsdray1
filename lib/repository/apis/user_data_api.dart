import 'dart:convert';
import 'package:dealsdrayinterview/modle/payload/user.dart';
import 'package:http/http.dart' as http;

class UserController {
  final String baseUrl = 'http://devapiv3.dealsdray.com/api/v2/user/';
  final Map<String, String> headers = {'Content-Type': 'application/json'};

  Future<void> sendOTP({required OTPSendPayload data}) async {
    await _sendRequest(
      method: 'POST',
      endPoint: '${baseUrl}otp',
      body: data.toJson(),
    );
  }

  Future<void> verifyOTP({required VerifySendPayload data}) async {
    await _sendRequest(
      method: 'POST',
      endPoint: '${baseUrl}otp/verification',
      body: data.toJson(),
    );
  }

  Future<void> register({required UserRegisterPayload data}) async {
    await _sendRequest(
      method: 'POST',
      endPoint: '${baseUrl}email/referral',
      body: data.toJson(),
    );
  }

  Future<void> _sendRequest({
    required String method,
    required String endPoint,
    required Map<String, dynamic> body,
  }) async {
    final Uri uri = Uri.parse(endPoint);
    final http.Response response = await http.post(
      uri,
      headers: headers,
      body: json.encode(body),
    );
    if (response.statusCode == 200) {
      print(response.body);
    } else {
      print(response.reasonPhrase);
    }
  }
}
