// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'forum_reply_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ForumReplyModel {

 int get id;@JsonKey(name: 'forum_thread_id') int get forumThreadId;@JsonKey(name: 'user_id') int get userId; String get body; UserModel? get user;@JsonKey(name: 'created_at') DateTime? get createdAt;@JsonKey(name: 'updated_at') DateTime? get updatedAt;
/// Create a copy of ForumReplyModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ForumReplyModelCopyWith<ForumReplyModel> get copyWith => _$ForumReplyModelCopyWithImpl<ForumReplyModel>(this as ForumReplyModel, _$identity);

  /// Serializes this ForumReplyModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ForumReplyModel&&(identical(other.id, id) || other.id == id)&&(identical(other.forumThreadId, forumThreadId) || other.forumThreadId == forumThreadId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.body, body) || other.body == body)&&(identical(other.user, user) || other.user == user)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,forumThreadId,userId,body,user,createdAt,updatedAt);

@override
String toString() {
  return 'ForumReplyModel(id: $id, forumThreadId: $forumThreadId, userId: $userId, body: $body, user: $user, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $ForumReplyModelCopyWith<$Res>  {
  factory $ForumReplyModelCopyWith(ForumReplyModel value, $Res Function(ForumReplyModel) _then) = _$ForumReplyModelCopyWithImpl;
@useResult
$Res call({
 int id,@JsonKey(name: 'forum_thread_id') int forumThreadId,@JsonKey(name: 'user_id') int userId, String body, UserModel? user,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'updated_at') DateTime? updatedAt
});


$UserModelCopyWith<$Res>? get user;

}
/// @nodoc
class _$ForumReplyModelCopyWithImpl<$Res>
    implements $ForumReplyModelCopyWith<$Res> {
  _$ForumReplyModelCopyWithImpl(this._self, this._then);

  final ForumReplyModel _self;
  final $Res Function(ForumReplyModel) _then;

/// Create a copy of ForumReplyModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? forumThreadId = null,Object? userId = null,Object? body = null,Object? user = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,forumThreadId: null == forumThreadId ? _self.forumThreadId : forumThreadId // ignore: cast_nullable_to_non_nullable
as int,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,body: null == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserModel?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}
/// Create a copy of ForumReplyModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserModelCopyWith<$Res>? get user {
    if (_self.user == null) {
    return null;
  }

  return $UserModelCopyWith<$Res>(_self.user!, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}


/// Adds pattern-matching-related methods to [ForumReplyModel].
extension ForumReplyModelPatterns on ForumReplyModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ForumReplyModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ForumReplyModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ForumReplyModel value)  $default,){
final _that = this;
switch (_that) {
case _ForumReplyModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ForumReplyModel value)?  $default,){
final _that = this;
switch (_that) {
case _ForumReplyModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'forum_thread_id')  int forumThreadId, @JsonKey(name: 'user_id')  int userId,  String body,  UserModel? user, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ForumReplyModel() when $default != null:
return $default(_that.id,_that.forumThreadId,_that.userId,_that.body,_that.user,_that.createdAt,_that.updatedAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'forum_thread_id')  int forumThreadId, @JsonKey(name: 'user_id')  int userId,  String body,  UserModel? user, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _ForumReplyModel():
return $default(_that.id,_that.forumThreadId,_that.userId,_that.body,_that.user,_that.createdAt,_that.updatedAt);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id, @JsonKey(name: 'forum_thread_id')  int forumThreadId, @JsonKey(name: 'user_id')  int userId,  String body,  UserModel? user, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _ForumReplyModel() when $default != null:
return $default(_that.id,_that.forumThreadId,_that.userId,_that.body,_that.user,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ForumReplyModel implements ForumReplyModel {
  const _ForumReplyModel({required this.id, @JsonKey(name: 'forum_thread_id') required this.forumThreadId, @JsonKey(name: 'user_id') required this.userId, required this.body, this.user, @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'updated_at') this.updatedAt});
  factory _ForumReplyModel.fromJson(Map<String, dynamic> json) => _$ForumReplyModelFromJson(json);

@override final  int id;
@override@JsonKey(name: 'forum_thread_id') final  int forumThreadId;
@override@JsonKey(name: 'user_id') final  int userId;
@override final  String body;
@override final  UserModel? user;
@override@JsonKey(name: 'created_at') final  DateTime? createdAt;
@override@JsonKey(name: 'updated_at') final  DateTime? updatedAt;

/// Create a copy of ForumReplyModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ForumReplyModelCopyWith<_ForumReplyModel> get copyWith => __$ForumReplyModelCopyWithImpl<_ForumReplyModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ForumReplyModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ForumReplyModel&&(identical(other.id, id) || other.id == id)&&(identical(other.forumThreadId, forumThreadId) || other.forumThreadId == forumThreadId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.body, body) || other.body == body)&&(identical(other.user, user) || other.user == user)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,forumThreadId,userId,body,user,createdAt,updatedAt);

@override
String toString() {
  return 'ForumReplyModel(id: $id, forumThreadId: $forumThreadId, userId: $userId, body: $body, user: $user, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$ForumReplyModelCopyWith<$Res> implements $ForumReplyModelCopyWith<$Res> {
  factory _$ForumReplyModelCopyWith(_ForumReplyModel value, $Res Function(_ForumReplyModel) _then) = __$ForumReplyModelCopyWithImpl;
@override @useResult
$Res call({
 int id,@JsonKey(name: 'forum_thread_id') int forumThreadId,@JsonKey(name: 'user_id') int userId, String body, UserModel? user,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'updated_at') DateTime? updatedAt
});


@override $UserModelCopyWith<$Res>? get user;

}
/// @nodoc
class __$ForumReplyModelCopyWithImpl<$Res>
    implements _$ForumReplyModelCopyWith<$Res> {
  __$ForumReplyModelCopyWithImpl(this._self, this._then);

  final _ForumReplyModel _self;
  final $Res Function(_ForumReplyModel) _then;

/// Create a copy of ForumReplyModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? forumThreadId = null,Object? userId = null,Object? body = null,Object? user = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_ForumReplyModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,forumThreadId: null == forumThreadId ? _self.forumThreadId : forumThreadId // ignore: cast_nullable_to_non_nullable
as int,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,body: null == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserModel?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

/// Create a copy of ForumReplyModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserModelCopyWith<$Res>? get user {
    if (_self.user == null) {
    return null;
  }

  return $UserModelCopyWith<$Res>(_self.user!, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}

// dart format on
