
class UserModel{
  final String id;
  String firstName;
  String lastName;
  final String username;
  final String email;
  String phone;
  String profilePicture;

  UserModel({required this.id,required this.firstName ,required this.lastName,required this.username, required this.email,required this.phone,required this.profilePicture});
  String get fullName=>'$firstName $lastName';
  String? Function(String phone) get formattedPhone =>(String phone){
    if(phone.length==11){
      return'(${phone.substring(0,4)}) ${phone.substring(4,7)} ${phone.substring(7)}';
    }
    return null;
  };
  static List<String> nameParts(fullName)=>fullName.split("");

  static String generateUsername(fullName){
    List<String> nameParts=fullName.split("");
    String firstName=nameParts[0].toLowerCase();
    String lastName=nameParts.length>1?nameParts[1].toLowerCase(): "";
    String camelCaseUsername="$firstName$lastName";
    String usernameWithPrefix="cwt_$camelCaseUsername";
    return usernameWithPrefix;
  }

  static UserModel empty()=>UserModel(id: '', firstName: '', lastName: '', username: '', email: '', phone: '', profilePicture: '');

  Map<String,dynamic> toJson(){
    return{
      'FirstName':firstName,
      'LastName':lastName,
      'UserName':username,
      'Email':email,
      'PhoneNumber':phone,
      'ProfilePicture':profilePicture
    };
  }

  /*factory UserModel.fromSnapshot(DocumentSnapshot<Map<String,dynamic>> document){
    if(document.data()!=null){
      final data=document.data()!;
      return UserModel(id: document.id,
          firstName: data['FirstName']??'',
          lastName: data['LastName']??'',
          username: data['UserName']??'',
          email:data['Email']??'',
          phone: data['PhoneNumber']??'',
          profilePicture: data['ProfilePicture']??'',
      );
    }
    return ;
  }*/
}