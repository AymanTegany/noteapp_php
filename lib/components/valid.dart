import 'package:noteapp_php/constant/message.dart';

String? validInput(String val, int min, int max, String type) {
  if (val.isEmpty) return messageInputEmpty;

  if (val.length < min) return "$messageInputMin $min";
  if (val.length > max) return "$messageInputMax $max";

  if (type == "username" &&
      val.length > 20 &&
      val.length < 3 &&
      val.contains(" ")) {
    return messageInvalidUsername;
  }

  if (type == "email" && !RegExp(r"^[^@]+@[^@]+\.[^@]+$").hasMatch(val)) {
    return messageInvalidEmail;
  }

  if (type == "password" && val.length < 5) {
    return messageWeakPassword;
  }

  return null;
}
