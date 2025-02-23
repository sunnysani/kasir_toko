// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pos_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PosFilterStateReturnStruct {
  List<int> get filterProductCategoryIDs => throw _privateConstructorUsedError;
  String get searchString => throw _privateConstructorUsedError;

  /// Create a copy of PosFilterStateReturnStruct
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PosFilterStateReturnStructCopyWith<PosFilterStateReturnStruct>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PosFilterStateReturnStructCopyWith<$Res> {
  factory $PosFilterStateReturnStructCopyWith(PosFilterStateReturnStruct value,
          $Res Function(PosFilterStateReturnStruct) then) =
      _$PosFilterStateReturnStructCopyWithImpl<$Res,
          PosFilterStateReturnStruct>;
  @useResult
  $Res call({List<int> filterProductCategoryIDs, String searchString});
}

/// @nodoc
class _$PosFilterStateReturnStructCopyWithImpl<$Res,
        $Val extends PosFilterStateReturnStruct>
    implements $PosFilterStateReturnStructCopyWith<$Res> {
  _$PosFilterStateReturnStructCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PosFilterStateReturnStruct
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filterProductCategoryIDs = null,
    Object? searchString = null,
  }) {
    return _then(_value.copyWith(
      filterProductCategoryIDs: null == filterProductCategoryIDs
          ? _value.filterProductCategoryIDs
          : filterProductCategoryIDs // ignore: cast_nullable_to_non_nullable
              as List<int>,
      searchString: null == searchString
          ? _value.searchString
          : searchString // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PosFilterStateReturnStructImplCopyWith<$Res>
    implements $PosFilterStateReturnStructCopyWith<$Res> {
  factory _$$PosFilterStateReturnStructImplCopyWith(
          _$PosFilterStateReturnStructImpl value,
          $Res Function(_$PosFilterStateReturnStructImpl) then) =
      __$$PosFilterStateReturnStructImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<int> filterProductCategoryIDs, String searchString});
}

/// @nodoc
class __$$PosFilterStateReturnStructImplCopyWithImpl<$Res>
    extends _$PosFilterStateReturnStructCopyWithImpl<$Res,
        _$PosFilterStateReturnStructImpl>
    implements _$$PosFilterStateReturnStructImplCopyWith<$Res> {
  __$$PosFilterStateReturnStructImplCopyWithImpl(
      _$PosFilterStateReturnStructImpl _value,
      $Res Function(_$PosFilterStateReturnStructImpl) _then)
      : super(_value, _then);

  /// Create a copy of PosFilterStateReturnStruct
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filterProductCategoryIDs = null,
    Object? searchString = null,
  }) {
    return _then(_$PosFilterStateReturnStructImpl(
      filterProductCategoryIDs: null == filterProductCategoryIDs
          ? _value._filterProductCategoryIDs
          : filterProductCategoryIDs // ignore: cast_nullable_to_non_nullable
              as List<int>,
      searchString: null == searchString
          ? _value.searchString
          : searchString // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PosFilterStateReturnStructImpl implements _PosFilterStateReturnStruct {
  _$PosFilterStateReturnStructImpl(
      {required final List<int> filterProductCategoryIDs,
      required this.searchString})
      : _filterProductCategoryIDs = filterProductCategoryIDs;

  final List<int> _filterProductCategoryIDs;
  @override
  List<int> get filterProductCategoryIDs {
    if (_filterProductCategoryIDs is EqualUnmodifiableListView)
      return _filterProductCategoryIDs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_filterProductCategoryIDs);
  }

  @override
  final String searchString;

  @override
  String toString() {
    return 'PosFilterStateReturnStruct(filterProductCategoryIDs: $filterProductCategoryIDs, searchString: $searchString)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PosFilterStateReturnStructImpl &&
            const DeepCollectionEquality().equals(
                other._filterProductCategoryIDs, _filterProductCategoryIDs) &&
            (identical(other.searchString, searchString) ||
                other.searchString == searchString));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_filterProductCategoryIDs),
      searchString);

  /// Create a copy of PosFilterStateReturnStruct
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PosFilterStateReturnStructImplCopyWith<_$PosFilterStateReturnStructImpl>
      get copyWith => __$$PosFilterStateReturnStructImplCopyWithImpl<
          _$PosFilterStateReturnStructImpl>(this, _$identity);
}

