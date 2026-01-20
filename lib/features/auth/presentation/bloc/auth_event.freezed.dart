// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$AuthEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, String password) signInRequested,
    required TResult Function() signOutRequested,
    required TResult Function() authStatusChecked,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email, String password)? signInRequested,
    TResult? Function()? signOutRequested,
    TResult? Function()? authStatusChecked,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String password)? signInRequested,
    TResult Function()? signOutRequested,
    TResult Function()? authStatusChecked,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SignInRequested value) signInRequested,
    required TResult Function(SignOutRequested value) signOutRequested,
    required TResult Function(AuthStatusChecked value) authStatusChecked,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SignInRequested value)? signInRequested,
    TResult? Function(SignOutRequested value)? signOutRequested,
    TResult? Function(AuthStatusChecked value)? authStatusChecked,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SignInRequested value)? signInRequested,
    TResult Function(SignOutRequested value)? signOutRequested,
    TResult Function(AuthStatusChecked value)? authStatusChecked,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthEventCopyWith<$Res> {
  factory $AuthEventCopyWith(AuthEvent value, $Res Function(AuthEvent) then) =
      _$AuthEventCopyWithImpl<$Res, AuthEvent>;
}

/// @nodoc
class _$AuthEventCopyWithImpl<$Res, $Val extends AuthEvent>
    implements $AuthEventCopyWith<$Res> {
  _$AuthEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$SignInRequestedImplCopyWith<$Res> {
  factory _$$SignInRequestedImplCopyWith(
    _$SignInRequestedImpl value,
    $Res Function(_$SignInRequestedImpl) then,
  ) = __$$SignInRequestedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String email, String password});
}

/// @nodoc
class __$$SignInRequestedImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$SignInRequestedImpl>
    implements _$$SignInRequestedImplCopyWith<$Res> {
  __$$SignInRequestedImplCopyWithImpl(
    _$SignInRequestedImpl _value,
    $Res Function(_$SignInRequestedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? email = null, Object? password = null}) {
    return _then(
      _$SignInRequestedImpl(
        email: null == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String,
        password: null == password
            ? _value.password
            : password // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$SignInRequestedImpl implements SignInRequested {
  const _$SignInRequestedImpl({required this.email, required this.password});

  @override
  final String email;
  @override
  final String password;

  @override
  String toString() {
    return 'AuthEvent.signInRequested(email: $email, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignInRequestedImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email, password);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SignInRequestedImplCopyWith<_$SignInRequestedImpl> get copyWith =>
      __$$SignInRequestedImplCopyWithImpl<_$SignInRequestedImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, String password) signInRequested,
    required TResult Function() signOutRequested,
    required TResult Function() authStatusChecked,
  }) {
    return signInRequested(email, password);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email, String password)? signInRequested,
    TResult? Function()? signOutRequested,
    TResult? Function()? authStatusChecked,
  }) {
    return signInRequested?.call(email, password);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String password)? signInRequested,
    TResult Function()? signOutRequested,
    TResult Function()? authStatusChecked,
    required TResult orElse(),
  }) {
    if (signInRequested != null) {
      return signInRequested(email, password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SignInRequested value) signInRequested,
    required TResult Function(SignOutRequested value) signOutRequested,
    required TResult Function(AuthStatusChecked value) authStatusChecked,
  }) {
    return signInRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SignInRequested value)? signInRequested,
    TResult? Function(SignOutRequested value)? signOutRequested,
    TResult? Function(AuthStatusChecked value)? authStatusChecked,
  }) {
    return signInRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SignInRequested value)? signInRequested,
    TResult Function(SignOutRequested value)? signOutRequested,
    TResult Function(AuthStatusChecked value)? authStatusChecked,
    required TResult orElse(),
  }) {
    if (signInRequested != null) {
      return signInRequested(this);
    }
    return orElse();
  }
}

abstract class SignInRequested implements AuthEvent {
  const factory SignInRequested({
    required final String email,
    required final String password,
  }) = _$SignInRequestedImpl;

