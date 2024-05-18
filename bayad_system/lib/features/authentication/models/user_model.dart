import 'package:bayad_system/utils/formatters/formatters.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String id;
  String firstName;
  String lastName;
  final String username;
  final String email;
  String phoneNumber;
  String profilePicture;

  //* Constructor
  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.email,
    required this.phoneNumber,
    required this.profilePicture,
  });

  //* Function to get full name.
  String get fullName => '$firstName $lastName';

  //* Function to format phone number
  String get formattedPhoneNo =>
      CustomFormatters.formatMobileNumber(phoneNumber);

  //* Static function to split full name into first and last name.
  static List<String> nameParts(fullName) => fullName.split(" ");

  //* Static function to generate a username from the full name.
  static String generateUsername(fullName) {
    List<String> nameParts = fullName.split(" ");
    String firstName = nameParts[0].toLowerCase();
    String lastName = nameParts.length > 1 ? nameParts[1].toLowerCase() : "";

    String camelUsername =
        "$firstName$lastName"; //? combine first and last name
    String usernameWithPrefix =
        "tst_$camelUsername"; //? add prefix to the username
    return usernameWithPrefix;
  }

  //* Static function to create an empty user model.
  static UserModel empty() => UserModel(
        id: '',
        firstName: '',
        lastName: '',
        username: '',
        email: '',
        phoneNumber: '',
        profilePicture: '',
      );

  //* Convert model to JSon structure for storing data in Firebase.
  Map<String, dynamic> toJson() => {
        'id': id,
        'firstName': firstName,
        'lastName': lastName,
        'username': username,
        'email': email,
        'phoneNumber': phoneNumber,
        'profilePicture': profilePicture,
      };

  //* Factory method to create a UserModel from a Firebase document snapshot.
  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return UserModel(
        id: document.id,
        firstName: data['firstName'] ?? '',
        lastName: data['lastName'] ?? '',
        username: data['username'] ?? '',
        email: data['email'] ?? '',
        phoneNumber: data['phoneNumber'] ?? '',
        profilePicture: data['profilePicture'] ?? '',
      );
    }
    return UserModel
        .empty(); // Add this line to return a default UserModel if the document data is null.
  }
}
