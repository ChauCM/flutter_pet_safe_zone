// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'theme_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ThemeState {

 bool get isHighContrast; AppThemeConfig get themeConfig;
/// Create a copy of ThemeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ThemeStateCopyWith<ThemeState> get copyWith => _$ThemeStateCopyWithImpl<ThemeState>(this as ThemeState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ThemeState&&(identical(other.isHighContrast, isHighContrast) || other.isHighContrast == isHighContrast)&&(identical(other.themeConfig, themeConfig) || other.themeConfig == themeConfig));
}


@override
int get hashCode => Object.hash(runtimeType,isHighContrast,themeConfig);

@override
String toString() {
  return 'ThemeState(isHighContrast: $isHighContrast, themeConfig: $themeConfig)';
}


}

/// @nodoc
abstract mixin class $ThemeStateCopyWith<$Res>  {
  factory $ThemeStateCopyWith(ThemeState value, $Res Function(ThemeState) _then) = _$ThemeStateCopyWithImpl;
@useResult
$Res call({
 bool isHighContrast, AppThemeConfig themeConfig
});


$AppThemeConfigCopyWith<$Res> get themeConfig;

}
/// @nodoc
class _$ThemeStateCopyWithImpl<$Res>
    implements $ThemeStateCopyWith<$Res> {
  _$ThemeStateCopyWithImpl(this._self, this._then);

  final ThemeState _self;
  final $Res Function(ThemeState) _then;

/// Create a copy of ThemeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isHighContrast = null,Object? themeConfig = null,}) {
  return _then(_self.copyWith(
isHighContrast: null == isHighContrast ? _self.isHighContrast : isHighContrast // ignore: cast_nullable_to_non_nullable
as bool,themeConfig: null == themeConfig ? _self.themeConfig : themeConfig // ignore: cast_nullable_to_non_nullable
as AppThemeConfig,
  ));
}
/// Create a copy of ThemeState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AppThemeConfigCopyWith<$Res> get themeConfig {
  
  return $AppThemeConfigCopyWith<$Res>(_self.themeConfig, (value) {
    return _then(_self.copyWith(themeConfig: value));
  });
}
}


/// Adds pattern-matching-related methods to [ThemeState].
extension ThemeStatePatterns on ThemeState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ThemeState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ThemeState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ThemeState value)  $default,){
final _that = this;
switch (_that) {
case _ThemeState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ThemeState value)?  $default,){
final _that = this;
switch (_that) {
case _ThemeState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isHighContrast,  AppThemeConfig themeConfig)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ThemeState() when $default != null:
return $default(_that.isHighContrast,_that.themeConfig);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isHighContrast,  AppThemeConfig themeConfig)  $default,) {final _that = this;
switch (_that) {
case _ThemeState():
return $default(_that.isHighContrast,_that.themeConfig);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isHighContrast,  AppThemeConfig themeConfig)?  $default,) {final _that = this;
switch (_that) {
case _ThemeState() when $default != null:
return $default(_that.isHighContrast,_that.themeConfig);case _:
  return null;

}
}

}

/// @nodoc


class _ThemeState extends ThemeState {
  const _ThemeState({required this.isHighContrast, required this.themeConfig}): super._();
  

@override final  bool isHighContrast;
@override final  AppThemeConfig themeConfig;

/// Create a copy of ThemeState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ThemeStateCopyWith<_ThemeState> get copyWith => __$ThemeStateCopyWithImpl<_ThemeState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ThemeState&&(identical(other.isHighContrast, isHighContrast) || other.isHighContrast == isHighContrast)&&(identical(other.themeConfig, themeConfig) || other.themeConfig == themeConfig));
}


@override
int get hashCode => Object.hash(runtimeType,isHighContrast,themeConfig);

@override
String toString() {
  return 'ThemeState(isHighContrast: $isHighContrast, themeConfig: $themeConfig)';
}


}

/// @nodoc
abstract mixin class _$ThemeStateCopyWith<$Res> implements $ThemeStateCopyWith<$Res> {
  factory _$ThemeStateCopyWith(_ThemeState value, $Res Function(_ThemeState) _then) = __$ThemeStateCopyWithImpl;
@override @useResult
$Res call({
 bool isHighContrast, AppThemeConfig themeConfig
});


@override $AppThemeConfigCopyWith<$Res> get themeConfig;

}
/// @nodoc
class __$ThemeStateCopyWithImpl<$Res>
    implements _$ThemeStateCopyWith<$Res> {
  __$ThemeStateCopyWithImpl(this._self, this._then);

  final _ThemeState _self;
  final $Res Function(_ThemeState) _then;

/// Create a copy of ThemeState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isHighContrast = null,Object? themeConfig = null,}) {
  return _then(_ThemeState(
isHighContrast: null == isHighContrast ? _self.isHighContrast : isHighContrast // ignore: cast_nullable_to_non_nullable
as bool,themeConfig: null == themeConfig ? _self.themeConfig : themeConfig // ignore: cast_nullable_to_non_nullable
as AppThemeConfig,
  ));
}

/// Create a copy of ThemeState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AppThemeConfigCopyWith<$Res> get themeConfig {
  
  return $AppThemeConfigCopyWith<$Res>(_self.themeConfig, (value) {
    return _then(_self.copyWith(themeConfig: value));
  });
}
}

// dart format on
