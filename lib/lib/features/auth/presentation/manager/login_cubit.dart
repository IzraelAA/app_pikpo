import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:crypto/crypto.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

// Define the states
part 'login_state.dart';

@Injectable()
class LoginCubit extends Cubit<LoginState> {
  String liveKitUrl = "wss://pikpo-o48lbrwn.livekit.cloud";
  String apiKey = "APIB4vTtN4WrRzt";
  String apiSecret = "XwmJyHacGNHQy92vCipVeuD00YcaAF7YSmRi0whCOhN";

  LoginCubit() : super(LoginInitial());

  void init(
      {required String setLiveKitUrl,
      required String setApiKey,
      required String setApiSecret}) {
    liveKitUrl = setLiveKitUrl;
    apiKey = setApiKey;
    apiSecret = setApiSecret;
  }

  String generateToken(String roomName, String identity) {
    final claims = {
      'iss': apiKey,
      'sub': identity,
      'exp': DateTime.now().millisecondsSinceEpoch ~/ 1000 +
          24 * 60 * 60, // Token expiry
      'nbf': DateTime.now().millisecondsSinceEpoch ~/ 1000,
      'video': {
        'aud': roomName,
        'room': roomName,
        'room_join': true,
        'room_admin': false,
        'can_publish': true,
        'can_subscribe': true,
      }
    };

    final hmac = Hmac(sha256, utf8.encode(apiSecret));
    final header = jsonEncode({'alg': 'HS256', 'typ': 'JWT'});
    final payload = jsonEncode(claims);

    final base64Header = base64UrlEncode(utf8.encode(header));
    final base64Payload = base64UrlEncode(utf8.encode(payload));
    final signature = base64UrlEncode(
        hmac.convert(utf8.encode('$base64Header.$base64Payload')).bytes);

    return '$base64Header.$base64Payload.$signature';
  }

  void connectToRoom(String roomName, String identity) {
    if (identity.isEmpty) {
      emit(const LoginError("Username is required"));
      return;
    }
    final token = identity == "panca"
        ? "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MzAxOTQyNDYsImlzcyI6IkFQSUI0dlR0TjRXclJ6dCIsIm5iZiI6MTczMDE3MjY0Niwic3ViIjoicGFuY2EiLCJ2aWRlbyI6eyJjYW5QdWJsaXNoIjp0cnVlLCJjYW5QdWJsaXNoRGF0YSI6dHJ1ZSwiY2FuU3Vic2NyaWJlIjp0cnVlLCJyb29tIjoib25lLW9uLW9uZS1yb29tIiwicm9vbUpvaW4iOnRydWV9fQ.lYD9YBnBylu8CZLEKDgHupcQGm-YCCZE4tOLRbqGLzY"
        : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MzAxOTQzNjMsImlzcyI6IkFQSUI0dlR0TjRXclJ6dCIsIm5iZiI6MTczMDE3Mjc2Mywic3ViIjoiZXJ5biIsInZpZGVvIjp7ImNhblB1Ymxpc2giOnRydWUsImNhblB1Ymxpc2hEYXRhIjp0cnVlLCJjYW5TdWJzY3JpYmUiOnRydWUsInJvb20iOiJvbmUtb24tb25lLXJvb20iLCJyb29tSm9pbiI6dHJ1ZX19.vwVY7YsA8LC536Tf_GfGMlsGPAdDkUDqGHULIZkH2aw";
    emit(LoginSuccess(liveKitUrl, token));
  }
}
