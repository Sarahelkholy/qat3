class Validator{

  static String? validateEmptyText(String? fieldname,String?value){
    if(value==null||value.isEmpty){
      return'$fieldname is required.';
    }
    return null;
  }
  static String? validateEmail(String? value ){
    if(value==null||value.isEmpty){
      return 'Email is required.';
    }
    final emailRegExp=RegExp(r'^[\w-]+@([\w-]+\.)+[\w-]{2,4}$');
    if(!emailRegExp.hasMatch(value)){
      return'Invalid email address.';
    }
    return null;

  }
  static String? validatePassword(String?value){
    if(value==null||value.isEmpty){
      return'Password is required.';
    }
    if(value.length<6){
      return'Password must be at least 6 characters long.';
    }
    if(!value.contains(RegExp(r'^[A-Z]'))){
      return'Password must contain at least one uppercase letter.';
    }
    if(!value.contains(RegExp(r'[0-9]'))){
      return'Password must contain at least one number.';
    }
    return null;
  }
  static String? validateCard(String?value){
    if(value==null||value.isEmpty){
      return'Card number is required.';
    }
    final cardRegExp=RegExp(r'^\d{16}$');
    if(!cardRegExp.hasMatch(value)){
      return'Invalid card number.';
    }
    return null;
  }
  static String? validatePhone(String? value){
    if(value==null||value.isEmpty){
      return'Phone number is required.';
    }
    final PhoneRegExp=RegExp(r'^\d{11}$');
    if(!PhoneRegExp.hasMatch(value)){
      return'Invalid phone number.';
    }
    return null;
  }

}