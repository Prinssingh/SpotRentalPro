
import 'dart:convert';
import 'dart:typed_data';

class UserDataModel {
  final int ?  id;
  final String firstName;
  final String lastName;
  final String gender;
  final String address;
  final String mobile;
  final String email;
  final Uint8List? photo ;

   const UserDataModel( {this.id, required this.firstName,  required this.lastName, required this.gender, required this.address, required this.mobile, required this.email,this.photo});

  static final columns = ["id", "first_name", "last_name", "gender", "address","mobile", "photo"];

  factory UserDataModel.fromMap(Map<String, dynamic> data) {
    print(data["id"]);
    print(data["id"].runtimeType);

    return UserDataModel(
      id :0,
      firstName: data["first_name"],
      lastName :data["last_name"],
      gender: data["gender"],
      address: data["address"],
      mobile : data["mobile"],
      email: data["email"],
      photo:data["photo"],
    );
  }

  Map<String, dynamic> toMap() => {
    "id": id,
    "first_name": firstName,
    "last_name": lastName,
    "gender": gender,
    "address": address,
    "email": email,
    "mobile": mobile,
    "photo": photo
  };

  String toJson() => json.encode(toMap());

  factory UserDataModel.fromJson(String source) => UserDataModel.fromMap(json.decode(source));


  @override
  String toString() {
    return 'UserDataModel(id: $id, first_name: $firstName, last_name :$lastName, gender:$gender, address:$address, mobile: $mobile, email :$email, photo :$photo)';
  }

  // Getter Functions
  String get getfirstName {
    return firstName;
  }

  String get getLastName{
    return lastName;
  }

  String getFullName(){
    return "$firstName $lastName";
  }

  String get getGender{
    return gender;
  }

  String get getMobileNo{
    return mobile;
  }

  String get getEmailAddress{ return email;}

  String get getAddress{
    return address;
  }










}