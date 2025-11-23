// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError('');

AppUser _$AppUserFromJson(Map<String, dynamic> json) {
  return _AppUser.fromJson(json);
}

mixin _$AppUser {
  String get id => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get photoUrl => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;
  String get theme => throw _privateConstructorUsedError;
  bool get notifications => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

class _$AppUserImpl implements _AppUser {
  const _$AppUserImpl({
    required this.id,
    required this.email,
    this.name,
    this.photoUrl,
    this.currency = 'USD',
    this.theme = 'light',
    this.notifications = true,
    required this.createdAt,
  });

  factory _$AppUserImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppUserImplFromJson(json);

  @override
  final String id;
  @override
  final String email;
  @override
  final String? name;
  @override
  final String? photoUrl;
  @override
  final String currency;
  @override
  final String theme;
  @override
  final bool notifications;
  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'AppUser(id: $id, email: $email, name: $name, photoUrl: $photoUrl, currency: $currency, theme: $theme, notifications: $notifications, createdAt: $createdAt)';
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$AppUserImplToJson(this);
  }
}
