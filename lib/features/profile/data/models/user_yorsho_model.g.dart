// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_yorsho_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserYorshoModel _$UserYorshoModelFromJson(
  Map<String, dynamic> json,
) => UserYorshoModel(
  id: (json['id'] as num).toInt(),
  uid: json['uid'] as String,
  name: json['name'] as String?,
  surname: json['surname'] as String?,
  email: json['email'] as String,
  userYorshoAccountType: $enumDecode(
    _$UserYorshoAccountTypeEnumMap,
    json['userYorshoAccountType'],
  ),
  enabled: json['enabled'] as bool,
  profileCompleted: json['profileCompleted'] as bool,
  languageCode: json['languageCode'] as String,
  verified: json['verified'] as bool,
  forceLogout: json['forceLogout'] as bool,
  personalPhoneNumber: json['personalPhoneNumber'] as String?,
  address: json['address'] as String?,
  notificationToken: json['notificationToken'] as String?,
  turkishIdentificationNumber: json['turkishIdentificationNumber'] as String?,
  profileImageUrl: json['profileImageUrl'] as String?,
  dateOfBirth: json['dateOfBirth'] == null
      ? null
      : DateTime.parse(json['dateOfBirth'] as String),
  gender: (json['gender'] as num?)?.toInt(),
);

Map<String, dynamic> _$UserYorshoModelToJson(
  UserYorshoModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'uid': instance.uid,
  'name': instance.name,
  'surname': instance.surname,
  'email': instance.email,
  'personalPhoneNumber': instance.personalPhoneNumber,
  'address': instance.address,
  'userYorshoAccountType':
      _$UserYorshoAccountTypeEnumMap[instance
          .userYorshoAccountType]!,
  'notificationToken': instance.notificationToken,
  'enabled': instance.enabled,
  'profileCompleted': instance.profileCompleted,
  'languageCode': instance.languageCode,
  'verified': instance.verified,
  'turkishIdentificationNumber': instance.turkishIdentificationNumber,
  'forceLogout': instance.forceLogout,
  'profileImageUrl': instance.profileImageUrl,
  'dateOfBirth': instance.dateOfBirth?.toIso8601String(),
  'gender': instance.gender,
};

const _$UserYorshoAccountTypeEnumMap = {
  UserYorshoAccountType.admin: 0,
  UserYorshoAccountType.user: 1,
};
