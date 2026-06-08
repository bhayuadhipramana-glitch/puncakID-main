// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'hike_plan_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HikePlanModel {

 int get id;@JsonKey(name: 'user_id') int get userId;@JsonKey(name: 'mountain_id') int get mountainId;@JsonKey(name: 'hike_date') DateTime get hikeDate;@JsonKey(name: 'arrival_time') String get arrivalTime;@JsonKey(name: 'route_via') String get routeVia;@JsonKey(name: 'num_people') int get numPeople;@JsonKey(name: 'social_platform') String get socialPlatform;@JsonKey(name: 'social_contact') String get socialContact; UserModel? get user; MountainModel? get mountain;@JsonKey(name: 'created_at') DateTime? get createdAt;@JsonKey(name: 'updated_at') DateTime? get updatedAt;
/// Create a copy of HikePlanModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HikePlanModelCopyWith<HikePlanModel> get copyWith => _$HikePlanModelCopyWithImpl<HikePlanModel>(this as HikePlanModel, _$identity);

  /// Serializes this HikePlanModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HikePlanModel&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.mountainId, mountainId) || other.mountainId == mountainId)&&(identical(other.hikeDate, hikeDate) || other.hikeDate == hikeDate)&&(identical(other.arrivalTime, arrivalTime) || other.arrivalTime == arrivalTime)&&(identical(other.routeVia, routeVia) || other.routeVia == routeVia)&&(identical(other.numPeople, numPeople) || other.numPeople == numPeople)&&(identical(other.socialPlatform, socialPlatform) || other.socialPlatform == socialPlatform)&&(identical(other.socialContact, socialContact) || other.socialContact == socialContact)&&(identical(other.user, user) || other.user == user)&&(identical(other.mountain, mountain) || other.mountain == mountain)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,mountainId,hikeDate,arrivalTime,routeVia,numPeople,socialPlatform,socialContact,user,mountain,createdAt,updatedAt);

@override
String toString() {
  return 'HikePlanModel(id: $id, userId: $userId, mountainId: $mountainId, hikeDate: $hikeDate, arrivalTime: $arrivalTime, routeVia: $routeVia, numPeople: $numPeople, socialPlatform: $socialPlatform, socialContact: $socialContact, user: $user, mountain: $mountain, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $HikePlanModelCopyWith<$Res>  {
  factory $HikePlanModelCopyWith(HikePlanModel value, $Res Function(HikePlanModel) _then) = _$HikePlanModelCopyWithImpl;
@useResult
$Res call({
 int id,@JsonKey(name: 'user_id') int userId,@JsonKey(name: 'mountain_id') int mountainId,@JsonKey(name: 'hike_date') DateTime hikeDate,@JsonKey(name: 'arrival_time') String arrivalTime,@JsonKey(name: 'route_via') String routeVia,@JsonKey(name: 'num_people') int numPeople,@JsonKey(name: 'social_platform') String socialPlatform,@JsonKey(name: 'social_contact') String socialContact, UserModel? user, MountainModel? mountain,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'updated_at') DateTime? updatedAt
});


$UserModelCopyWith<$Res>? get user;$MountainModelCopyWith<$Res>? get mountain;

}
/// @nodoc
class _$HikePlanModelCopyWithImpl<$Res>
    implements $HikePlanModelCopyWith<$Res> {
  _$HikePlanModelCopyWithImpl(this._self, this._then);

  final HikePlanModel _self;
  final $Res Function(HikePlanModel) _then;

/// Create a copy of HikePlanModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = null,Object? mountainId = null,Object? hikeDate = null,Object? arrivalTime = null,Object? routeVia = null,Object? numPeople = null,Object? socialPlatform = null,Object? socialContact = null,Object? user = freezed,Object? mountain = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,mountainId: null == mountainId ? _self.mountainId : mountainId // ignore: cast_nullable_to_non_nullable
as int,hikeDate: null == hikeDate ? _self.hikeDate : hikeDate // ignore: cast_nullable_to_non_nullable
as DateTime,arrivalTime: null == arrivalTime ? _self.arrivalTime : arrivalTime // ignore: cast_nullable_to_non_nullable
as String,routeVia: null == routeVia ? _self.routeVia : routeVia // ignore: cast_nullable_to_non_nullable
as String,numPeople: null == numPeople ? _self.numPeople : numPeople // ignore: cast_nullable_to_non_nullable
as int,socialPlatform: null == socialPlatform ? _self.socialPlatform : socialPlatform // ignore: cast_nullable_to_non_nullable
as String,socialContact: null == socialContact ? _self.socialContact : socialContact // ignore: cast_nullable_to_non_nullable
as String,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserModel?,mountain: freezed == mountain ? _self.mountain : mountain // ignore: cast_nullable_to_non_nullable
as MountainModel?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}
/// Create a copy of HikePlanModel
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
}/// Create a copy of HikePlanModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MountainModelCopyWith<$Res>? get mountain {
    if (_self.mountain == null) {
    return null;
  }

  return $MountainModelCopyWith<$Res>(_self.mountain!, (value) {
    return _then(_self.copyWith(mountain: value));
  });
}
}


