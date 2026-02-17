// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weather_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WeatherModel {

 WeatherMain get main; List<WeatherCondition> get weather; WeatherWind get wind; String get name;
/// Create a copy of WeatherModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WeatherModelCopyWith<WeatherModel> get copyWith => _$WeatherModelCopyWithImpl<WeatherModel>(this as WeatherModel, _$identity);

  /// Serializes this WeatherModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WeatherModel&&(identical(other.main, main) || other.main == main)&&const DeepCollectionEquality().equals(other.weather, weather)&&(identical(other.wind, wind) || other.wind == wind)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,main,const DeepCollectionEquality().hash(weather),wind,name);

@override
String toString() {
  return 'WeatherModel(main: $main, weather: $weather, wind: $wind, name: $name)';
}


}

/// @nodoc
abstract mixin class $WeatherModelCopyWith<$Res>  {
  factory $WeatherModelCopyWith(WeatherModel value, $Res Function(WeatherModel) _then) = _$WeatherModelCopyWithImpl;
@useResult
$Res call({
 WeatherMain main, List<WeatherCondition> weather, WeatherWind wind, String name
});


$WeatherMainCopyWith<$Res> get main;$WeatherWindCopyWith<$Res> get wind;

}
/// @nodoc
class _$WeatherModelCopyWithImpl<$Res>
    implements $WeatherModelCopyWith<$Res> {
  _$WeatherModelCopyWithImpl(this._self, this._then);

  final WeatherModel _self;
  final $Res Function(WeatherModel) _then;

/// Create a copy of WeatherModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? main = null,Object? weather = null,Object? wind = null,Object? name = null,}) {
  return _then(_self.copyWith(
main: null == main ? _self.main : main // ignore: cast_nullable_to_non_nullable
as WeatherMain,weather: null == weather ? _self.weather : weather // ignore: cast_nullable_to_non_nullable
as List<WeatherCondition>,wind: null == wind ? _self.wind : wind // ignore: cast_nullable_to_non_nullable
as WeatherWind,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of WeatherModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WeatherMainCopyWith<$Res> get main {
  
  return $WeatherMainCopyWith<$Res>(_self.main, (value) {
    return _then(_self.copyWith(main: value));
  });
}/// Create a copy of WeatherModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WeatherWindCopyWith<$Res> get wind {
  
  return $WeatherWindCopyWith<$Res>(_self.wind, (value) {
    return _then(_self.copyWith(wind: value));
  });
}
}


/// Adds pattern-matching-related methods to [WeatherModel].
extension WeatherModelPatterns on WeatherModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WeatherModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WeatherModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WeatherModel value)  $default,){
final _that = this;
switch (_that) {
case _WeatherModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WeatherModel value)?  $default,){
final _that = this;
switch (_that) {
case _WeatherModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( WeatherMain main,  List<WeatherCondition> weather,  WeatherWind wind,  String name)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WeatherModel() when $default != null:
return $default(_that.main,_that.weather,_that.wind,_that.name);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( WeatherMain main,  List<WeatherCondition> weather,  WeatherWind wind,  String name)  $default,) {final _that = this;
switch (_that) {
case _WeatherModel():
return $default(_that.main,_that.weather,_that.wind,_that.name);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( WeatherMain main,  List<WeatherCondition> weather,  WeatherWind wind,  String name)?  $default,) {final _that = this;
switch (_that) {
case _WeatherModel() when $default != null:
return $default(_that.main,_that.weather,_that.wind,_that.name);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WeatherModel implements WeatherModel {
  const _WeatherModel({required this.main, required final  List<WeatherCondition> weather, required this.wind, required this.name}): _weather = weather;
  factory _WeatherModel.fromJson(Map<String, dynamic> json) => _$WeatherModelFromJson(json);

@override final  WeatherMain main;
 final  List<WeatherCondition> _weather;
@override List<WeatherCondition> get weather {
  if (_weather is EqualUnmodifiableListView) return _weather;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_weather);
}

@override final  WeatherWind wind;
@override final  String name;

/// Create a copy of WeatherModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WeatherModelCopyWith<_WeatherModel> get copyWith => __$WeatherModelCopyWithImpl<_WeatherModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WeatherModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WeatherModel&&(identical(other.main, main) || other.main == main)&&const DeepCollectionEquality().equals(other._weather, _weather)&&(identical(other.wind, wind) || other.wind == wind)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,main,const DeepCollectionEquality().hash(_weather),wind,name);

@override
String toString() {
  return 'WeatherModel(main: $main, weather: $weather, wind: $wind, name: $name)';
}


}

/// @nodoc
abstract mixin class _$WeatherModelCopyWith<$Res> implements $WeatherModelCopyWith<$Res> {
  factory _$WeatherModelCopyWith(_WeatherModel value, $Res Function(_WeatherModel) _then) = __$WeatherModelCopyWithImpl;
@override @useResult
$Res call({
 WeatherMain main, List<WeatherCondition> weather, WeatherWind wind, String name
});


@override $WeatherMainCopyWith<$Res> get main;@override $WeatherWindCopyWith<$Res> get wind;

}
/// @nodoc
class __$WeatherModelCopyWithImpl<$Res>
    implements _$WeatherModelCopyWith<$Res> {
  __$WeatherModelCopyWithImpl(this._self, this._then);

  final _WeatherModel _self;
  final $Res Function(_WeatherModel) _then;

/// Create a copy of WeatherModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? main = null,Object? weather = null,Object? wind = null,Object? name = null,}) {
  return _then(_WeatherModel(
main: null == main ? _self.main : main // ignore: cast_nullable_to_non_nullable
as WeatherMain,weather: null == weather ? _self._weather : weather // ignore: cast_nullable_to_non_nullable
as List<WeatherCondition>,wind: null == wind ? _self.wind : wind // ignore: cast_nullable_to_non_nullable
as WeatherWind,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of WeatherModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WeatherMainCopyWith<$Res> get main {
  
  return $WeatherMainCopyWith<$Res>(_self.main, (value) {
    return _then(_self.copyWith(main: value));
  });
}/// Create a copy of WeatherModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WeatherWindCopyWith<$Res> get wind {
  
  return $WeatherWindCopyWith<$Res>(_self.wind, (value) {
    return _then(_self.copyWith(wind: value));
  });
}
}


/// @nodoc
mixin _$WeatherMain {

 double get temp;@JsonKey(name: 'feels_like') double get feelsLike; int get humidity; int get pressure;
/// Create a copy of WeatherMain
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WeatherMainCopyWith<WeatherMain> get copyWith => _$WeatherMainCopyWithImpl<WeatherMain>(this as WeatherMain, _$identity);

  /// Serializes this WeatherMain to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WeatherMain&&(identical(other.temp, temp) || other.temp == temp)&&(identical(other.feelsLike, feelsLike) || other.feelsLike == feelsLike)&&(identical(other.humidity, humidity) || other.humidity == humidity)&&(identical(other.pressure, pressure) || other.pressure == pressure));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,temp,feelsLike,humidity,pressure);

@override
String toString() {
  return 'WeatherMain(temp: $temp, feelsLike: $feelsLike, humidity: $humidity, pressure: $pressure)';
}


}

/// @nodoc
abstract mixin class $WeatherMainCopyWith<$Res>  {
  factory $WeatherMainCopyWith(WeatherMain value, $Res Function(WeatherMain) _then) = _$WeatherMainCopyWithImpl;
@useResult
$Res call({
 double temp,@JsonKey(name: 'feels_like') double feelsLike, int humidity, int pressure
});




}
/// @nodoc
class _$WeatherMainCopyWithImpl<$Res>
    implements $WeatherMainCopyWith<$Res> {
  _$WeatherMainCopyWithImpl(this._self, this._then);

  final WeatherMain _self;
  final $Res Function(WeatherMain) _then;

/// Create a copy of WeatherMain
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? temp = null,Object? feelsLike = null,Object? humidity = null,Object? pressure = null,}) {
  return _then(_self.copyWith(
temp: null == temp ? _self.temp : temp // ignore: cast_nullable_to_non_nullable
as double,feelsLike: null == feelsLike ? _self.feelsLike : feelsLike // ignore: cast_nullable_to_non_nullable
as double,humidity: null == humidity ? _self.humidity : humidity // ignore: cast_nullable_to_non_nullable
as int,pressure: null == pressure ? _self.pressure : pressure // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [WeatherMain].
extension WeatherMainPatterns on WeatherMain {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WeatherMain value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WeatherMain() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WeatherMain value)  $default,){
final _that = this;
switch (_that) {
case _WeatherMain():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WeatherMain value)?  $default,){
final _that = this;
switch (_that) {
case _WeatherMain() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double temp, @JsonKey(name: 'feels_like')  double feelsLike,  int humidity,  int pressure)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WeatherMain() when $default != null:
return $default(_that.temp,_that.feelsLike,_that.humidity,_that.pressure);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double temp, @JsonKey(name: 'feels_like')  double feelsLike,  int humidity,  int pressure)  $default,) {final _that = this;
switch (_that) {
case _WeatherMain():
return $default(_that.temp,_that.feelsLike,_that.humidity,_that.pressure);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double temp, @JsonKey(name: 'feels_like')  double feelsLike,  int humidity,  int pressure)?  $default,) {final _that = this;
switch (_that) {
case _WeatherMain() when $default != null:
return $default(_that.temp,_that.feelsLike,_that.humidity,_that.pressure);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WeatherMain implements WeatherMain {
  const _WeatherMain({required this.temp, @JsonKey(name: 'feels_like') required this.feelsLike, required this.humidity, required this.pressure});
  factory _WeatherMain.fromJson(Map<String, dynamic> json) => _$WeatherMainFromJson(json);

@override final  double temp;
@override@JsonKey(name: 'feels_like') final  double feelsLike;
@override final  int humidity;
@override final  int pressure;

/// Create a copy of WeatherMain
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WeatherMainCopyWith<_WeatherMain> get copyWith => __$WeatherMainCopyWithImpl<_WeatherMain>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WeatherMainToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WeatherMain&&(identical(other.temp, temp) || other.temp == temp)&&(identical(other.feelsLike, feelsLike) || other.feelsLike == feelsLike)&&(identical(other.humidity, humidity) || other.humidity == humidity)&&(identical(other.pressure, pressure) || other.pressure == pressure));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,temp,feelsLike,humidity,pressure);

@override
String toString() {
  return 'WeatherMain(temp: $temp, feelsLike: $feelsLike, humidity: $humidity, pressure: $pressure)';
}


}

/// @nodoc
abstract mixin class _$WeatherMainCopyWith<$Res> implements $WeatherMainCopyWith<$Res> {
  factory _$WeatherMainCopyWith(_WeatherMain value, $Res Function(_WeatherMain) _then) = __$WeatherMainCopyWithImpl;
@override @useResult
$Res call({
 double temp,@JsonKey(name: 'feels_like') double feelsLike, int humidity, int pressure
});




}
/// @nodoc
class __$WeatherMainCopyWithImpl<$Res>
    implements _$WeatherMainCopyWith<$Res> {
  __$WeatherMainCopyWithImpl(this._self, this._then);

  final _WeatherMain _self;
  final $Res Function(_WeatherMain) _then;

/// Create a copy of WeatherMain
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? temp = null,Object? feelsLike = null,Object? humidity = null,Object? pressure = null,}) {
  return _then(_WeatherMain(
temp: null == temp ? _self.temp : temp // ignore: cast_nullable_to_non_nullable
as double,feelsLike: null == feelsLike ? _self.feelsLike : feelsLike // ignore: cast_nullable_to_non_nullable
as double,humidity: null == humidity ? _self.humidity : humidity // ignore: cast_nullable_to_non_nullable
as int,pressure: null == pressure ? _self.pressure : pressure // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$WeatherCondition {

 String get main; String get description; String get icon;
/// Create a copy of WeatherCondition
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WeatherConditionCopyWith<WeatherCondition> get copyWith => _$WeatherConditionCopyWithImpl<WeatherCondition>(this as WeatherCondition, _$identity);

  /// Serializes this WeatherCondition to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WeatherCondition&&(identical(other.main, main) || other.main == main)&&(identical(other.description, description) || other.description == description)&&(identical(other.icon, icon) || other.icon == icon));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,main,description,icon);

@override
String toString() {
  return 'WeatherCondition(main: $main, description: $description, icon: $icon)';
}


}

/// @nodoc
abstract mixin class $WeatherConditionCopyWith<$Res>  {
  factory $WeatherConditionCopyWith(WeatherCondition value, $Res Function(WeatherCondition) _then) = _$WeatherConditionCopyWithImpl;
@useResult
$Res call({
 String main, String description, String icon
});




}
/// @nodoc
class _$WeatherConditionCopyWithImpl<$Res>
    implements $WeatherConditionCopyWith<$Res> {
  _$WeatherConditionCopyWithImpl(this._self, this._then);

  final WeatherCondition _self;
  final $Res Function(WeatherCondition) _then;

/// Create a copy of WeatherCondition
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? main = null,Object? description = null,Object? icon = null,}) {
  return _then(_self.copyWith(
main: null == main ? _self.main : main // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,icon: null == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [WeatherCondition].
extension WeatherConditionPatterns on WeatherCondition {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WeatherCondition value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WeatherCondition() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WeatherCondition value)  $default,){
final _that = this;
switch (_that) {
case _WeatherCondition():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WeatherCondition value)?  $default,){
final _that = this;
switch (_that) {
case _WeatherCondition() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String main,  String description,  String icon)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WeatherCondition() when $default != null:
return $default(_that.main,_that.description,_that.icon);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String main,  String description,  String icon)  $default,) {final _that = this;
switch (_that) {
case _WeatherCondition():
return $default(_that.main,_that.description,_that.icon);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String main,  String description,  String icon)?  $default,) {final _that = this;
switch (_that) {
case _WeatherCondition() when $default != null:
return $default(_that.main,_that.description,_that.icon);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WeatherCondition implements WeatherCondition {
  const _WeatherCondition({required this.main, required this.description, required this.icon});
  factory _WeatherCondition.fromJson(Map<String, dynamic> json) => _$WeatherConditionFromJson(json);

@override final  String main;
@override final  String description;
@override final  String icon;

/// Create a copy of WeatherCondition
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WeatherConditionCopyWith<_WeatherCondition> get copyWith => __$WeatherConditionCopyWithImpl<_WeatherCondition>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WeatherConditionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WeatherCondition&&(identical(other.main, main) || other.main == main)&&(identical(other.description, description) || other.description == description)&&(identical(other.icon, icon) || other.icon == icon));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,main,description,icon);

@override
String toString() {
  return 'WeatherCondition(main: $main, description: $description, icon: $icon)';
}


}

/// @nodoc
abstract mixin class _$WeatherConditionCopyWith<$Res> implements $WeatherConditionCopyWith<$Res> {
  factory _$WeatherConditionCopyWith(_WeatherCondition value, $Res Function(_WeatherCondition) _then) = __$WeatherConditionCopyWithImpl;
@override @useResult
$Res call({
 String main, String description, String icon
});




}
/// @nodoc
class __$WeatherConditionCopyWithImpl<$Res>
    implements _$WeatherConditionCopyWith<$Res> {
  __$WeatherConditionCopyWithImpl(this._self, this._then);

  final _WeatherCondition _self;
  final $Res Function(_WeatherCondition) _then;

/// Create a copy of WeatherCondition
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? main = null,Object? description = null,Object? icon = null,}) {
  return _then(_WeatherCondition(
main: null == main ? _self.main : main // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,icon: null == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$WeatherWind {

 double get speed;
/// Create a copy of WeatherWind
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WeatherWindCopyWith<WeatherWind> get copyWith => _$WeatherWindCopyWithImpl<WeatherWind>(this as WeatherWind, _$identity);

  /// Serializes this WeatherWind to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WeatherWind&&(identical(other.speed, speed) || other.speed == speed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,speed);

@override
String toString() {
  return 'WeatherWind(speed: $speed)';
}


}

/// @nodoc
abstract mixin class $WeatherWindCopyWith<$Res>  {
  factory $WeatherWindCopyWith(WeatherWind value, $Res Function(WeatherWind) _then) = _$WeatherWindCopyWithImpl;
@useResult
$Res call({
 double speed
});




}
/// @nodoc
class _$WeatherWindCopyWithImpl<$Res>
    implements $WeatherWindCopyWith<$Res> {
  _$WeatherWindCopyWithImpl(this._self, this._then);

  final WeatherWind _self;
  final $Res Function(WeatherWind) _then;

/// Create a copy of WeatherWind
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? speed = null,}) {
  return _then(_self.copyWith(
speed: null == speed ? _self.speed : speed // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [WeatherWind].
extension WeatherWindPatterns on WeatherWind {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WeatherWind value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WeatherWind() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WeatherWind value)  $default,){
final _that = this;
switch (_that) {
case _WeatherWind():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WeatherWind value)?  $default,){
final _that = this;
switch (_that) {
case _WeatherWind() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double speed)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WeatherWind() when $default != null:
return $default(_that.speed);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double speed)  $default,) {final _that = this;
switch (_that) {
case _WeatherWind():
return $default(_that.speed);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double speed)?  $default,) {final _that = this;
switch (_that) {
case _WeatherWind() when $default != null:
return $default(_that.speed);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WeatherWind implements WeatherWind {
  const _WeatherWind({required this.speed});
  factory _WeatherWind.fromJson(Map<String, dynamic> json) => _$WeatherWindFromJson(json);

@override final  double speed;

/// Create a copy of WeatherWind
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WeatherWindCopyWith<_WeatherWind> get copyWith => __$WeatherWindCopyWithImpl<_WeatherWind>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WeatherWindToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WeatherWind&&(identical(other.speed, speed) || other.speed == speed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,speed);

@override
String toString() {
  return 'WeatherWind(speed: $speed)';
}


}

/// @nodoc
abstract mixin class _$WeatherWindCopyWith<$Res> implements $WeatherWindCopyWith<$Res> {
  factory _$WeatherWindCopyWith(_WeatherWind value, $Res Function(_WeatherWind) _then) = __$WeatherWindCopyWithImpl;
@override @useResult
$Res call({
 double speed
});




}
/// @nodoc
class __$WeatherWindCopyWithImpl<$Res>
    implements _$WeatherWindCopyWith<$Res> {
  __$WeatherWindCopyWithImpl(this._self, this._then);

  final _WeatherWind _self;
  final $Res Function(_WeatherWind) _then;

/// Create a copy of WeatherWind
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? speed = null,}) {
  return _then(_WeatherWind(
speed: null == speed ? _self.speed : speed // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
