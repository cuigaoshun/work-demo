// This is a generated file - do not edit.
//
// Generated from test/test_api.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'test_api.pbenum.dart';

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'test_api.pbenum.dart';

class TestFieldsRequest extends $pb.GeneratedMessage {
  factory TestFieldsRequest({
    $core.int? int32Value,
    $core.int? uint32Value,
    $fixnum.Int64? int64Value,
    $fixnum.Int64? uint64Value,
    $core.bool? boolValue,
    $core.String? stringValue,
    CompatibilityEnum? enumValue,
    CompatibilityMessage? nestedValue,
    $core.Iterable<$core.String>? repeatedStrings,
    $core.Iterable<$core.int>? repeatedInt32,
    $core.Iterable<CompatibilityEnum>? repeatedEnums,
    $core.Iterable<CompatibilityMessage>? repeatedNested,
    $core.Iterable<$core.MapEntry<$core.String, $core.String>>? stringMap,
    $core.Iterable<$core.MapEntry<$core.int, $fixnum.Int64>>? numericMap,
    $core.Iterable<$core.MapEntry<$core.String, CompatibilityMessage>>?
        nestedMap,
  }) {
    final result = create();
    if (int32Value != null) result.int32Value = int32Value;
    if (uint32Value != null) result.uint32Value = uint32Value;
    if (int64Value != null) result.int64Value = int64Value;
    if (uint64Value != null) result.uint64Value = uint64Value;
    if (boolValue != null) result.boolValue = boolValue;
    if (stringValue != null) result.stringValue = stringValue;
    if (enumValue != null) result.enumValue = enumValue;
    if (nestedValue != null) result.nestedValue = nestedValue;
    if (repeatedStrings != null) result.repeatedStrings.addAll(repeatedStrings);
    if (repeatedInt32 != null) result.repeatedInt32.addAll(repeatedInt32);
    if (repeatedEnums != null) result.repeatedEnums.addAll(repeatedEnums);
    if (repeatedNested != null) result.repeatedNested.addAll(repeatedNested);
    if (stringMap != null) result.stringMap.addEntries(stringMap);
    if (numericMap != null) result.numericMap.addEntries(numericMap);
    if (nestedMap != null) result.nestedMap.addEntries(nestedMap);
    return result;
  }

  TestFieldsRequest._();