/// Adds pattern-matching-related methods to [HikePlanModel].
extension HikePlanModelPatterns on HikePlanModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HikePlanModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HikePlanModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HikePlanModel value)  $default,){
final _that = this;
switch (_that) {
case _HikePlanModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HikePlanModel value)?  $default,){
final _that = this;
switch (_that) {
case _HikePlanModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'user_id')  int userId, @JsonKey(name: 'mountain_id')  int mountainId, @JsonKey(name: 'hike_date')  DateTime hikeDate, @JsonKey(name: 'arrival_time')  String arrivalTime, @JsonKey(name: 'route_via')  String routeVia, @JsonKey(name: 'num_people')  int numPeople, @JsonKey(name: 'social_platform')  String socialPlatform, @JsonKey(name: 'social_contact')  String socialContact,  UserModel? user,  MountainModel? mountain, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HikePlanModel() when $default != null:
return $default(_that.id,_that.userId,_that.mountainId,_that.hikeDate,_that.arrivalTime,_that.routeVia,_that.numPeople,_that.socialPlatform,_that.socialContact,_that.user,_that.mountain,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'user_id')  int userId, @JsonKey(name: 'mountain_id')  int mountainId, @JsonKey(name: 'hike_date')  DateTime hikeDate, @JsonKey(name: 'arrival_time')  String arrivalTime, @JsonKey(name: 'route_via')  String routeVia, @JsonKey(name: 'num_people')  int numPeople, @JsonKey(name: 'social_platform')  String socialPlatform, @JsonKey(name: 'social_contact')  String socialContact,  UserModel? user,  MountainModel? mountain, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _HikePlanModel():
return $default(_that.id,_that.userId,_that.mountainId,_that.hikeDate,_that.arrivalTime,_that.routeVia,_that.numPeople,_that.socialPlatform,_that.socialContact,_that.user,_that.mountain,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id, @JsonKey(name: 'user_id')  int userId, @JsonKey(name: 'mountain_id')  int mountainId, @JsonKey(name: 'hike_date')  DateTime hikeDate, @JsonKey(name: 'arrival_time')  String arrivalTime, @JsonKey(name: 'route_via')  String routeVia, @JsonKey(name: 'num_people')  int numPeople, @JsonKey(name: 'social_platform')  String socialPlatform, @JsonKey(name: 'social_contact')  String socialContact,  UserModel? user,  MountainModel? mountain, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _HikePlanModel() when $default != null:
return $default(_that.id,_that.userId,_that.mountainId,_that.hikeDate,_that.arrivalTime,_that.routeVia,_that.numPeople,_that.socialPlatform,_that.socialContact,_that.user,_that.mountain,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HikePlanModel implements HikePlanModel {
  const _HikePlanModel({required this.id, @JsonKey(name: 'user_id') required this.userId, @JsonKey(name: 'mountain_id') required this.mountainId, @JsonKey(name: 'hike_date') required this.hikeDate, @JsonKey(name: 'arrival_time') required this.arrivalTime, @JsonKey(name: 'route_via') required this.routeVia, @JsonKey(name: 'num_people') this.numPeople = 1, @JsonKey(name: 'social_platform') this.socialPlatform = 'whatsapp', @JsonKey(name: 'social_contact') required this.socialContact, this.user, this.mountain, @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'updated_at') this.updatedAt});
  factory _HikePlanModel.fromJson(Map<String, dynamic> json) => _$HikePlanModelFromJson(json);

@override final  int id;
@override@JsonKey(name: 'user_id') final  int userId;
@override@JsonKey(name: 'mountain_id') final  int mountainId;
@override@JsonKey(name: 'hike_date') final  DateTime hikeDate;
@override@JsonKey(name: 'arrival_time') final  String arrivalTime;
@override@JsonKey(name: 'route_via') final  String routeVia;
@override@JsonKey(name: 'num_people') final  int numPeople;
@override@JsonKey(name: 'social_platform') final  String socialPlatform;
@override@JsonKey(name: 'social_contact') final  String socialContact;
@override final  UserModel? user;
@override final  MountainModel? mountain;
@override@JsonKey(name: 'created_at') final  DateTime? createdAt;
@override@JsonKey(name: 'updated_at') final  DateTime? updatedAt;

/// Create a copy of HikePlanModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HikePlanModelCopyWith<_HikePlanModel> get copyWith => __$HikePlanModelCopyWithImpl<_HikePlanModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HikePlanModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HikePlanModel&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.mountainId, mountainId) || other.mountainId == mountainId)&&(identical(other.hikeDate, hikeDate) || other.hikeDate == hikeDate)&&(identical(other.arrivalTime, arrivalTime) || other.arrivalTime == arrivalTime)&&(identical(other.routeVia, routeVia) || other.routeVia == routeVia)&&(identical(other.numPeople, numPeople) || other.numPeople == numPeople)&&(identical(other.socialPlatform, socialPlatform) || other.socialPlatform == socialPlatform)&&(identical(other.socialContact, socialContact) || other.socialContact == socialContact)&&(identical(other.user, user) || other.user == user)&&(identical(other.mountain, mountain) || other.mountain == mountain)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,mountainId,hikeDate,arrivalTime,routeVia,numPeople,socialPlatform,socialContact,user,mountain,createdAt,updatedAt);

@override
String toString() {
  return 'HikePlanModel(id: $id, userId: $userId, mountainId: $mountainId, hikeDate: $hikeDate, arrivalTime: $arrivalTime, routeVia: $routeVia, numPeople: $numPeople, socialPlatform: $socialPlatform, socialContact: $socialContact, user: $user, mountain: $mountain, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$HikePlanModelCopyWith<$Res> implements $HikePlanModelCopyWith<$Res> {
  factory _$HikePlanModelCopyWith(_HikePlanModel value, $Res Function(_HikePlanModel) _then) = __$HikePlanModelCopyWithImpl;
@override @useResult
$Res call({
 int id,@JsonKey(name: 'user_id') int userId,@JsonKey(name: 'mountain_id') int mountainId,@JsonKey(name: 'hike_date') DateTime hikeDate,@JsonKey(name: 'arrival_time') String arrivalTime,@JsonKey(name: 'route_via') String routeVia,@JsonKey(name: 'num_people') int numPeople,@JsonKey(name: 'social_platform') String socialPlatform,@JsonKey(name: 'social_contact') String socialContact, UserModel? user, MountainModel? mountain,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'updated_at') DateTime? updatedAt
});


@override $UserModelCopyWith<$Res>? get user;@override $MountainModelCopyWith<$Res>? get mountain;

}
/// @nodoc
class __$HikePlanModelCopyWithImpl<$Res>
    implements _$HikePlanModelCopyWith<$Res> {
  __$HikePlanModelCopyWithImpl(this._self, this._then);

  final _HikePlanModel _self;
  final $Res Function(_HikePlanModel) _then;

/// Create a copy of HikePlanModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,Object? mountainId = null,Object? hikeDate = null,Object? arrivalTime = null,Object? routeVia = null,Object? numPeople = null,Object? socialPlatform = null,Object? socialContact = null,Object? user = freezed,Object? mountain = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_HikePlanModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,mountainId: null == mountainId ? _self.mountainId : mountainId // ignore: cast_nullable_to_non_nullable
as int,hikeDate: null == hikeDate ? _self.hikeDate : hikeDate // ignore: cast_nullable_to_non_nullable
as DateTime,arrivalTime: null == arrivalTime ? _self.arrivalTime : arrivalTime // ignore: cast_nullable_to_non_nullable
as String,routeVia: null == routeVia ? _self.routeVia : routeVia // ignore: cast_nullable_to_non_nullable
as String,numPeople: null == numPeople ? _self.numPeople : numPeople // ignore: cast_nullable_to_non_nullable
as int,socialPlatform: null == socialPlatform ? _self.socialPlatform : socialPlatform // ignore: cast_nullable_to_non_nullable
as String,socialContact: null == socialContact ? _self.socialContact : socialContact // ignore: cast_nullable_to_non_nullable
as String,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserModel?,mountain: freezed == mountain ? _self.mountain : mountain // ignore: cast_nullable_to_non_nullable
as MountainModel?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

/// Create a copy of HikePlanModel
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
}/// Create a copy of HikePlanModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MountainModelCopyWith<$Res>? get mountain {
    if (_self.mountain == null) {
    return null;
  }

  return $MountainModelCopyWith<$Res>(_self.mountain!, (value) {
    return _then(_self.copyWith(mountain: value));
  });
}
}

// dart format on
