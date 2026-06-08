// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mountain_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MountainModel {

 int get id; String get slug; String get name; String get region; int get elevation; String get difficulty; String? get description;@JsonKey(name: 'image_url') String? get imageUrl; String get status;@JsonKey(name: 'fee_wni') String get feeWni;@JsonKey(name: 'fee_wna') String get feeWna;@JsonKey(name: 'avenza_map_url') String? get avenzaMapUrl; List<TrailheadModel>? get trailheads;@JsonKey(name: 'gear_recommendations') List<GearRecommendationModel>? get gearRecommendations;@JsonKey(name: 'first_aid_items') List<FirstAidItemModel>? get firstAidItems;@JsonKey(name: 'created_at') DateTime? get createdAt;@JsonKey(name: 'updated_at') DateTime? get updatedAt;
/// Create a copy of MountainModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MountainModelCopyWith<MountainModel> get copyWith => _$MountainModelCopyWithImpl<MountainModel>(this as MountainModel, _$identity);

  /// Serializes this MountainModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MountainModel&&(identical(other.id, id) || other.id == id)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.name, name) || other.name == name)&&(identical(other.region, region) || other.region == region)&&(identical(other.elevation, elevation) || other.elevation == elevation)&&(identical(other.difficulty, difficulty) || other.difficulty == difficulty)&&(identical(other.description, description) || other.description == description)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.status, status) || other.status == status)&&(identical(other.feeWni, feeWni) || other.feeWni == feeWni)&&(identical(other.feeWna, feeWna) || other.feeWna == feeWna)&&(identical(other.avenzaMapUrl, avenzaMapUrl) || other.avenzaMapUrl == avenzaMapUrl)&&const DeepCollectionEquality().equals(other.trailheads, trailheads)&&const DeepCollectionEquality().equals(other.gearRecommendations, gearRecommendations)&&const DeepCollectionEquality().equals(other.firstAidItems, firstAidItems)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,slug,name,region,elevation,difficulty,description,imageUrl,status,feeWni,feeWna,avenzaMapUrl,const DeepCollectionEquality().hash(trailheads),const DeepCollectionEquality().hash(gearRecommendations),const DeepCollectionEquality().hash(firstAidItems),createdAt,updatedAt);

