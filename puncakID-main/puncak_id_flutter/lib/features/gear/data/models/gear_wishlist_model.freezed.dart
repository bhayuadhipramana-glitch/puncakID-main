// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'gear_wishlist_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GearWishlistModel {

 int get id;@JsonKey(name: 'user_id') int get userId; String get name;@JsonKey(name: 'image_url') String? get imageUrl;@JsonKey(name: 'target_price') int get targetPrice;@JsonKey(name: 'saved_amount') int get savedAmount;@JsonKey(name: 'store_link') String? get storeLink; String get frequency; String get status;@JsonKey(name: 'target_date') DateTime? get targetDate;@JsonKey(name: 'created_at') DateTime? get createdAt;@JsonKey(name: 'updated_at') DateTime? get updatedAt;
/// Create a copy of GearWishlistModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GearWishlistModelCopyWith<GearWishlistModel> get copyWith => _$GearWishlistModelCopyWithImpl<GearWishlistModel>(this as GearWishlistModel, _$identity);

  /// Serializes this GearWishlistModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GearWishlistModel&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.name, name) || other.name == name)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.targetPrice, targetPrice) || other.targetPrice == targetPrice)&&(identical(other.savedAmount, savedAmount) || other.savedAmount == savedAmount)&&(identical(other.storeLink, storeLink) || other.storeLink == storeLink)&&(identical(other.frequency, frequency) || other.frequency == frequency)&&(identical(other.status, status) || other.status == status)&&(identical(other.targetDate, targetDate) || other.targetDate == targetDate)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,name,imageUrl,targetPrice,savedAmount,storeLink,frequency,status,targetDate,createdAt,updatedAt);

