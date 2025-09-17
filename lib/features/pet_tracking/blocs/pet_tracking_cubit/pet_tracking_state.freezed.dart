// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pet_tracking_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PetTrackingState {

 PetLocationDpo get petLocation;
/// Create a copy of PetTrackingState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PetTrackingStateCopyWith<PetTrackingState> get copyWith => _$PetTrackingStateCopyWithImpl<PetTrackingState>(this as PetTrackingState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PetTrackingState&&(identical(other.petLocation, petLocation) || other.petLocation == petLocation));
}


@override
int get hashCode => Object.hash(runtimeType,petLocation);

@override
String toString() {
  return 'PetTrackingState(petLocation: $petLocation)';
}


}

/// @nodoc
abstract mixin class $PetTrackingStateCopyWith<$Res>  {
  factory $PetTrackingStateCopyWith(PetTrackingState value, $Res Function(PetTrackingState) _then) = _$PetTrackingStateCopyWithImpl;
@useResult
$Res call({
 PetLocationDpo petLocation
});


$PetLocationDpoCopyWith<$Res> get petLocation;

}
/// @nodoc
class _$PetTrackingStateCopyWithImpl<$Res>
    implements $PetTrackingStateCopyWith<$Res> {
  _$PetTrackingStateCopyWithImpl(this._self, this._then);

  final PetTrackingState _self;
  final $Res Function(PetTrackingState) _then;

/// Create a copy of PetTrackingState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? petLocation = null,}) {
  return _then(_self.copyWith(
petLocation: null == petLocation ? _self.petLocation : petLocation // ignore: cast_nullable_to_non_nullable
as PetLocationDpo,
  ));
}
/// Create a copy of PetTrackingState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PetLocationDpoCopyWith<$Res> get petLocation {
  
  return $PetLocationDpoCopyWith<$Res>(_self.petLocation, (value) {
    return _then(_self.copyWith(petLocation: value));
  });
}
}


/// Adds pattern-matching-related methods to [PetTrackingState].
extension PetTrackingStatePatterns on PetTrackingState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PetTrackingState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PetTrackingState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PetTrackingState value)  $default,){
final _that = this;
switch (_that) {
case _PetTrackingState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PetTrackingState value)?  $default,){
final _that = this;
switch (_that) {
case _PetTrackingState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PetLocationDpo petLocation)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PetTrackingState() when $default != null:
return $default(_that.petLocation);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PetLocationDpo petLocation)  $default,) {final _that = this;
switch (_that) {
case _PetTrackingState():
return $default(_that.petLocation);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PetLocationDpo petLocation)?  $default,) {final _that = this;
switch (_that) {
case _PetTrackingState() when $default != null:
return $default(_that.petLocation);case _:
  return null;

}
}

}

/// @nodoc


class _PetTrackingState implements PetTrackingState {
  const _PetTrackingState({required this.petLocation});
  

@override final  PetLocationDpo petLocation;

/// Create a copy of PetTrackingState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PetTrackingStateCopyWith<_PetTrackingState> get copyWith => __$PetTrackingStateCopyWithImpl<_PetTrackingState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PetTrackingState&&(identical(other.petLocation, petLocation) || other.petLocation == petLocation));
}


@override
int get hashCode => Object.hash(runtimeType,petLocation);

@override
String toString() {
  return 'PetTrackingState(petLocation: $petLocation)';
}


}

/// @nodoc
abstract mixin class _$PetTrackingStateCopyWith<$Res> implements $PetTrackingStateCopyWith<$Res> {
  factory _$PetTrackingStateCopyWith(_PetTrackingState value, $Res Function(_PetTrackingState) _then) = __$PetTrackingStateCopyWithImpl;
@override @useResult
$Res call({
 PetLocationDpo petLocation
});


@override $PetLocationDpoCopyWith<$Res> get petLocation;

}
/// @nodoc
class __$PetTrackingStateCopyWithImpl<$Res>
    implements _$PetTrackingStateCopyWith<$Res> {
  __$PetTrackingStateCopyWithImpl(this._self, this._then);

  final _PetTrackingState _self;
  final $Res Function(_PetTrackingState) _then;

/// Create a copy of PetTrackingState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? petLocation = null,}) {
  return _then(_PetTrackingState(
petLocation: null == petLocation ? _self.petLocation : petLocation // ignore: cast_nullable_to_non_nullable
as PetLocationDpo,
  ));
}

/// Create a copy of PetTrackingState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PetLocationDpoCopyWith<$Res> get petLocation {
  
  return $PetLocationDpoCopyWith<$Res>(_self.petLocation, (value) {
    return _then(_self.copyWith(petLocation: value));
  });
}
}

// dart format on