@override
String toString() {
  return 'MountainModel(id: $id, slug: $slug, name: $name, region: $region, elevation: $elevation, difficulty: $difficulty, description: $description, imageUrl: $imageUrl, status: $status, feeWni: $feeWni, feeWna: $feeWna, avenzaMapUrl: $avenzaMapUrl, trailheads: $trailheads, gearRecommendations: $gearRecommendations, firstAidItems: $firstAidItems, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $MountainModelCopyWith<$Res>  {
  factory $MountainModelCopyWith(MountainModel value, $Res Function(MountainModel) _then) = _$MountainModelCopyWithImpl;
@useResult
$Res call({
 int id, String slug, String name, String region, int elevation, String difficulty, String? description,@JsonKey(name: 'image_url') String? imageUrl, String status,@JsonKey(name: 'fee_wni') String feeWni,@JsonKey(name: 'fee_wna') String feeWna,@JsonKey(name: 'avenza_map_url') String? avenzaMapUrl, List<TrailheadModel>? trailheads,@JsonKey(name: 'gear_recommendations') List<GearRecommendationModel>? gearRecommendations,@JsonKey(name: 'first_aid_items') List<FirstAidItemModel>? firstAidItems,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'updated_at') DateTime? updatedAt
});




}
/// @nodoc
class _$MountainModelCopyWithImpl<$Res>
    implements $MountainModelCopyWith<$Res> {
  _$MountainModelCopyWithImpl(this._self, this._then);

  final MountainModel _self;
  final $Res Function(MountainModel) _then;

/// Create a copy of MountainModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? slug = null,Object? name = null,Object? region = null,Object? elevation = null,Object? difficulty = null,Object? description = freezed,Object? imageUrl = freezed,Object? status = null,Object? feeWni = null,Object? feeWna = null,Object? avenzaMapUrl = freezed,Object? trailheads = freezed,Object? gearRecommendations = freezed,Object? firstAidItems = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,region: null == region ? _self.region : region // ignore: cast_nullable_to_non_nullable
as String,elevation: null == elevation ? _self.elevation : elevation // ignore: cast_nullable_to_non_nullable
as int,difficulty: null == difficulty ? _self.difficulty : difficulty // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,feeWni: null == feeWni ? _self.feeWni : feeWni // ignore: cast_nullable_to_non_nullable
as String,feeWna: null == feeWna ? _self.feeWna : feeWna // ignore: cast_nullable_to_non_nullable
as String,avenzaMapUrl: freezed == avenzaMapUrl ? _self.avenzaMapUrl : avenzaMapUrl // ignore: cast_nullable_to_non_nullable
as String?,trailheads: freezed == trailheads ? _self.trailheads : trailheads // ignore: cast_nullable_to_non_nullable
as List<TrailheadModel>?,gearRecommendations: freezed == gearRecommendations ? _self.gearRecommendations : gearRecommendations // ignore: cast_nullable_to_non_nullable
as List<GearRecommendationModel>?,firstAidItems: freezed == firstAidItems ? _self.firstAidItems : firstAidItems // ignore: cast_nullable_to_non_nullable
as List<FirstAidItemModel>?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [MountainModel].
extension MountainModelPatterns on MountainModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MountainModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MountainModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MountainModel value)  $default,){
final _that = this;
switch (_that) {
case _MountainModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MountainModel value)?  $default,){
final _that = this;
switch (_that) {
case _MountainModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String slug,  String name,  String region,  int elevation,  String difficulty,  String? description, @JsonKey(name: 'image_url')  String? imageUrl,  String status, @JsonKey(name: 'fee_wni')  String feeWni, @JsonKey(name: 'fee_wna')  String feeWna, @JsonKey(name: 'avenza_map_url')  String? avenzaMapUrl,  List<TrailheadModel>? trailheads, @JsonKey(name: 'gear_recommendations')  List<GearRecommendationModel>? gearRecommendations, @JsonKey(name: 'first_aid_items')  List<FirstAidItemModel>? firstAidItems, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MountainModel() when $default != null:
return $default(_that.id,_that.slug,_that.name,_that.region,_that.elevation,_that.difficulty,_that.description,_that.imageUrl,_that.status,_that.feeWni,_that.feeWna,_that.avenzaMapUrl,_that.trailheads,_that.gearRecommendations,_that.firstAidItems,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String slug,  String name,  String region,  int elevation,  String difficulty,  String? description, @JsonKey(name: 'image_url')  String? imageUrl,  String status, @JsonKey(name: 'fee_wni')  String feeWni, @JsonKey(name: 'fee_wna')  String feeWna, @JsonKey(name: 'avenza_map_url')  String? avenzaMapUrl,  List<TrailheadModel>? trailheads, @JsonKey(name: 'gear_recommendations')  List<GearRecommendationModel>? gearRecommendations, @JsonKey(name: 'first_aid_items')  List<FirstAidItemModel>? firstAidItems, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _MountainModel():
return $default(_that.id,_that.slug,_that.name,_that.region,_that.elevation,_that.difficulty,_that.description,_that.imageUrl,_that.status,_that.feeWni,_that.feeWna,_that.avenzaMapUrl,_that.trailheads,_that.gearRecommendations,_that.firstAidItems,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String slug,  String name,  String region,  int elevation,  String difficulty,  String? description, @JsonKey(name: 'image_url')  String? imageUrl,  String status, @JsonKey(name: 'fee_wni')  String feeWni, @JsonKey(name: 'fee_wna')  String feeWna, @JsonKey(name: 'avenza_map_url')  String? avenzaMapUrl,  List<TrailheadModel>? trailheads, @JsonKey(name: 'gear_recommendations')  List<GearRecommendationModel>? gearRecommendations, @JsonKey(name: 'first_aid_items')  List<FirstAidItemModel>? firstAidItems, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _MountainModel() when $default != null:
return $default(_that.id,_that.slug,_that.name,_that.region,_that.elevation,_that.difficulty,_that.description,_that.imageUrl,_that.status,_that.feeWni,_that.feeWna,_that.avenzaMapUrl,_that.trailheads,_that.gearRecommendations,_that.firstAidItems,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MountainModel implements MountainModel {
  const _MountainModel({required this.id, required this.slug, required this.name, this.region = 'Bali, Indonesia', required this.elevation, this.difficulty = 'moderate', this.description, @JsonKey(name: 'image_url') this.imageUrl, this.status = 'OPEN', @JsonKey(name: 'fee_wni') this.feeWni = 'Rp 50.000', @JsonKey(name: 'fee_wna') this.feeWna = 'Rp 150.000', @JsonKey(name: 'avenza_map_url') this.avenzaMapUrl, final  List<TrailheadModel>? trailheads, @JsonKey(name: 'gear_recommendations') final  List<GearRecommendationModel>? gearRecommendations, @JsonKey(name: 'first_aid_items') final  List<FirstAidItemModel>? firstAidItems, @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'updated_at') this.updatedAt}): _trailheads = trailheads,_gearRecommendations = gearRecommendations,_firstAidItems = firstAidItems;
  factory _MountainModel.fromJson(Map<String, dynamic> json) => _$MountainModelFromJson(json);

@override final  int id;
@override final  String slug;
@override final  String name;
@override@JsonKey() final  String region;
@override final  int elevation;
@override@JsonKey() final  String difficulty;
@override final  String? description;
@override@JsonKey(name: 'image_url') final  String? imageUrl;
@override@JsonKey() final  String status;
@override@JsonKey(name: 'fee_wni') final  String feeWni;
@override@JsonKey(name: 'fee_wna') final  String feeWna;
@override@JsonKey(name: 'avenza_map_url') final  String? avenzaMapUrl;
 final  List<TrailheadModel>? _trailheads;
@override List<TrailheadModel>? get trailheads {
  final value = _trailheads;
  if (value == null) return null;
  if (_trailheads is EqualUnmodifiableListView) return _trailheads;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<GearRecommendationModel>? _gearRecommendations;
@override@JsonKey(name: 'gear_recommendations') List<GearRecommendationModel>? get gearRecommendations {
  final value = _gearRecommendations;
  if (value == null) return null;
  if (_gearRecommendations is EqualUnmodifiableListView) return _gearRecommendations;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<FirstAidItemModel>? _firstAidItems;
@override@JsonKey(name: 'first_aid_items') List<FirstAidItemModel>? get firstAidItems {
  final value = _firstAidItems;
  if (value == null) return null;
  if (_firstAidItems is EqualUnmodifiableListView) return _firstAidItems;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@JsonKey(name: 'created_at') final  DateTime? createdAt;
@override@JsonKey(name: 'updated_at') final  DateTime? updatedAt;

/// Create a copy of MountainModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MountainModelCopyWith<_MountainModel> get copyWith => __$MountainModelCopyWithImpl<_MountainModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MountainModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MountainModel&&(identical(other.id, id) || other.id == id)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.name, name) || other.name == name)&&(identical(other.region, region) || other.region == region)&&(identical(other.elevation, elevation) || other.elevation == elevation)&&(identical(other.difficulty, difficulty) || other.difficulty == difficulty)&&(identical(other.description, description) || other.description == description)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.status, status) || other.status == status)&&(identical(other.feeWni, feeWni) || other.feeWni == feeWni)&&(identical(other.feeWna, feeWna) || other.feeWna == feeWna)&&(identical(other.avenzaMapUrl, avenzaMapUrl) || other.avenzaMapUrl == avenzaMapUrl)&&const DeepCollectionEquality().equals(other._trailheads, _trailheads)&&const DeepCollectionEquality().equals(other._gearRecommendations, _gearRecommendations)&&const DeepCollectionEquality().equals(other._firstAidItems, _firstAidItems)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,slug,name,region,elevation,difficulty,description,imageUrl,status,feeWni,feeWna,avenzaMapUrl,const DeepCollectionEquality().hash(_trailheads),const DeepCollectionEquality().hash(_gearRecommendations),const DeepCollectionEquality().hash(_firstAidItems),createdAt,updatedAt);

@override
String toString() {
  return 'MountainModel(id: $id, slug: $slug, name: $name, region: $region, elevation: $elevation, difficulty: $difficulty, description: $description, imageUrl: $imageUrl, status: $status, feeWni: $feeWni, feeWna: $feeWna, avenzaMapUrl: $avenzaMapUrl, trailheads: $trailheads, gearRecommendations: $gearRecommendations, firstAidItems: $firstAidItems, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$MountainModelCopyWith<$Res> implements $MountainModelCopyWith<$Res> {
  factory _$MountainModelCopyWith(_MountainModel value, $Res Function(_MountainModel) _then) = __$MountainModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String slug, String name, String region, int elevation, String difficulty, String? description,@JsonKey(name: 'image_url') String? imageUrl, String status,@JsonKey(name: 'fee_wni') String feeWni,@JsonKey(name: 'fee_wna') String feeWna,@JsonKey(name: 'avenza_map_url') String? avenzaMapUrl, List<TrailheadModel>? trailheads,@JsonKey(name: 'gear_recommendations') List<GearRecommendationModel>? gearRecommendations,@JsonKey(name: 'first_aid_items') List<FirstAidItemModel>? firstAidItems,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'updated_at') DateTime? updatedAt
});




}
/// @nodoc
class __$MountainModelCopyWithImpl<$Res>
    implements _$MountainModelCopyWith<$Res> {
  __$MountainModelCopyWithImpl(this._self, this._then);

  final _MountainModel _self;
  final $Res Function(_MountainModel) _then;

/// Create a copy of MountainModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? slug = null,Object? name = null,Object? region = null,Object? elevation = null,Object? difficulty = null,Object? description = freezed,Object? imageUrl = freezed,Object? status = null,Object? feeWni = null,Object? feeWna = null,Object? avenzaMapUrl = freezed,Object? trailheads = freezed,Object? gearRecommendations = freezed,Object? firstAidItems = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_MountainModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,region: null == region ? _self.region : region // ignore: cast_nullable_to_non_nullable
as String,elevation: null == elevation ? _self.elevation : elevation // ignore: cast_nullable_to_non_nullable
as int,difficulty: null == difficulty ? _self.difficulty : difficulty // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,feeWni: null == feeWni ? _self.feeWni : feeWni // ignore: cast_nullable_to_non_nullable
as String,feeWna: null == feeWna ? _self.feeWna : feeWna // ignore: cast_nullable_to_non_nullable
as String,avenzaMapUrl: freezed == avenzaMapUrl ? _self.avenzaMapUrl : avenzaMapUrl // ignore: cast_nullable_to_non_nullable
as String?,trailheads: freezed == trailheads ? _self._trailheads : trailheads // ignore: cast_nullable_to_non_nullable
as List<TrailheadModel>?,gearRecommendations: freezed == gearRecommendations ? _self._gearRecommendations : gearRecommendations // ignore: cast_nullable_to_non_nullable
as List<GearRecommendationModel>?,firstAidItems: freezed == firstAidItems ? _self._firstAidItems : firstAidItems // ignore: cast_nullable_to_non_nullable
as List<FirstAidItemModel>?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