@override
String toString() {
  return 'GearWishlistModel(id: $id, userId: $userId, name: $name, imageUrl: $imageUrl, targetPrice: $targetPrice, savedAmount: $savedAmount, storeLink: $storeLink, frequency: $frequency, status: $status, targetDate: $targetDate, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $GearWishlistModelCopyWith<$Res>  {
  factory $GearWishlistModelCopyWith(GearWishlistModel value, $Res Function(GearWishlistModel) _then) = _$GearWishlistModelCopyWithImpl;
@useResult
$Res call({
 int id,@JsonKey(name: 'user_id') int userId, String name,@JsonKey(name: 'image_url') String? imageUrl,@JsonKey(name: 'target_price') int targetPrice,@JsonKey(name: 'saved_amount') int savedAmount,@JsonKey(name: 'store_link') String? storeLink, String frequency, String status,@JsonKey(name: 'target_date') DateTime? targetDate,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'updated_at') DateTime? updatedAt
});




}
/// @nodoc
class _$GearWishlistModelCopyWithImpl<$Res>
    implements $GearWishlistModelCopyWith<$Res> {
  _$GearWishlistModelCopyWithImpl(this._self, this._then);

  final GearWishlistModel _self;
  final $Res Function(GearWishlistModel) _then;

/// Create a copy of GearWishlistModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = null,Object? name = null,Object? imageUrl = freezed,Object? targetPrice = null,Object? savedAmount = null,Object? storeLink = freezed,Object? frequency = null,Object? status = null,Object? targetDate = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,targetPrice: null == targetPrice ? _self.targetPrice : targetPrice // ignore: cast_nullable_to_non_nullable
as int,savedAmount: null == savedAmount ? _self.savedAmount : savedAmount // ignore: cast_nullable_to_non_nullable
as int,storeLink: freezed == storeLink ? _self.storeLink : storeLink // ignore: cast_nullable_to_non_nullable
as String?,frequency: null == frequency ? _self.frequency : frequency // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,targetDate: freezed == targetDate ? _self.targetDate : targetDate // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [GearWishlistModel].
extension GearWishlistModelPatterns on GearWishlistModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GearWishlistModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GearWishlistModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GearWishlistModel value)  $default,){
final _that = this;
switch (_that) {
case _GearWishlistModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GearWishlistModel value)?  $default,){
final _that = this;
switch (_that) {
case _GearWishlistModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'user_id')  int userId,  String name, @JsonKey(name: 'image_url')  String? imageUrl, @JsonKey(name: 'target_price')  int targetPrice, @JsonKey(name: 'saved_amount')  int savedAmount, @JsonKey(name: 'store_link')  String? storeLink,  String frequency,  String status, @JsonKey(name: 'target_date')  DateTime? targetDate, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GearWishlistModel() when $default != null:
return $default(_that.id,_that.userId,_that.name,_that.imageUrl,_that.targetPrice,_that.savedAmount,_that.storeLink,_that.frequency,_that.status,_that.targetDate,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'user_id')  int userId,  String name, @JsonKey(name: 'image_url')  String? imageUrl, @JsonKey(name: 'target_price')  int targetPrice, @JsonKey(name: 'saved_amount')  int savedAmount, @JsonKey(name: 'store_link')  String? storeLink,  String frequency,  String status, @JsonKey(name: 'target_date')  DateTime? targetDate, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _GearWishlistModel():
return $default(_that.id,_that.userId,_that.name,_that.imageUrl,_that.targetPrice,_that.savedAmount,_that.storeLink,_that.frequency,_that.status,_that.targetDate,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id, @JsonKey(name: 'user_id')  int userId,  String name, @JsonKey(name: 'image_url')  String? imageUrl, @JsonKey(name: 'target_price')  int targetPrice, @JsonKey(name: 'saved_amount')  int savedAmount, @JsonKey(name: 'store_link')  String? storeLink,  String frequency,  String status, @JsonKey(name: 'target_date')  DateTime? targetDate, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _GearWishlistModel() when $default != null:
return $default(_that.id,_that.userId,_that.name,_that.imageUrl,_that.targetPrice,_that.savedAmount,_that.storeLink,_that.frequency,_that.status,_that.targetDate,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GearWishlistModel extends GearWishlistModel {
  const _GearWishlistModel({required this.id, @JsonKey(name: 'user_id') required this.userId, required this.name, @JsonKey(name: 'image_url') this.imageUrl, @JsonKey(name: 'target_price') this.targetPrice = 0, @JsonKey(name: 'saved_amount') this.savedAmount = 0, @JsonKey(name: 'store_link') this.storeLink, this.frequency = 'daily', this.status = 'saving', @JsonKey(name: 'target_date') this.targetDate, @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'updated_at') this.updatedAt}): super._();
  factory _GearWishlistModel.fromJson(Map<String, dynamic> json) => _$GearWishlistModelFromJson(json);

@override final  int id;
@override@JsonKey(name: 'user_id') final  int userId;
@override final  String name;
@override@JsonKey(name: 'image_url') final  String? imageUrl;
@override@JsonKey(name: 'target_price') final  int targetPrice;
@override@JsonKey(name: 'saved_amount') final  int savedAmount;
@override@JsonKey(name: 'store_link') final  String? storeLink;
@override@JsonKey() final  String frequency;
@override@JsonKey() final  String status;
@override@JsonKey(name: 'target_date') final  DateTime? targetDate;
@override@JsonKey(name: 'created_at') final  DateTime? createdAt;
@override@JsonKey(name: 'updated_at') final  DateTime? updatedAt;

/// Create a copy of GearWishlistModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GearWishlistModelCopyWith<_GearWishlistModel> get copyWith => __$GearWishlistModelCopyWithImpl<_GearWishlistModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GearWishlistModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GearWishlistModel&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.name, name) || other.name == name)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.targetPrice, targetPrice) || other.targetPrice == targetPrice)&&(identical(other.savedAmount, savedAmount) || other.savedAmount == savedAmount)&&(identical(other.storeLink, storeLink) || other.storeLink == storeLink)&&(identical(other.frequency, frequency) || other.frequency == frequency)&&(identical(other.status, status) || other.status == status)&&(identical(other.targetDate, targetDate) || other.targetDate == targetDate)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,name,imageUrl,targetPrice,savedAmount,storeLink,frequency,status,targetDate,createdAt,updatedAt);

@override
String toString() {
  return 'GearWishlistModel(id: $id, userId: $userId, name: $name, imageUrl: $imageUrl, targetPrice: $targetPrice, savedAmount: $savedAmount, storeLink: $storeLink, frequency: $frequency, status: $status, targetDate: $targetDate, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$GearWishlistModelCopyWith<$Res> implements $GearWishlistModelCopyWith<$Res> {
  factory _$GearWishlistModelCopyWith(_GearWishlistModel value, $Res Function(_GearWishlistModel) _then) = __$GearWishlistModelCopyWithImpl;
@override @useResult
$Res call({
 int id,@JsonKey(name: 'user_id') int userId, String name,@JsonKey(name: 'image_url') String? imageUrl,@JsonKey(name: 'target_price') int targetPrice,@JsonKey(name: 'saved_amount') int savedAmount,@JsonKey(name: 'store_link') String? storeLink, String frequency, String status,@JsonKey(name: 'target_date') DateTime? targetDate,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'updated_at') DateTime? updatedAt
});




}
/// @nodoc
class __$GearWishlistModelCopyWithImpl<$Res>
    implements _$GearWishlistModelCopyWith<$Res> {
  __$GearWishlistModelCopyWithImpl(this._self, this._then);

  final _GearWishlistModel _self;
  final $Res Function(_GearWishlistModel) _then;

/// Create a copy of GearWishlistModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,Object? name = null,Object? imageUrl = freezed,Object? targetPrice = null,Object? savedAmount = null,Object? storeLink = freezed,Object? frequency = null,Object? status = null,Object? targetDate = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_GearWishlistModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,targetPrice: null == targetPrice ? _self.targetPrice : targetPrice // ignore: cast_nullable_to_non_nullable
as int,savedAmount: null == savedAmount ? _self.savedAmount : savedAmount // ignore: cast_nullable_to_non_nullable
as int,storeLink: freezed == storeLink ? _self.storeLink : storeLink // ignore: cast_nullable_to_non_nullable
as String?,frequency: null == frequency ? _self.frequency : frequency // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,targetDate: freezed == targetDate ? _self.targetDate : targetDate // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
