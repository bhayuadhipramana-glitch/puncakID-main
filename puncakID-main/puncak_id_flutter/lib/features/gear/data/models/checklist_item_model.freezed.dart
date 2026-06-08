// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'checklist_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChecklistItemModel {

 int get id;@JsonKey(name: 'user_id') int get userId;@JsonKey(name: 'mountain_id') int get mountainId; String get name;@JsonKey(name: 'is_checked') bool get isChecked;@JsonKey(name: 'created_at') DateTime? get createdAt;@JsonKey(name: 'updated_at') DateTime? get updatedAt;
/// Create a copy of ChecklistItemModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChecklistItemModelCopyWith<ChecklistItemModel> get copyWith => _$ChecklistItemModelCopyWithImpl<ChecklistItemModel>(this as ChecklistItemModel, _$identity);

  /// Serializes this ChecklistItemModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChecklistItemModel&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.mountainId, mountainId) || other.mountainId == mountainId)&&(identical(other.name, name) || other.name == name)&&(identical(other.isChecked, isChecked) || other.isChecked == isChecked)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,mountainId,name,isChecked,createdAt,updatedAt);

@override
String toString() {
  return 'ChecklistItemModel(id: $id, userId: $userId, mountainId: $mountainId, name: $name, isChecked: $isChecked, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $ChecklistItemModelCopyWith<$Res>  {
  factory $ChecklistItemModelCopyWith(ChecklistItemModel value, $Res Function(ChecklistItemModel) _then) = _$ChecklistItemModelCopyWithImpl;
@useResult
$Res call({
 int id,@JsonKey(name: 'user_id') int userId,@JsonKey(name: 'mountain_id') int mountainId, String name,@JsonKey(name: 'is_checked') bool isChecked,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'updated_at') DateTime? updatedAt
});




}
/// @nodoc
class _$ChecklistItemModelCopyWithImpl<$Res>
    implements $ChecklistItemModelCopyWith<$Res> {
  _$ChecklistItemModelCopyWithImpl(this._self, this._then);

  final ChecklistItemModel _self;
  final $Res Function(ChecklistItemModel) _then;

/// Create a copy of ChecklistItemModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = null,Object? mountainId = null,Object? name = null,Object? isChecked = null,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,mountainId: null == mountainId ? _self.mountainId : mountainId // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,isChecked: null == isChecked ? _self.isChecked : isChecked // ignore: cast_nullable_to_non_nullable
as bool,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [ChecklistItemModel].
extension ChecklistItemModelPatterns on ChecklistItemModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChecklistItemModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChecklistItemModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChecklistItemModel value)  $default,){
final _that = this;
switch (_that) {
case _ChecklistItemModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChecklistItemModel value)?  $default,){
final _that = this;
switch (_that) {
case _ChecklistItemModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'user_id')  int userId, @JsonKey(name: 'mountain_id')  int mountainId,  String name, @JsonKey(name: 'is_checked')  bool isChecked, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChecklistItemModel() when $default != null:
return $default(_that.id,_that.userId,_that.mountainId,_that.name,_that.isChecked,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'user_id')  int userId, @JsonKey(name: 'mountain_id')  int mountainId,  String name, @JsonKey(name: 'is_checked')  bool isChecked, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _ChecklistItemModel():
return $default(_that.id,_that.userId,_that.mountainId,_that.name,_that.isChecked,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id, @JsonKey(name: 'user_id')  int userId, @JsonKey(name: 'mountain_id')  int mountainId,  String name, @JsonKey(name: 'is_checked')  bool isChecked, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _ChecklistItemModel() when $default != null:
return $default(_that.id,_that.userId,_that.mountainId,_that.name,_that.isChecked,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChecklistItemModel implements ChecklistItemModel {
  const _ChecklistItemModel({required this.id, @JsonKey(name: 'user_id') required this.userId, @JsonKey(name: 'mountain_id') required this.mountainId, required this.name, @JsonKey(name: 'is_checked') this.isChecked = false, @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'updated_at') this.updatedAt});
  factory _ChecklistItemModel.fromJson(Map<String, dynamic> json) => _$ChecklistItemModelFromJson(json);

@override final  int id;
@override@JsonKey(name: 'user_id') final  int userId;
@override@JsonKey(name: 'mountain_id') final  int mountainId;
@override final  String name;
@override@JsonKey(name: 'is_checked') final  bool isChecked;
@override@JsonKey(name: 'created_at') final  DateTime? createdAt;
@override@JsonKey(name: 'updated_at') final  DateTime? updatedAt;

/// Create a copy of ChecklistItemModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChecklistItemModelCopyWith<_ChecklistItemModel> get copyWith => __$ChecklistItemModelCopyWithImpl<_ChecklistItemModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChecklistItemModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChecklistItemModel&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.mountainId, mountainId) || other.mountainId == mountainId)&&(identical(other.name, name) || other.name == name)&&(identical(other.isChecked, isChecked) || other.isChecked == isChecked)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,mountainId,name,isChecked,createdAt,updatedAt);

@override
String toString() {
  return 'ChecklistItemModel(id: $id, userId: $userId, mountainId: $mountainId, name: $name, isChecked: $isChecked, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$ChecklistItemModelCopyWith<$Res> implements $ChecklistItemModelCopyWith<$Res> {
  factory _$ChecklistItemModelCopyWith(_ChecklistItemModel value, $Res Function(_ChecklistItemModel) _then) = __$ChecklistItemModelCopyWithImpl;
@override @useResult
$Res call({
 int id,@JsonKey(name: 'user_id') int userId,@JsonKey(name: 'mountain_id') int mountainId, String name,@JsonKey(name: 'is_checked') bool isChecked,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'updated_at') DateTime? updatedAt
});




}
/// @nodoc
class __$ChecklistItemModelCopyWithImpl<$Res>
    implements _$ChecklistItemModelCopyWith<$Res> {
  __$ChecklistItemModelCopyWithImpl(this._self, this._then);

  final _ChecklistItemModel _self;
  final $Res Function(_ChecklistItemModel) _then;

/// Create a copy of ChecklistItemModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,Object? mountainId = null,Object? name = null,Object? isChecked = null,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_ChecklistItemModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,mountainId: null == mountainId ? _self.mountainId : mountainId // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,isChecked: null == isChecked ? _self.isChecked : isChecked // ignore: cast_nullable_to_non_nullable
as bool,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
