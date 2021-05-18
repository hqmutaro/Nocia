import 'package:firebase_auth/firebase_auth.dart';

enum FirebaseAuthResultStatus {
  InvalidEmail,
  WrongPassword,
  UserNotFound,
  UserDisabled,
  TooManyRequests,
  OperationNotAllowed,
  EmailAlreadyExists,
  Undefined
}

class FirebaseAuthExceptionHandler {
  static FirebaseAuthResultStatus handleException(FirebaseAuthException e) {
    FirebaseAuthResultStatus result;
    switch (e.code) {
      case 'invalid-email':
        result = FirebaseAuthResultStatus.InvalidEmail;
        break;

      case 'wrong-password':
        result = FirebaseAuthResultStatus.WrongPassword;
        break;

      case 'user-not-found':
        result = FirebaseAuthResultStatus.UserNotFound;
        break;

      case 'user-disabled':
        result = FirebaseAuthResultStatus.UserDisabled;
        break;

      case 'too-many-requests':
        result = FirebaseAuthResultStatus.TooManyRequests;
        break;

      case 'operation-not-allowed':
        result = FirebaseAuthResultStatus.OperationNotAllowed;
        break;

      case 'email-already-in-use':
        result = FirebaseAuthResultStatus.EmailAlreadyExists;
        break;

      default:
        result = FirebaseAuthResultStatus.Undefined;
        break;
    }
    return result;
  }

  static String exceptionMessage(FirebaseAuthResultStatus result) {
    String message = '';
    switch (result) {
      case FirebaseAuthResultStatus.InvalidEmail:
        message = 'メールアドレスが間違っています。';
        break;

      case FirebaseAuthResultStatus.WrongPassword:
        message = 'パスワードが間違っています。';
        break;

      case FirebaseAuthResultStatus.UserNotFound:
        message = 'このアカウントは存在しません。';
        break;

      case FirebaseAuthResultStatus.UserDisabled:
        message = 'このメールアドレスは無効になっています。';
        break;

      case FirebaseAuthResultStatus.TooManyRequests:
        message = '回線が混雑しています。もう一度試してみてください。';
        break;

      case FirebaseAuthResultStatus.OperationNotAllowed:
        message = 'メールアドレスとパスワードでのログインは有効になっていません。';
        break;

      case FirebaseAuthResultStatus.EmailAlreadyExists:
        message = 'このメールアドレスはすでに登録されています。';
        break;

      default:
        message = '予期せぬエラーが発生しました。';
        break;
    }
    return message;
  }
}