  factory TestFieldsRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TestFieldsRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TestFieldsRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'test'),
      createEmptyInstance: create)
    ..aI(4, _omitFieldNames ? '' : 'int32Value')
    ..aI(5, _omitFieldNames ? '' : 'uint32Value',
        fieldType: $pb.PbFieldType.OU3)
    ..aInt64(6, _omitFieldNames ? '' : 'int64Value')
    ..a<$fixnum.Int64>(
        7, _omitFieldNames ? '' : 'uint64Value', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOB(14, _omitFieldNames ? '' : 'boolValue')
    ..aOS(15, _omitFieldNames ? '' : 'stringValue')
    ..aE<CompatibilityEnum>(17, _omitFieldNames ? '' : 'enumValue',
        enumValues: CompatibilityEnum.values)
    ..aOM<CompatibilityMessage>(18, _omitFieldNames ? '' : 'nestedValue',
        subBuilder: CompatibilityMessage.create)
    ..pPS(19, _omitFieldNames ? '' : 'repeatedStrings')
    ..p<$core.int>(
        20, _omitFieldNames ? '' : 'repeatedInt32', $pb.PbFieldType.K3)
    ..pc<CompatibilityEnum>(
        21, _omitFieldNames ? '' : 'repeatedEnums', $pb.PbFieldType.KE,
        valueOf: CompatibilityEnum.valueOf,
        enumValues: CompatibilityEnum.values,
        defaultEnumValue: CompatibilityEnum.COMPATIBILITY_ENUM_UNSPECIFIED)
    ..pPM<CompatibilityMessage>(22, _omitFieldNames ? '' : 'repeatedNested',
        subBuilder: CompatibilityMessage.create)
    ..m<$core.String, $core.String>(23, _omitFieldNames ? '' : 'stringMap',
        entryClassName: 'TestFieldsRequest.StringMapEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OS,
        packageName: const $pb.PackageName('test'))
    ..m<$core.int, $fixnum.Int64>(24, _omitFieldNames ? '' : 'numericMap',
        entryClassName: 'TestFieldsRequest.NumericMapEntry',
        keyFieldType: $pb.PbFieldType.O3,
        valueFieldType: $pb.PbFieldType.OU6,
        packageName: const $pb.PackageName('test'))
    ..m<$core.String, CompatibilityMessage>(
        25, _omitFieldNames ? '' : 'nestedMap',
        entryClassName: 'TestFieldsRequest.NestedMapEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OM,
        valueCreator: CompatibilityMessage.create,
        valueDefaultOrMaker: CompatibilityMessage.getDefault,
        packageName: const $pb.PackageName('test'))
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TestFieldsRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TestFieldsRequest copyWith(void Function(TestFieldsRequest) updates) =>
      super.copyWith((message) => updates(message as TestFieldsRequest))
          as TestFieldsRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TestFieldsRequest create() => TestFieldsRequest._();
  @$core.override
  TestFieldsRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static TestFieldsRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TestFieldsRequest>(create);
  static TestFieldsRequest? _defaultInstance;

  /// 兼容性测试字段：覆盖常用标量、枚举、数组、映射和嵌套消息。
  @$pb.TagNumber(4)
  $core.int get int32Value => $_getIZ(0);
  @$pb.TagNumber(4)
  set int32Value($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(4)
  $core.bool hasInt32Value() => $_has(0);
  @$pb.TagNumber(4)
  void clearInt32Value() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.int get uint32Value => $_getIZ(1);
  @$pb.TagNumber(5)
  set uint32Value($core.int value) => $_setUnsignedInt32(1, value);
  @$pb.TagNumber(5)
  $core.bool hasUint32Value() => $_has(1);
  @$pb.TagNumber(5)
  void clearUint32Value() => $_clearField(5);

  @$pb.TagNumber(6)
  $fixnum.Int64 get int64Value => $_getI64(2);
  @$pb.TagNumber(6)
  set int64Value($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(6)
  $core.bool hasInt64Value() => $_has(2);
  @$pb.TagNumber(6)
  void clearInt64Value() => $_clearField(6);

  @$pb.TagNumber(7)
  $fixnum.Int64 get uint64Value => $_getI64(3);
  @$pb.TagNumber(7)
  set uint64Value($fixnum.Int64 value) => $_setInt64(3, value);
  @$pb.TagNumber(7)
  $core.bool hasUint64Value() => $_has(3);
  @$pb.TagNumber(7)
  void clearUint64Value() => $_clearField(7);

  @$pb.TagNumber(14)
  $core.bool get boolValue => $_getBF(4);
  @$pb.TagNumber(14)
  set boolValue($core.bool value) => $_setBool(4, value);
  @$pb.TagNumber(14)
  $core.bool hasBoolValue() => $_has(4);
  @$pb.TagNumber(14)
  void clearBoolValue() => $_clearField(14);

  @$pb.TagNumber(15)
  $core.String get stringValue => $_getSZ(5);
  @$pb.TagNumber(15)
  set stringValue($core.String value) => $_setString(5, value);
  @$pb.TagNumber(15)
  $core.bool hasStringValue() => $_has(5);
  @$pb.TagNumber(15)
  void clearStringValue() => $_clearField(15);

  @$pb.TagNumber(17)
  CompatibilityEnum get enumValue => $_getN(6);
  @$pb.TagNumber(17)
  set enumValue(CompatibilityEnum value) => $_setField(17, value);
  @$pb.TagNumber(17)
  $core.bool hasEnumValue() => $_has(6);
  @$pb.TagNumber(17)
  void clearEnumValue() => $_clearField(17);

  @$pb.TagNumber(18)
  CompatibilityMessage get nestedValue => $_getN(7);
  @$pb.TagNumber(18)
  set nestedValue(CompatibilityMessage value) => $_setField(18, value);
  @$pb.TagNumber(18)
  $core.bool hasNestedValue() => $_has(7);
  @$pb.TagNumber(18)
  void clearNestedValue() => $_clearField(18);
  @$pb.TagNumber(18)
  CompatibilityMessage ensureNestedValue() => $_ensure(7);

  @$pb.TagNumber(19)
  $pb.PbList<$core.String> get repeatedStrings => $_getList(8);

  @$pb.TagNumber(20)
  $pb.PbList<$core.int> get repeatedInt32 => $_getList(9);

  @$pb.TagNumber(21)
  $pb.PbList<CompatibilityEnum> get repeatedEnums => $_getList(10);

  @$pb.TagNumber(22)
  $pb.PbList<CompatibilityMessage> get repeatedNested => $_getList(11);

  @$pb.TagNumber(23)
  $pb.PbMap<$core.String, $core.String> get stringMap => $_getMap(12);

  @$pb.TagNumber(24)
  $pb.PbMap<$core.int, $fixnum.Int64> get numericMap => $_getMap(13);

  @$pb.TagNumber(25)
  $pb.PbMap<$core.String, CompatibilityMessage> get nestedMap => $_getMap(14);
}

class TestFieldsResponse extends $pb.GeneratedMessage {
  factory TestFieldsResponse({
    $core.int? int32Value,
    $core.int? uint32Value,
    $fixnum.Int64? int64Value,
    $fixnum.Int64? uint64Value,
    $core.bool? boolValue,
    $core.String? stringValue,
    CompatibilityEnum? enumValue,
    CompatibilityMessage? nestedValue,
    $core.Iterable<$core.String>? repeatedStrings,
    $core.Iterable<$core.int>? repeatedInt32,
    $core.Iterable<CompatibilityEnum>? repeatedEnums,
    $core.Iterable<CompatibilityMessage>? repeatedNested,
    $core.Iterable<$core.MapEntry<$core.String, $core.String>>? stringMap,
    $core.Iterable<$core.MapEntry<$core.int, $fixnum.Int64>>? numericMap,
    $core.Iterable<$core.MapEntry<$core.String, CompatibilityMessage>>?
        nestedMap,
  }) {
    final result = create();
    if (int32Value != null) result.int32Value = int32Value;
    if (uint32Value != null) result.uint32Value = uint32Value;
    if (int64Value != null) result.int64Value = int64Value;
    if (uint64Value != null) result.uint64Value = uint64Value;
    if (boolValue != null) result.boolValue = boolValue;
    if (stringValue != null) result.stringValue = stringValue;
    if (enumValue != null) result.enumValue = enumValue;
    if (nestedValue != null) result.nestedValue = nestedValue;
    if (repeatedStrings != null) result.repeatedStrings.addAll(repeatedStrings);
    if (repeatedInt32 != null) result.repeatedInt32.addAll(repeatedInt32);
    if (repeatedEnums != null) result.repeatedEnums.addAll(repeatedEnums);
    if (repeatedNested != null) result.repeatedNested.addAll(repeatedNested);
    if (stringMap != null) result.stringMap.addEntries(stringMap);
    if (numericMap != null) result.numericMap.addEntries(numericMap);
    if (nestedMap != null) result.nestedMap.addEntries(nestedMap);
    return result;
  }

  TestFieldsResponse._();

  factory TestFieldsResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TestFieldsResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TestFieldsResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'test'),
      createEmptyInstance: create)
    ..aI(4, _omitFieldNames ? '' : 'int32Value')
    ..aI(5, _omitFieldNames ? '' : 'uint32Value',
        fieldType: $pb.PbFieldType.OU3)
    ..aInt64(6, _omitFieldNames ? '' : 'int64Value')
    ..a<$fixnum.Int64>(
        7, _omitFieldNames ? '' : 'uint64Value', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOB(14, _omitFieldNames ? '' : 'boolValue')
    ..aOS(15, _omitFieldNames ? '' : 'stringValue')
    ..aE<CompatibilityEnum>(17, _omitFieldNames ? '' : 'enumValue',
        enumValues: CompatibilityEnum.values)
    ..aOM<CompatibilityMessage>(18, _omitFieldNames ? '' : 'nestedValue',
        subBuilder: CompatibilityMessage.create)
    ..pPS(19, _omitFieldNames ? '' : 'repeatedStrings')
    ..p<$core.int>(
        20, _omitFieldNames ? '' : 'repeatedInt32', $pb.PbFieldType.K3)
    ..pc<CompatibilityEnum>(
        21, _omitFieldNames ? '' : 'repeatedEnums', $pb.PbFieldType.KE,
        valueOf: CompatibilityEnum.valueOf,
        enumValues: CompatibilityEnum.values,
        defaultEnumValue: CompatibilityEnum.COMPATIBILITY_ENUM_UNSPECIFIED)
    ..pPM<CompatibilityMessage>(22, _omitFieldNames ? '' : 'repeatedNested',
        subBuilder: CompatibilityMessage.create)
    ..m<$core.String, $core.String>(23, _omitFieldNames ? '' : 'stringMap',
        entryClassName: 'TestFieldsResponse.StringMapEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OS,
        packageName: const $pb.PackageName('test'))
    ..m<$core.int, $fixnum.Int64>(24, _omitFieldNames ? '' : 'numericMap',
        entryClassName: 'TestFieldsResponse.NumericMapEntry',
        keyFieldType: $pb.PbFieldType.O3,
        valueFieldType: $pb.PbFieldType.OU6,
        packageName: const $pb.PackageName('test'))
    ..m<$core.String, CompatibilityMessage>(
        25, _omitFieldNames ? '' : 'nestedMap',
        entryClassName: 'TestFieldsResponse.NestedMapEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OM,
        valueCreator: CompatibilityMessage.create,
        valueDefaultOrMaker: CompatibilityMessage.getDefault,
        packageName: const $pb.PackageName('test'))
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TestFieldsResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TestFieldsResponse copyWith(void Function(TestFieldsResponse) updates) =>
      super.copyWith((message) => updates(message as TestFieldsResponse))
          as TestFieldsResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TestFieldsResponse create() => TestFieldsResponse._();
  @$core.override
  TestFieldsResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static TestFieldsResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TestFieldsResponse>(create);
  static TestFieldsResponse? _defaultInstance;

  /// 以下字段与请求保持一致，用于验证字段兼容性。
  @$pb.TagNumber(4)
  $core.int get int32Value => $_getIZ(0);
  @$pb.TagNumber(4)
  set int32Value($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(4)
  $core.bool hasInt32Value() => $_has(0);
  @$pb.TagNumber(4)
  void clearInt32Value() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.int get uint32Value => $_getIZ(1);
  @$pb.TagNumber(5)
  set uint32Value($core.int value) => $_setUnsignedInt32(1, value);
  @$pb.TagNumber(5)
  $core.bool hasUint32Value() => $_has(1);
  @$pb.TagNumber(5)
  void clearUint32Value() => $_clearField(5);

  @$pb.TagNumber(6)
  $fixnum.Int64 get int64Value => $_getI64(2);
  @$pb.TagNumber(6)
  set int64Value($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(6)
  $core.bool hasInt64Value() => $_has(2);
  @$pb.TagNumber(6)
  void clearInt64Value() => $_clearField(6);

  @$pb.TagNumber(7)
  $fixnum.Int64 get uint64Value => $_getI64(3);
  @$pb.TagNumber(7)
  set uint64Value($fixnum.Int64 value) => $_setInt64(3, value);
  @$pb.TagNumber(7)
  $core.bool hasUint64Value() => $_has(3);
  @$pb.TagNumber(7)
  void clearUint64Value() => $_clearField(7);

  @$pb.TagNumber(14)
  $core.bool get boolValue => $_getBF(4);
  @$pb.TagNumber(14)
  set boolValue($core.bool value) => $_setBool(4, value);
  @$pb.TagNumber(14)
  $core.bool hasBoolValue() => $_has(4);
  @$pb.TagNumber(14)
  void clearBoolValue() => $_clearField(14);

  @$pb.TagNumber(15)
  $core.String get stringValue => $_getSZ(5);
  @$pb.TagNumber(15)
  set stringValue($core.String value) => $_setString(5, value);
  @$pb.TagNumber(15)
  $core.bool hasStringValue() => $_has(5);
  @$pb.TagNumber(15)
  void clearStringValue() => $_clearField(15);

  @$pb.TagNumber(17)
  CompatibilityEnum get enumValue => $_getN(6);
  @$pb.TagNumber(17)
  set enumValue(CompatibilityEnum value) => $_setField(17, value);
  @$pb.TagNumber(17)
  $core.bool hasEnumValue() => $_has(6);
  @$pb.TagNumber(17)
  void clearEnumValue() => $_clearField(17);

  @$pb.TagNumber(18)
  CompatibilityMessage get nestedValue => $_getN(7);
  @$pb.TagNumber(18)
  set nestedValue(CompatibilityMessage value) => $_setField(18, value);
  @$pb.TagNumber(18)
  $core.bool hasNestedValue() => $_has(7);
  @$pb.TagNumber(18)
  void clearNestedValue() => $_clearField(18);
  @$pb.TagNumber(18)
  CompatibilityMessage ensureNestedValue() => $_ensure(7);

  @$pb.TagNumber(19)
  $pb.PbList<$core.String> get repeatedStrings => $_getList(8);

  @$pb.TagNumber(20)
  $pb.PbList<$core.int> get repeatedInt32 => $_getList(9);

  @$pb.TagNumber(21)
  $pb.PbList<CompatibilityEnum> get repeatedEnums => $_getList(10);

  @$pb.TagNumber(22)
  $pb.PbList<CompatibilityMessage> get repeatedNested => $_getList(11);

  @$pb.TagNumber(23)
  $pb.PbMap<$core.String, $core.String> get stringMap => $_getMap(12);

  @$pb.TagNumber(24)
  $pb.PbMap<$core.int, $fixnum.Int64> get numericMap => $_getMap(13);

  @$pb.TagNumber(25)
  $pb.PbMap<$core.String, CompatibilityMessage> get nestedMap => $_getMap(14);
}

/// CompatibilityMessage 用于测试嵌套消息、数组、映射和递归嵌套。
class CompatibilityMessage extends $pb.GeneratedMessage {
  factory CompatibilityMessage({
    $core.String? label,
    $core.Iterable<$fixnum.Int64>? values,
    $core.Iterable<$core.MapEntry<$core.String, $core.int>>? attributes,
    CompatibilityMessage? child,
  }) {
    final result = create();
    if (label != null) result.label = label;
    if (values != null) result.values.addAll(values);
    if (attributes != null) result.attributes.addEntries(attributes);
    if (child != null) result.child = child;
    return result;
  }

  CompatibilityMessage._();

  factory CompatibilityMessage.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CompatibilityMessage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CompatibilityMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'test'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'label')
    ..p<$fixnum.Int64>(2, _omitFieldNames ? '' : 'values', $pb.PbFieldType.K6)
    ..m<$core.String, $core.int>(3, _omitFieldNames ? '' : 'attributes',
        entryClassName: 'CompatibilityMessage.AttributesEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.O3,
        packageName: const $pb.PackageName('test'))
    ..aOM<CompatibilityMessage>(4, _omitFieldNames ? '' : 'child',
        subBuilder: CompatibilityMessage.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CompatibilityMessage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CompatibilityMessage copyWith(void Function(CompatibilityMessage) updates) =>
      super.copyWith((message) => updates(message as CompatibilityMessage))
          as CompatibilityMessage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CompatibilityMessage create() => CompatibilityMessage._();
  @$core.override
  CompatibilityMessage createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CompatibilityMessage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CompatibilityMessage>(create);
  static CompatibilityMessage? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get label => $_getSZ(0);
  @$pb.TagNumber(1)
  set label($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasLabel() => $_has(0);
  @$pb.TagNumber(1)
  void clearLabel() => $_clearField(1);

  @$pb.TagNumber(2)
  $pb.PbList<$fixnum.Int64> get values => $_getList(1);

  @$pb.TagNumber(3)
  $pb.PbMap<$core.String, $core.int> get attributes => $_getMap(2);

  @$pb.TagNumber(4)
  CompatibilityMessage get child => $_getN(3);
  @$pb.TagNumber(4)
  set child(CompatibilityMessage value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasChild() => $_has(3);
  @$pb.TagNumber(4)
  void clearChild() => $_clearField(4);
  @$pb.TagNumber(4)
  CompatibilityMessage ensureChild() => $_ensure(3);
}

class TestServiceApi {
  final $pb.RpcClient _client;

  TestServiceApi(this._client);

  $async.Future<TestFieldsResponse> testFields(
          $pb.ClientContext? ctx, TestFieldsRequest request) =>
      _client.invoke<TestFieldsResponse>(
          ctx, 'TestService', 'TestFields', request, TestFieldsResponse());
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
