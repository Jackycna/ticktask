/* 
   This extension helps to find the email is valid or not
*/

final emailregex = RegExp(r'^[A-Za-z0-9._+-]+@[a-zA-Z0-9.-]+.com');

extension EmailCheckExtension on String {
  bool get isValidEmail => emailregex.hasMatch(this);
}
