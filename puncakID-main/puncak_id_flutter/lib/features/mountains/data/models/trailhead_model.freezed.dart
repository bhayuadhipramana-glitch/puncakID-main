// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trailhead_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TrailheadModel {

 int get id;@JsonKey(name: 'mountain_id') int get mountainId; String get name; String? get description;@JsonKey(name: 'google_maps_link') String? get googleMapsLink;@JsonKey(name: 'avenza_pdf_url') String? get avenzaPdfUrl;@JsonKey(name: 'sort_order') int get sortOrder;
/// Create a copy of TrailheadModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TrailheadModelCopyWith<TrailheadModel> get copyWith => _$TrailheadModelCopyWithImpl<TrailheadModel>(this as TrailheadModel, _$identity);

  /// Serializes this TrailheadModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrailheadModel&&(identical(other.id, id) || other.id == id)&&(identical(other.mountainId, mountainId) || other.mountainId == mountainId)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.googleMapsLink, googleMapsLink) || other.googleMapsLink == googleMapsLink)&&(identical(other.avenzaPdfUrl, avenzaPdfUrl) || other.avenzaPdfUrl == avenzaPdfUrl)&&(identical(other.sortOrder, sortOrder) || other.sortOrder == sortOrder));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,mountainId,name,description,googleMapsLink,avenzaPdfUrl,sortOrder);

@override
String toString() {
  return 'TrailheadModel(id: $id, mountainId: $mountainId, name: $name, description: $description, googleMapsLink: $googleMapsLink, avenzaPdfUrl: $avenzaPdfUrl, sortOrder: $sortOrder)';
}


}

