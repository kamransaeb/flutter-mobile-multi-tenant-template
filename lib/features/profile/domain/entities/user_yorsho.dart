import 'package:yorsho_mobile/core/enums/user_yorsho_account_type.dart';
import 'package:yorsho_mobile/features/profile/data/models/user_yorsho_model.dart';
import 'package:yorsho_mobile/utils/mapper/entity_to_model_mapper.dart';

/// User Yorsho entity
class UserYorsho implements EntityToModelMapper<UserYorshoModel> {
  /// Constructor
  const UserYorsho({
    required this.id,
    required this.uid,
    required this.email,
    required this.userYorshoAccountType,
    required this.enabled,
    required this.profileCompleted,
    required this.languageCode,
    required this.verified,
    required this.forceLogout,
    this.name,
    this.surname,
    this.personalPhoneNumber,
    this.address,
    this.notificationToken,
    this.turkishIdentificationNumber,
    this.profileImageUrl,
    this.dateOfBirth,
    this.gender,
  });

  /// ID
  final int id;

  /// User ID
  final String uid;

  /// Name
  final String? name;

  /// Surname
  final String? surname;

  /// Email
  final String email;

  /// Personal phone number
  final String? personalPhoneNumber;

  /// Address
  final String? address;

  /// User account type
  final UserYorshoAccountType userYorshoAccountType;

  /// Notification token
  final String? notificationToken;

  /// Enabled
  final bool enabled;

  /// Profile completed
  final bool profileCompleted;

  /// Language code
  final String languageCode;

  /// Verified
  final bool verified;

  /// Turkish identification number
  final String? turkishIdentificationNumber;

  /// Force logout
  final bool forceLogout;

  /// Profile image URL
  final String? profileImageUrl;

  /// Date of birth
  final DateTime? dateOfBirth;

  /// Gender
  final int? gender;

  /// To model
  @override
  UserYorshoModel toModel() {
    return UserYorshoModel(
      id: id,
      uid: uid,
      name: name,
      surname: surname,
      email: email,
      userYorshoAccountType: userYorshoAccountType,
      enabled: enabled,
      profileCompleted: profileCompleted,
      languageCode: languageCode,
      verified: verified,
      forceLogout: forceLogout,
      personalPhoneNumber: personalPhoneNumber,
      address: address,
      notificationToken: notificationToken,
      turkishIdentificationNumber: turkishIdentificationNumber,
      profileImageUrl: profileImageUrl,
      dateOfBirth: dateOfBirth,
      gender: gender,
    );
  }
}