abstract class _PosFilterStateReturnStruct
    implements PosFilterStateReturnStruct {
  factory _PosFilterStateReturnStruct(
      {required final List<int> filterProductCategoryIDs,
      required final String searchString}) = _$PosFilterStateReturnStructImpl;

  @override
  List<int> get filterProductCategoryIDs;
  @override
  String get searchString;

  /// Create a copy of PosFilterStateReturnStruct
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PosFilterStateReturnStructImplCopyWith<_$PosFilterStateReturnStructImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$QuantityAndTotalPriceStateReturnStruct {
  int get totalQuantity => throw _privateConstructorUsedError;
  double get totalPrice => throw _privateConstructorUsedError;

  /// Create a copy of QuantityAndTotalPriceStateReturnStruct
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $QuantityAndTotalPriceStateReturnStructCopyWith<
          QuantityAndTotalPriceStateReturnStruct>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuantityAndTotalPriceStateReturnStructCopyWith<$Res> {
  factory $QuantityAndTotalPriceStateReturnStructCopyWith(
          QuantityAndTotalPriceStateReturnStruct value,
          $Res Function(QuantityAndTotalPriceStateReturnStruct) then) =
      _$QuantityAndTotalPriceStateReturnStructCopyWithImpl<$Res,
          QuantityAndTotalPriceStateReturnStruct>;
  @useResult
  $Res call({int totalQuantity, double totalPrice});
}

/// @nodoc
class _$QuantityAndTotalPriceStateReturnStructCopyWithImpl<$Res,
        $Val extends QuantityAndTotalPriceStateReturnStruct>
    implements $QuantityAndTotalPriceStateReturnStructCopyWith<$Res> {
  _$QuantityAndTotalPriceStateReturnStructCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of QuantityAndTotalPriceStateReturnStruct
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalQuantity = null,
    Object? totalPrice = null,
  }) {
    return _then(_value.copyWith(
      totalQuantity: null == totalQuantity
          ? _value.totalQuantity
          : totalQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      totalPrice: null == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QuantityAndTotalPriceStateReturnStructImplCopyWith<$Res>
    implements $QuantityAndTotalPriceStateReturnStructCopyWith<$Res> {
  factory _$$QuantityAndTotalPriceStateReturnStructImplCopyWith(
          _$QuantityAndTotalPriceStateReturnStructImpl value,
          $Res Function(_$QuantityAndTotalPriceStateReturnStructImpl) then) =
      __$$QuantityAndTotalPriceStateReturnStructImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int totalQuantity, double totalPrice});
}

/// @nodoc
class __$$QuantityAndTotalPriceStateReturnStructImplCopyWithImpl<$Res>
    extends _$QuantityAndTotalPriceStateReturnStructCopyWithImpl<$Res,
        _$QuantityAndTotalPriceStateReturnStructImpl>
    implements _$$QuantityAndTotalPriceStateReturnStructImplCopyWith<$Res> {
  __$$QuantityAndTotalPriceStateReturnStructImplCopyWithImpl(
      _$QuantityAndTotalPriceStateReturnStructImpl _value,
      $Res Function(_$QuantityAndTotalPriceStateReturnStructImpl) _then)
      : super(_value, _then);

  /// Create a copy of QuantityAndTotalPriceStateReturnStruct
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalQuantity = null,
    Object? totalPrice = null,
  }) {
    return _then(_$QuantityAndTotalPriceStateReturnStructImpl(
      totalQuantity: null == totalQuantity
          ? _value.totalQuantity
          : totalQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      totalPrice: null == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$QuantityAndTotalPriceStateReturnStructImpl
    implements _QuantityAndTotalPriceStateReturnStruct {
  _$QuantityAndTotalPriceStateReturnStructImpl(
      {required this.totalQuantity, required this.totalPrice});

  @override
  final int totalQuantity;
  @override
  final double totalPrice;

  @override
  String toString() {
    return 'QuantityAndTotalPriceStateReturnStruct(totalQuantity: $totalQuantity, totalPrice: $totalPrice)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuantityAndTotalPriceStateReturnStructImpl &&
            (identical(other.totalQuantity, totalQuantity) ||
                other.totalQuantity == totalQuantity) &&
            (identical(other.totalPrice, totalPrice) ||
                other.totalPrice == totalPrice));
  }

  @override
  int get hashCode => Object.hash(runtimeType, totalQuantity, totalPrice);

  /// Create a copy of QuantityAndTotalPriceStateReturnStruct
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QuantityAndTotalPriceStateReturnStructImplCopyWith<
          _$QuantityAndTotalPriceStateReturnStructImpl>
      get copyWith =>
          __$$QuantityAndTotalPriceStateReturnStructImplCopyWithImpl<
              _$QuantityAndTotalPriceStateReturnStructImpl>(this, _$identity);
}

abstract class _QuantityAndTotalPriceStateReturnStruct
    implements QuantityAndTotalPriceStateReturnStruct {
  factory _QuantityAndTotalPriceStateReturnStruct(
          {required final int totalQuantity,
          required final double totalPrice}) =
      _$QuantityAndTotalPriceStateReturnStructImpl;

  @override
  int get totalQuantity;
  @override
  double get totalPrice;

  /// Create a copy of QuantityAndTotalPriceStateReturnStruct
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QuantityAndTotalPriceStateReturnStructImplCopyWith<
          _$QuantityAndTotalPriceStateReturnStructImpl>
      get copyWith => throw _privateConstructorUsedError;
}
