// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'forecast_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ForecastResponse {

 List<ForecastItem> get list;
/// Create a copy of ForecastResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ForecastResponseCopyWith<ForecastResponse> get copyWith => _$ForecastResponseCopyWithImpl<ForecastResponse>(this as ForecastResponse, _$identity);

  /// Serializes this ForecastResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ForecastResponse&&const DeepCollectionEquality().equals(other.list, list));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(list));

@override
String toString() {
  return 'ForecastResponse(list: $list)';
}


}

/// @nodoc
abstract mixin class $ForecastResponseCopyWith<$Res>  {
  factory $ForecastResponseCopyWith(ForecastResponse value, $Res Function(ForecastResponse) _then) = _$ForecastResponseCopyWithImpl;
@useResult
$Res call({
 List<ForecastItem> list
});




}
/// @nodoc
class _$ForecastResponseCopyWithImpl<$Res>
    implements $ForecastResponseCopyWith<$Res> {
  _$ForecastResponseCopyWithImpl(this._self, this._then);

  final ForecastResponse _self;
  final $Res Function(ForecastResponse) _then;

/// Create a copy of ForecastResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? list = null,}) {
  return _then(_self.copyWith(
list: null == list ? _self.list : list // ignore: cast_nullable_to_non_nullable
as List<ForecastItem>,
  ));
}

}


/// Adds pattern-matching-related methods to [ForecastResponse].
extension ForecastResponsePatterns on ForecastResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ForecastResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ForecastResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ForecastResponse value)  $default,){
final _that = this;
switch (_that) {
case _ForecastResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ForecastResponse value)?  $default,){
final _that = this;
switch (_that) {
case _ForecastResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<ForecastItem> list)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ForecastResponse() when $default != null:
return $default(_that.list);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<ForecastItem> list)  $default,) {final _that = this;
switch (_that) {
case _ForecastResponse():
return $default(_that.list);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<ForecastItem> list)?  $default,) {final _that = this;
switch (_that) {
case _ForecastResponse() when $default != null:
return $default(_that.list);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ForecastResponse implements ForecastResponse {
  const _ForecastResponse({required final  List<ForecastItem> list}): _list = list;
  factory _ForecastResponse.fromJson(Map<String, dynamic> json) => _$ForecastResponseFromJson(json);

 final  List<ForecastItem> _list;
@override List<ForecastItem> get list {
  if (_list is EqualUnmodifiableListView) return _list;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_list);
}


/// Create a copy of ForecastResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ForecastResponseCopyWith<_ForecastResponse> get copyWith => __$ForecastResponseCopyWithImpl<_ForecastResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ForecastResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ForecastResponse&&const DeepCollectionEquality().equals(other._list, _list));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_list));

@override
String toString() {
  return 'ForecastResponse(list: $list)';
}


}

/// @nodoc
abstract mixin class _$ForecastResponseCopyWith<$Res> implements $ForecastResponseCopyWith<$Res> {
  factory _$ForecastResponseCopyWith(_ForecastResponse value, $Res Function(_ForecastResponse) _then) = __$ForecastResponseCopyWithImpl;
@override @useResult
$Res call({
 List<ForecastItem> list
});




}
/// @nodoc
class __$ForecastResponseCopyWithImpl<$Res>
    implements _$ForecastResponseCopyWith<$Res> {
  __$ForecastResponseCopyWithImpl(this._self, this._then);

  final _ForecastResponse _self;
  final $Res Function(_ForecastResponse) _then;

/// Create a copy of ForecastResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? list = null,}) {
  return _then(_ForecastResponse(
list: null == list ? _self._list : list // ignore: cast_nullable_to_non_nullable
as List<ForecastItem>,
  ));
}


}


/// @nodoc
mixin _$ForecastItem {

 int get dt; WeatherMain get main; List<WeatherCondition> get weather; WeatherWind get wind;
/// Create a copy of ForecastItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ForecastItemCopyWith<ForecastItem> get copyWith => _$ForecastItemCopyWithImpl<ForecastItem>(this as ForecastItem, _$identity);

  /// Serializes this ForecastItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ForecastItem&&(identical(other.dt, dt) || other.dt == dt)&&(identical(other.main, main) || other.main == main)&&const DeepCollectionEquality().equals(other.weather, weather)&&(identical(other.wind, wind) || other.wind == wind));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,dt,main,const DeepCollectionEquality().hash(weather),wind);

@override
String toString() {
  return 'ForecastItem(dt: $dt, main: $main, weather: $weather, wind: $wind)';
}


}

