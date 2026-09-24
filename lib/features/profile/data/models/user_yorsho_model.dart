import 'package:json_annotation/json_annotation.dart';
import 'package:yorsho_mobile/core/enums/user_yorsho_account_type.dart';
import 'package:yorsho_mobile/features/profile/domain/entities/user_yorsho.dart';
import 'package:yorsho_mobile/utils/mapper/model_to_entity_mapper.dart';

part 'user_yorsho_model.g.dart';

/// User Yorsho model to JSON
/// Serializable model
@JsonSerializable()
class UserYorshoModel implements ModelToEntityMapper<UserYorsho> {
  /// Constructor
  /// Constructor
  const UserYorshoModel({
    required this.id,
    required this.uid,
    required this.name,
    this.surname,
    required this.email,
    required this.userYorshoAccountType,
    required this.enabled,
    required this.profileCompleted,
    required this.languageCode,
    required this.verified,
    required this.forceLogout,
    this.personalPhoneNumber,
    this.address,
    this.notificationToken,
    this.turkishIdentificationNumber,
    this.profileImageUrl,
    this.dateOfBirth,
    this.gender,
  });

  /// JSON constructor
  factory UserYorshoModel.fromJson(Map<String, dynamic> json) =>
      _$UserYorshoModelFromJson(json);

  /// To JSON
  Map<String, dynamic> toJson() => _$UserYorshoModelToJson(this);

  /// To entity
  @override
  UserYorsho toEntity() => UserYorsho(
    id: id,
    uid: uid,
    name: name,
    surname: surname,
    email: email,
    personalPhoneNumber: personalPhoneNumber,
    verified: verified,
    forceLogout: forceLogout,
    address: address,
    userYorshoAccountType: userYorshoAccountType,
    notificationToken: notificationToken,
    enabled: enabled,
    profileCompleted: profileCompleted,
    languageCode: languageCode,
    turkishIdentificationNumber: turkishIdentificationNumber,
    profileImageUrl: profileImageUrl,
    dateOfBirth: dateOfBirth,
    gender: gender,
  );

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
}