  String get email;
  String get password;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SignInRequestedImplCopyWith<_$SignInRequestedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SignOutRequestedImplCopyWith<$Res> {
  factory _$$SignOutRequestedImplCopyWith(
    _$SignOutRequestedImpl value,
    $Res Function(_$SignOutRequestedImpl) then,
  ) = __$$SignOutRequestedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SignOutRequestedImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$SignOutRequestedImpl>
    implements _$$SignOutRequestedImplCopyWith<$Res> {
  __$$SignOutRequestedImplCopyWithImpl(
    _$SignOutRequestedImpl _value,
    $Res Function(_$SignOutRequestedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SignOutRequestedImpl implements SignOutRequested {
  const _$SignOutRequestedImpl();

  @override
  String toString() {
    return 'AuthEvent.signOutRequested()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SignOutRequestedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, String password) signInRequested,
    required TResult Function() signOutRequested,
    required TResult Function() authStatusChecked,
  }) {
    return signOutRequested();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email, String password)? signInRequested,
    TResult? Function()? signOutRequested,
    TResult? Function()? authStatusChecked,
  }) {
    return signOutRequested?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String password)? signInRequested,
    TResult Function()? signOutRequested,
    TResult Function()? authStatusChecked,
    required TResult orElse(),
  }) {
    if (signOutRequested != null) {
      return signOutRequested();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SignInRequested value) signInRequested,
    required TResult Function(SignOutRequested value) signOutRequested,
    required TResult Function(AuthStatusChecked value) authStatusChecked,
  }) {
    return signOutRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SignInRequested value)? signInRequested,
    TResult? Function(SignOutRequested value)? signOutRequested,
    TResult? Function(AuthStatusChecked value)? authStatusChecked,
  }) {
    return signOutRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SignInRequested value)? signInRequested,
    TResult Function(SignOutRequested value)? signOutRequested,
    TResult Function(AuthStatusChecked value)? authStatusChecked,
    required TResult orElse(),
  }) {
    if (signOutRequested != null) {
      return signOutRequested(this);
    }
    return orElse();
  }
}

abstract class SignOutRequested implements AuthEvent {
  const factory SignOutRequested() = _$SignOutRequestedImpl;
}

/// @nodoc
abstract class _$$AuthStatusCheckedImplCopyWith<$Res> {
  factory _$$AuthStatusCheckedImplCopyWith(
    _$AuthStatusCheckedImpl value,
    $Res Function(_$AuthStatusCheckedImpl) then,
  ) = __$$AuthStatusCheckedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthStatusCheckedImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$AuthStatusCheckedImpl>
    implements _$$AuthStatusCheckedImplCopyWith<$Res> {
  __$$AuthStatusCheckedImplCopyWithImpl(
    _$AuthStatusCheckedImpl _value,
    $Res Function(_$AuthStatusCheckedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$AuthStatusCheckedImpl implements AuthStatusChecked {
  const _$AuthStatusCheckedImpl();

  @override
  String toString() {
    return 'AuthEvent.authStatusChecked()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AuthStatusCheckedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, String password) signInRequested,
    required TResult Function() signOutRequested,
    required TResult Function() authStatusChecked,
  }) {
    return authStatusChecked();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email, String password)? signInRequested,
    TResult? Function()? signOutRequested,
    TResult? Function()? authStatusChecked,
  }) {
    return authStatusChecked?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String password)? signInRequested,
    TResult Function()? signOutRequested,
    TResult Function()? authStatusChecked,
    required TResult orElse(),
  }) {
    if (authStatusChecked != null) {
      return authStatusChecked();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SignInRequested value) signInRequested,
    required TResult Function(SignOutRequested value) signOutRequested,
    required TResult Function(AuthStatusChecked value) authStatusChecked,
  }) {
    return authStatusChecked(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SignInRequested value)? signInRequested,
    TResult? Function(SignOutRequested value)? signOutRequested,
    TResult? Function(AuthStatusChecked value)? authStatusChecked,
  }) {
    return authStatusChecked?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SignInRequested value)? signInRequested,
    TResult Function(SignOutRequested value)? signOutRequested,
    TResult Function(AuthStatusChecked value)? authStatusChecked,
    required TResult orElse(),
  }) {
    if (authStatusChecked != null) {
      return authStatusChecked(this);
    }
    return orElse();
  }
}

abstract class AuthStatusChecked implements AuthEvent {
  const factory AuthStatusChecked() = _$AuthStatusCheckedImpl;
}
