// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'gear_recommendation_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GearRecommendationModel {

 int get id;@JsonKey(name: 'mountain_id') int get mountainId; String get name;@JsonKey(name: 'sort_order') int get sortOrder;
/// Create a copy of GearRecommendationModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GearRecommendationModelCopyWith<GearRecommendationModel> get copyWith => _$GearRecommendationModelCopyWithImpl<GearRecommendationModel>(this as GearRecommendationModel, _$identity);

  /// Serializes this GearRecommendationModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GearRecommendationModel&&(identical(other.id, id) || other.id == id)&&(identical(other.mountainId, mountainId) || other.mountainId == mountainId)&&(identical(other.name, name) || other.name == name)&&(identical(other.sortOrder, sortOrder) || other.sortOrder == sortOrder));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,mountainId,name,sortOrder);

@override
String toString() {
  return 'GearRecommendationModel(id: $id, mountainId: $mountainId, name: $name, sortOrder: $sortOrder)';
}


}

/// @nodoc
abstract mixin class $GearRecommendationModelCopyWith<$Res>  {
  factory $GearRecommendationModelCopyWith(GearRecommendationModel value, $Res Function(GearRecommendationModel) _then) = _$GearRecommendationModelCopyWithImpl;
@useResult
$Res call({
 int id,@JsonKey(name: 'mountain_id') int mountainId, String name,@JsonKey(name: 'sort_order') int sortOrder
});




}
/// @nodoc
class _$GearRecommendationModelCopyWithImpl<$Res>
    implements $GearRecommendationModelCopyWith<$Res> {
  _$GearRecommendationModelCopyWithImpl(this._self, this._then);

  final GearRecommendationModel _self;
  final $Res Function(GearRecommendationModel) _then;

/// Create a copy of GearRecommendationModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? mountainId = null,Object? name = null,Object? sortOrder = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,mountainId: null == mountainId ? _self.mountainId : mountainId // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,sortOrder: null == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [GearRecommendationModel].
extension GearRecommendationModelPatterns on GearRecommendationModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GearRecommendationModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GearRecommendationModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GearRecommendationModel value)  $default,){
final _that = this;
switch (_that) {
case _GearRecommendationModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GearRecommendationModel value)?  $default,){
final _that = this;
switch (_that) {
case _GearRecommendationModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'mountain_id')  int mountainId,  String name, @JsonKey(name: 'sort_order')  int sortOrder)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GearRecommendationModel() when $default != null:
return $default(_that.id,_that.mountainId,_that.name,_that.sortOrder);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'mountain_id')  int mountainId,  String name, @JsonKey(name: 'sort_order')  int sortOrder)  $default,) {final _that = this;
switch (_that) {
case _GearRecommendationModel():
return $default(_that.id,_that.mountainId,_that.name,_that.sortOrder);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id, @JsonKey(name: 'mountain_id')  int mountainId,  String name, @JsonKey(name: 'sort_order')  int sortOrder)?  $default,) {final _that = this;
switch (_that) {
case _GearRecommendationModel() when $default != null:
return $default(_that.id,_that.mountainId,_that.name,_that.sortOrder);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GearRecommendationModel implements GearRecommendationModel {
  const _GearRecommendationModel({required this.id, @JsonKey(name: 'mountain_id') required this.mountainId, required this.name, @JsonKey(name: 'sort_order') this.sortOrder = 0});
  factory _GearRecommendationModel.fromJson(Map<String, dynamic> json) => _$GearRecommendationModelFromJson(json);

@override final  int id;
@override@JsonKey(name: 'mountain_id') final  int mountainId;
@override final  String name;
@override@JsonKey(name: 'sort_order') final  int sortOrder;

/// Create a copy of GearRecommendationModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GearRecommendationModelCopyWith<_GearRecommendationModel> get copyWith => __$GearRecommendationModelCopyWithImpl<_GearRecommendationModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GearRecommendationModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GearRecommendationModel&&(identical(other.id, id) || other.id == id)&&(identical(other.mountainId, mountainId) || other.mountainId == mountainId)&&(identical(other.name, name) || other.name == name)&&(identical(other.sortOrder, sortOrder) || other.sortOrder == sortOrder));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,mountainId,name,sortOrder);

@override
String toString() {
  return 'GearRecommendationModel(id: $id, mountainId: $mountainId, name: $name, sortOrder: $sortOrder)';
}


}

/// @nodoc
abstract mixin class _$GearRecommendationModelCopyWith<$Res> implements $GearRecommendationModelCopyWith<$Res> {
  factory _$GearRecommendationModelCopyWith(_GearRecommendationModel value, $Res Function(_GearRecommendationModel) _then) = __$GearRecommendationModelCopyWithImpl;
@override @useResult
$Res call({
 int id,@JsonKey(name: 'mountain_id') int mountainId, String name,@JsonKey(name: 'sort_order') int sortOrder
});




}
/// @nodoc
class __$GearRecommendationModelCopyWithImpl<$Res>
    implements _$GearRecommendationModelCopyWith<$Res> {
  __$GearRecommendationModelCopyWithImpl(this._self, this._then);

  final _GearRecommendationModel _self;
  final $Res Function(_GearRecommendationModel) _then;

/// Create a copy of GearRecommendationModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? mountainId = null,Object? name = null,Object? sortOrder = null,}) {
  return _then(_GearRecommendationModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,mountainId: null == mountainId ? _self.mountainId : mountainId // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,sortOrder: null == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