/// @nodoc
abstract mixin class $ForecastItemCopyWith<$Res>  {
  factory $ForecastItemCopyWith(ForecastItem value, $Res Function(ForecastItem) _then) = _$ForecastItemCopyWithImpl;
@useResult
$Res call({
 int dt, WeatherMain main, List<WeatherCondition> weather, WeatherWind wind
});


$WeatherMainCopyWith<$Res> get main;$WeatherWindCopyWith<$Res> get wind;

}
/// @nodoc
class _$ForecastItemCopyWithImpl<$Res>
    implements $ForecastItemCopyWith<$Res> {
  _$ForecastItemCopyWithImpl(this._self, this._then);

  final ForecastItem _self;
  final $Res Function(ForecastItem) _then;

/// Create a copy of ForecastItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? dt = null,Object? main = null,Object? weather = null,Object? wind = null,}) {
  return _then(_self.copyWith(
dt: null == dt ? _self.dt : dt // ignore: cast_nullable_to_non_nullable
as int,main: null == main ? _self.main : main // ignore: cast_nullable_to_non_nullable
as WeatherMain,weather: null == weather ? _self.weather : weather // ignore: cast_nullable_to_non_nullable
as List<WeatherCondition>,wind: null == wind ? _self.wind : wind // ignore: cast_nullable_to_non_nullable
as WeatherWind,
  ));
}
/// Create a copy of ForecastItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WeatherMainCopyWith<$Res> get main {
  
  return $WeatherMainCopyWith<$Res>(_self.main, (value) {
    return _then(_self.copyWith(main: value));
  });
}/// Create a copy of ForecastItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WeatherWindCopyWith<$Res> get wind {
  
  return $WeatherWindCopyWith<$Res>(_self.wind, (value) {
    return _then(_self.copyWith(wind: value));
  });
}
}


/// Adds pattern-matching-related methods to [ForecastItem].
extension ForecastItemPatterns on ForecastItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ForecastItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ForecastItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ForecastItem value)  $default,){
final _that = this;
switch (_that) {
case _ForecastItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ForecastItem value)?  $default,){
final _that = this;
switch (_that) {
case _ForecastItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int dt,  WeatherMain main,  List<WeatherCondition> weather,  WeatherWind wind)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ForecastItem() when $default != null:
return $default(_that.dt,_that.main,_that.weather,_that.wind);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int dt,  WeatherMain main,  List<WeatherCondition> weather,  WeatherWind wind)  $default,) {final _that = this;
switch (_that) {
case _ForecastItem():
return $default(_that.dt,_that.main,_that.weather,_that.wind);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int dt,  WeatherMain main,  List<WeatherCondition> weather,  WeatherWind wind)?  $default,) {final _that = this;
switch (_that) {
case _ForecastItem() when $default != null:
return $default(_that.dt,_that.main,_that.weather,_that.wind);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ForecastItem implements ForecastItem {
  const _ForecastItem({required this.dt, required this.main, required final  List<WeatherCondition> weather, required this.wind}): _weather = weather;
  factory _ForecastItem.fromJson(Map<String, dynamic> json) => _$ForecastItemFromJson(json);

@override final  int dt;
@override final  WeatherMain main;
 final  List<WeatherCondition> _weather;
@override List<WeatherCondition> get weather {
  if (_weather is EqualUnmodifiableListView) return _weather;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_weather);
}

@override final  WeatherWind wind;

/// Create a copy of ForecastItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ForecastItemCopyWith<_ForecastItem> get copyWith => __$ForecastItemCopyWithImpl<_ForecastItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ForecastItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ForecastItem&&(identical(other.dt, dt) || other.dt == dt)&&(identical(other.main, main) || other.main == main)&&const DeepCollectionEquality().equals(other._weather, _weather)&&(identical(other.wind, wind) || other.wind == wind));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,dt,main,const DeepCollectionEquality().hash(_weather),wind);

@override
String toString() {
  return 'ForecastItem(dt: $dt, main: $main, weather: $weather, wind: $wind)';
}


}

/// @nodoc
abstract mixin class _$ForecastItemCopyWith<$Res> implements $ForecastItemCopyWith<$Res> {
  factory _$ForecastItemCopyWith(_ForecastItem value, $Res Function(_ForecastItem) _then) = __$ForecastItemCopyWithImpl;
@override @useResult
$Res call({
 int dt, WeatherMain main, List<WeatherCondition> weather, WeatherWind wind
});


@override $WeatherMainCopyWith<$Res> get main;@override $WeatherWindCopyWith<$Res> get wind;

}
/// @nodoc
class __$ForecastItemCopyWithImpl<$Res>
    implements _$ForecastItemCopyWith<$Res> {
  __$ForecastItemCopyWithImpl(this._self, this._then);

  final _ForecastItem _self;
  final $Res Function(_ForecastItem) _then;

/// Create a copy of ForecastItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? dt = null,Object? main = null,Object? weather = null,Object? wind = null,}) {
  return _then(_ForecastItem(
dt: null == dt ? _self.dt : dt // ignore: cast_nullable_to_non_nullable
as int,main: null == main ? _self.main : main // ignore: cast_nullable_to_non_nullable
as WeatherMain,weather: null == weather ? _self._weather : weather // ignore: cast_nullable_to_non_nullable
as List<WeatherCondition>,wind: null == wind ? _self.wind : wind // ignore: cast_nullable_to_non_nullable
as WeatherWind,
  ));
}

/// Create a copy of ForecastItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WeatherMainCopyWith<$Res> get main {
  
  return $WeatherMainCopyWith<$Res>(_self.main, (value) {
    return _then(_self.copyWith(main: value));
  });
}/// Create a copy of ForecastItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WeatherWindCopyWith<$Res> get wind {
  
  return $WeatherWindCopyWith<$Res>(_self.wind, (value) {
    return _then(_self.copyWith(wind: value));
  });
}
}

// dart format on
