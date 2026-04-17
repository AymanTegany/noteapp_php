import 'package:noteapp_php/constant/message.dart';

validInput(String val, int min, int max, String type) {
  if (val.isEmpty) {
    return "$messageInputEmpty";
  }

  if (type == "username") {
    if (!RegExp(r"^[a-zA-Z0-9._]+$").hasMatch(val)) {
      return "$messageInvalidUsername";
    }
  }

  if (type == "email") {
    if (!RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$").hasMatch(val)) {
      return "$messageInvalidEmail";
    }
  }

  if (type == "password") {
    // Requires at least one letter and one number
    if (!RegExp(r"^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d!@#$%^&*()_+]{1,}$").hasMatch(val)) {
      return "$messageWeakPassword";
    }
  }

  if (val.length < min) {
    return "$messageInputMin $min";
  }

  if (val.length > max) {
    return "$messageInputMax $max";
  }
}


