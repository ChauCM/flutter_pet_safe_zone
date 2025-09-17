// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pet_location_dpo.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PetLocationDpo {

 LatLng get currentLocation; bool get isInsideSafeZone; double get distanceFromHome;
/// Create a copy of PetLocationDpo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PetLocationDpoCopyWith<PetLocationDpo> get copyWith => _$PetLocationDpoCopyWithImpl<PetLocationDpo>(this as PetLocationDpo, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PetLocationDpo&&(identical(other.currentLocation, currentLocation) || other.currentLocation == currentLocation)&&(identical(other.isInsideSafeZone, isInsideSafeZone) || other.isInsideSafeZone == isInsideSafeZone)&&(identical(other.distanceFromHome, distanceFromHome) || other.distanceFromHome == distanceFromHome));
}


@override
int get hashCode => Object.hash(runtimeType,currentLocation,isInsideSafeZone,distanceFromHome);

@override
String toString() {
  return 'PetLocationDpo(currentLocation: $currentLocation, isInsideSafeZone: $isInsideSafeZone, distanceFromHome: $distanceFromHome)';
}


}

/// @nodoc
abstract mixin class $PetLocationDpoCopyWith<$Res>  {
  factory $PetLocationDpoCopyWith(PetLocationDpo value, $Res Function(PetLocationDpo) _then) = _$PetLocationDpoCopyWithImpl;
@useResult
$Res call({
 LatLng currentLocation, bool isInsideSafeZone, double distanceFromHome
});




}
/// @nodoc
class _$PetLocationDpoCopyWithImpl<$Res>
    implements $PetLocationDpoCopyWith<$Res> {
  _$PetLocationDpoCopyWithImpl(this._self, this._then);

  final PetLocationDpo _self;
  final $Res Function(PetLocationDpo) _then;

/// Create a copy of PetLocationDpo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? currentLocation = null,Object? isInsideSafeZone = null,Object? distanceFromHome = null,}) {
  return _then(_self.copyWith(
currentLocation: null == currentLocation ? _self.currentLocation : currentLocation // ignore: cast_nullable_to_non_nullable
as LatLng,isInsideSafeZone: null == isInsideSafeZone ? _self.isInsideSafeZone : isInsideSafeZone // ignore: cast_nullable_to_non_nullable
as bool,distanceFromHome: null == distanceFromHome ? _self.distanceFromHome : distanceFromHome // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [PetLocationDpo].
extension PetLocationDpoPatterns on PetLocationDpo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PetLocationDpo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PetLocationDpo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PetLocationDpo value)  $default,){
final _that = this;
switch (_that) {
case _PetLocationDpo():
return $default(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PetLocationDpo value)?  $default,){
final _that = this;
switch (_that) {
case _PetLocationDpo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( LatLng currentLocation,  bool isInsideSafeZone,  double distanceFromHome)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PetLocationDpo() when $default != null:
return $default(_that.currentLocation,_that.isInsideSafeZone,_that.distanceFromHome);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( LatLng currentLocation,  bool isInsideSafeZone,  double distanceFromHome)  $default,) {final _that = this;
switch (_that) {
case _PetLocationDpo():
return $default(_that.currentLocation,_that.isInsideSafeZone,_that.distanceFromHome);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( LatLng currentLocation,  bool isInsideSafeZone,  double distanceFromHome)?  $default,) {final _that = this;
switch (_that) {
case _PetLocationDpo() when $default != null:
return $default(_that.currentLocation,_that.isInsideSafeZone,_that.distanceFromHome);case _:
  return null;

}
}

}

/// @nodoc


class _PetLocationDpo implements PetLocationDpo {
  const _PetLocationDpo({required this.currentLocation, required this.isInsideSafeZone, required this.distanceFromHome});
  

@override final  LatLng currentLocation;
@override final  bool isInsideSafeZone;
@override final  double distanceFromHome;

/// Create a copy of PetLocationDpo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PetLocationDpoCopyWith<_PetLocationDpo> get copyWith => __$PetLocationDpoCopyWithImpl<_PetLocationDpo>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PetLocationDpo&&(identical(other.currentLocation, currentLocation) || other.currentLocation == currentLocation)&&(identical(other.isInsideSafeZone, isInsideSafeZone) || other.isInsideSafeZone == isInsideSafeZone)&&(identical(other.distanceFromHome, distanceFromHome) || other.distanceFromHome == distanceFromHome));
}


@override
int get hashCode => Object.hash(runtimeType,currentLocation,isInsideSafeZone,distanceFromHome);

@override
String toString() {
  return 'PetLocationDpo(currentLocation: $currentLocation, isInsideSafeZone: $isInsideSafeZone, distanceFromHome: $distanceFromHome)';
}


}

/// @nodoc
abstract mixin class _$PetLocationDpoCopyWith<$Res> implements $PetLocationDpoCopyWith<$Res> {
  factory _$PetLocationDpoCopyWith(_PetLocationDpo value, $Res Function(_PetLocationDpo) _then) = __$PetLocationDpoCopyWithImpl;
@override @useResult
$Res call({
 LatLng currentLocation, bool isInsideSafeZone, double distanceFromHome
});




}
/// @nodoc
class __$PetLocationDpoCopyWithImpl<$Res>
    implements _$PetLocationDpoCopyWith<$Res> {
  __$PetLocationDpoCopyWithImpl(this._self, this._then);

  final _PetLocationDpo _self;
  final $Res Function(_PetLocationDpo) _then;

/// Create a copy of PetLocationDpo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? currentLocation = null,Object? isInsideSafeZone = null,Object? distanceFromHome = null,}) {
  return _then(_PetLocationDpo(
currentLocation: null == currentLocation ? _self.currentLocation : currentLocation // ignore: cast_nullable_to_non_nullable
as LatLng,isInsideSafeZone: null == isInsideSafeZone ? _self.isInsideSafeZone : isInsideSafeZone // ignore: cast_nullable_to_non_nullable
as bool,distanceFromHome: null == distanceFromHome ? _self.distanceFromHome : distanceFromHome // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
