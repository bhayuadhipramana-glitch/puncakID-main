// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'forum_thread_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ForumThreadModel {

 int get id;@JsonKey(name: 'user_id') int get userId;@JsonKey(name: 'mountain_id') int get mountainId; String get title; String get body; UserModel? get user;@JsonKey(name: 'replies_count') int? get repliesCount;@JsonKey(name: 'created_at') DateTime? get createdAt;@JsonKey(name: 'updated_at') DateTime? get updatedAt;
/// Create a copy of ForumThreadModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ForumThreadModelCopyWith<ForumThreadModel> get copyWith => _$ForumThreadModelCopyWithImpl<ForumThreadModel>(this as ForumThreadModel, _$identity);

  /// Serializes this ForumThreadModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ForumThreadModel&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.mountainId, mountainId) || other.mountainId == mountainId)&&(identical(other.title, title) || other.title == title)&&(identical(other.body, body) || other.body == body)&&(identical(other.user, user) || other.user == user)&&(identical(other.repliesCount, repliesCount) || other.repliesCount == repliesCount)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,mountainId,title,body,user,repliesCount,createdAt,updatedAt);

@override
String toString() {
  return 'ForumThreadModel(id: $id, userId: $userId, mountainId: $mountainId, title: $title, body: $body, user: $user, repliesCount: $repliesCount, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $ForumThreadModelCopyWith<$Res>  {
  factory $ForumThreadModelCopyWith(ForumThreadModel value, $Res Function(ForumThreadModel) _then) = _$ForumThreadModelCopyWithImpl;
@useResult
$Res call({
 int id,@JsonKey(name: 'user_id') int userId,@JsonKey(name: 'mountain_id') int mountainId, String title, String body, UserModel? user,@JsonKey(name: 'replies_count') int? repliesCount,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'updated_at') DateTime? updatedAt
});


$UserModelCopyWith<$Res>? get user;

}
/// @nodoc
class _$ForumThreadModelCopyWithImpl<$Res>
    implements $ForumThreadModelCopyWith<$Res> {
  _$ForumThreadModelCopyWithImpl(this._self, this._then);

  final ForumThreadModel _self;
  final $Res Function(ForumThreadModel) _then;

/// Create a copy of ForumThreadModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = null,Object? mountainId = null,Object? title = null,Object? body = null,Object? user = freezed,Object? repliesCount = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,mountainId: null == mountainId ? _self.mountainId : mountainId // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,body: null == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserModel?,repliesCount: freezed == repliesCount ? _self.repliesCount : repliesCount // ignore: cast_nullable_to_non_nullable
as int?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}
/// Create a copy of ForumThreadModel
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


/// Adds pattern-matching-related methods to [ForumThreadModel].
extension ForumThreadModelPatterns on ForumThreadModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ForumThreadModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ForumThreadModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ForumThreadModel value)  $default,){
final _that = this;
switch (_that) {
case _ForumThreadModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ForumThreadModel value)?  $default,){
final _that = this;
switch (_that) {
case _ForumThreadModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'user_id')  int userId, @JsonKey(name: 'mountain_id')  int mountainId,  String title,  String body,  UserModel? user, @JsonKey(name: 'replies_count')  int? repliesCount, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ForumThreadModel() when $default != null:
return $default(_that.id,_that.userId,_that.mountainId,_that.title,_that.body,_that.user,_that.repliesCount,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'user_id')  int userId, @JsonKey(name: 'mountain_id')  int mountainId,  String title,  String body,  UserModel? user, @JsonKey(name: 'replies_count')  int? repliesCount, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _ForumThreadModel():
return $default(_that.id,_that.userId,_that.mountainId,_that.title,_that.body,_that.user,_that.repliesCount,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id, @JsonKey(name: 'user_id')  int userId, @JsonKey(name: 'mountain_id')  int mountainId,  String title,  String body,  UserModel? user, @JsonKey(name: 'replies_count')  int? repliesCount, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _ForumThreadModel() when $default != null:
return $default(_that.id,_that.userId,_that.mountainId,_that.title,_that.body,_that.user,_that.repliesCount,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ForumThreadModel implements ForumThreadModel {
  const _ForumThreadModel({required this.id, @JsonKey(name: 'user_id') required this.userId, @JsonKey(name: 'mountain_id') required this.mountainId, required this.title, required this.body, this.user, @JsonKey(name: 'replies_count') this.repliesCount, @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'updated_at') this.updatedAt});
  factory _ForumThreadModel.fromJson(Map<String, dynamic> json) => _$ForumThreadModelFromJson(json);

@override final  int id;
@override@JsonKey(name: 'user_id') final  int userId;
@override@JsonKey(name: 'mountain_id') final  int mountainId;
@override final  String title;
@override final  String body;
@override final  UserModel? user;
@override@JsonKey(name: 'replies_count') final  int? repliesCount;
@override@JsonKey(name: 'created_at') final  DateTime? createdAt;
@override@JsonKey(name: 'updated_at') final  DateTime? updatedAt;

/// Create a copy of ForumThreadModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ForumThreadModelCopyWith<_ForumThreadModel> get copyWith => __$ForumThreadModelCopyWithImpl<_ForumThreadModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ForumThreadModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ForumThreadModel&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.mountainId, mountainId) || other.mountainId == mountainId)&&(identical(other.title, title) || other.title == title)&&(identical(other.body, body) || other.body == body)&&(identical(other.user, user) || other.user == user)&&(identical(other.repliesCount, repliesCount) || other.repliesCount == repliesCount)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,mountainId,title,body,user,repliesCount,createdAt,updatedAt);

@override
String toString() {
  return 'ForumThreadModel(id: $id, userId: $userId, mountainId: $mountainId, title: $title, body: $body, user: $user, repliesCount: $repliesCount, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$ForumThreadModelCopyWith<$Res> implements $ForumThreadModelCopyWith<$Res> {
  factory _$ForumThreadModelCopyWith(_ForumThreadModel value, $Res Function(_ForumThreadModel) _then) = __$ForumThreadModelCopyWithImpl;
@override @useResult
$Res call({
 int id,@JsonKey(name: 'user_id') int userId,@JsonKey(name: 'mountain_id') int mountainId, String title, String body, UserModel? user,@JsonKey(name: 'replies_count') int? repliesCount,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'updated_at') DateTime? updatedAt
});


@override $UserModelCopyWith<$Res>? get user;

}
/// @nodoc
class __$ForumThreadModelCopyWithImpl<$Res>
    implements _$ForumThreadModelCopyWith<$Res> {
  __$ForumThreadModelCopyWithImpl(this._self, this._then);

  final _ForumThreadModel _self;
  final $Res Function(_ForumThreadModel) _then;

/// Create a copy of ForumThreadModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,Object? mountainId = null,Object? title = null,Object? body = null,Object? user = freezed,Object? repliesCount = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_ForumThreadModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,mountainId: null == mountainId ? _self.mountainId : mountainId // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,body: null == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserModel?,repliesCount: freezed == repliesCount ? _self.repliesCount : repliesCount // ignore: cast_nullable_to_non_nullable
as int?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

/// Create a copy of ForumThreadModel
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