/// @nodoc
abstract mixin class $TrailheadModelCopyWith<$Res>  {
  factory $TrailheadModelCopyWith(TrailheadModel value, $Res Function(TrailheadModel) _then) = _$TrailheadModelCopyWithImpl;
@useResult
$Res call({
 int id,@JsonKey(name: 'mountain_id') int mountainId, String name, String? description,@JsonKey(name: 'google_maps_link') String? googleMapsLink,@JsonKey(name: 'avenza_pdf_url') String? avenzaPdfUrl,@JsonKey(name: 'sort_order') int sortOrder
});




}
/// @nodoc
class _$TrailheadModelCopyWithImpl<$Res>
    implements $TrailheadModelCopyWith<$Res> {
  _$TrailheadModelCopyWithImpl(this._self, this._then);

  final TrailheadModel _self;
  final $Res Function(TrailheadModel) _then;

/// Create a copy of TrailheadModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? mountainId = null,Object? name = null,Object? description = freezed,Object? googleMapsLink = freezed,Object? avenzaPdfUrl = freezed,Object? sortOrder = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,mountainId: null == mountainId ? _self.mountainId : mountainId // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,googleMapsLink: freezed == googleMapsLink ? _self.googleMapsLink : googleMapsLink // ignore: cast_nullable_to_non_nullable
as String?,avenzaPdfUrl: freezed == avenzaPdfUrl ? _self.avenzaPdfUrl : avenzaPdfUrl // ignore: cast_nullable_to_non_nullable
as String?,sortOrder: null == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [TrailheadModel].
extension TrailheadModelPatterns on TrailheadModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TrailheadModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TrailheadModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TrailheadModel value)  $default,){
final _that = this;
switch (_that) {
case _TrailheadModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TrailheadModel value)?  $default,){
final _that = this;
switch (_that) {
case _TrailheadModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'mountain_id')  int mountainId,  String name,  String? description, @JsonKey(name: 'google_maps_link')  String? googleMapsLink, @JsonKey(name: 'avenza_pdf_url')  String? avenzaPdfUrl, @JsonKey(name: 'sort_order')  int sortOrder)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TrailheadModel() when $default != null:
return $default(_that.id,_that.mountainId,_that.name,_that.description,_that.googleMapsLink,_that.avenzaPdfUrl,_that.sortOrder);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'mountain_id')  int mountainId,  String name,  String? description, @JsonKey(name: 'google_maps_link')  String? googleMapsLink, @JsonKey(name: 'avenza_pdf_url')  String? avenzaPdfUrl, @JsonKey(name: 'sort_order')  int sortOrder)  $default,) {final _that = this;
switch (_that) {
case _TrailheadModel():
return $default(_that.id,_that.mountainId,_that.name,_that.description,_that.googleMapsLink,_that.avenzaPdfUrl,_that.sortOrder);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id, @JsonKey(name: 'mountain_id')  int mountainId,  String name,  String? description, @JsonKey(name: 'google_maps_link')  String? googleMapsLink, @JsonKey(name: 'avenza_pdf_url')  String? avenzaPdfUrl, @JsonKey(name: 'sort_order')  int sortOrder)?  $default,) {final _that = this;
switch (_that) {
case _TrailheadModel() when $default != null:
return $default(_that.id,_that.mountainId,_that.name,_that.description,_that.googleMapsLink,_that.avenzaPdfUrl,_that.sortOrder);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TrailheadModel implements TrailheadModel {
  const _TrailheadModel({required this.id, @JsonKey(name: 'mountain_id') required this.mountainId, required this.name, this.description, @JsonKey(name: 'google_maps_link') this.googleMapsLink, @JsonKey(name: 'avenza_pdf_url') this.avenzaPdfUrl, @JsonKey(name: 'sort_order') this.sortOrder = 0});
  factory _TrailheadModel.fromJson(Map<String, dynamic> json) => _$TrailheadModelFromJson(json);

@override final  int id;
@override@JsonKey(name: 'mountain_id') final  int mountainId;
@override final  String name;
@override final  String? description;
@override@JsonKey(name: 'google_maps_link') final  String? googleMapsLink;
@override@JsonKey(name: 'avenza_pdf_url') final  String? avenzaPdfUrl;
@override@JsonKey(name: 'sort_order') final  int sortOrder;

/// Create a copy of TrailheadModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TrailheadModelCopyWith<_TrailheadModel> get copyWith => __$TrailheadModelCopyWithImpl<_TrailheadModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TrailheadModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TrailheadModel&&(identical(other.id, id) || other.id == id)&&(identical(other.mountainId, mountainId) || other.mountainId == mountainId)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.googleMapsLink, googleMapsLink) || other.googleMapsLink == googleMapsLink)&&(identical(other.avenzaPdfUrl, avenzaPdfUrl) || other.avenzaPdfUrl == avenzaPdfUrl)&&(identical(other.sortOrder, sortOrder) || other.sortOrder == sortOrder));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,mountainId,name,description,googleMapsLink,avenzaPdfUrl,sortOrder);

@override
String toString() {
  return 'TrailheadModel(id: $id, mountainId: $mountainId, name: $name, description: $description, googleMapsLink: $googleMapsLink, avenzaPdfUrl: $avenzaPdfUrl, sortOrder: $sortOrder)';
}


}

/// @nodoc
abstract mixin class _$TrailheadModelCopyWith<$Res> implements $TrailheadModelCopyWith<$Res> {
  factory _$TrailheadModelCopyWith(_TrailheadModel value, $Res Function(_TrailheadModel) _then) = __$TrailheadModelCopyWithImpl;
@override @useResult
$Res call({
 int id,@JsonKey(name: 'mountain_id') int mountainId, String name, String? description,@JsonKey(name: 'google_maps_link') String? googleMapsLink,@JsonKey(name: 'avenza_pdf_url') String? avenzaPdfUrl,@JsonKey(name: 'sort_order') int sortOrder
});




}
/// @nodoc
class __$TrailheadModelCopyWithImpl<$Res>
    implements _$TrailheadModelCopyWith<$Res> {
  __$TrailheadModelCopyWithImpl(this._self, this._then);

  final _TrailheadModel _self;
  final $Res Function(_TrailheadModel) _then;

/// Create a copy of TrailheadModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? mountainId = null,Object? name = null,Object? description = freezed,Object? googleMapsLink = freezed,Object? avenzaPdfUrl = freezed,Object? sortOrder = null,}) {
  return _then(_TrailheadModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,mountainId: null == mountainId ? _self.mountainId : mountainId // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,googleMapsLink: freezed == googleMapsLink ? _self.googleMapsLink : googleMapsLink // ignore: cast_nullable_to_non_nullable
as String?,avenzaPdfUrl: freezed == avenzaPdfUrl ? _self.avenzaPdfUrl : avenzaPdfUrl // ignore: cast_nullable_to_non_nullable
as String?,sortOrder: null == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
