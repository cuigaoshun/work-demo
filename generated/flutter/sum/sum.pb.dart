// This is a generated file - do not edit.
//
// Generated from sum/sum.proto.

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

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class AddRequest extends $pb.GeneratedMessage {
  factory AddRequest({
    $fixnum.Int64? left,
    $fixnum.Int64? right,
  }) {
    final result = create();
    if (left != null) result.left = left;
    if (right != null) result.right = right;
    return result;
  }

  AddRequest._();

  factory AddRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AddRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AddRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'sum'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'left')
    ..aInt64(2, _omitFieldNames ? '' : 'right')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AddRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AddRequest copyWith(void Function(AddRequest) updates) =>
      super.copyWith((message) => updates(message as AddRequest)) as AddRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AddRequest create() => AddRequest._();
  @$core.override
  AddRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static AddRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AddRequest>(create);
  static AddRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get left => $_getI64(0);
  @$pb.TagNumber(1)
  set left($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasLeft() => $_has(0);
  @$pb.TagNumber(1)
  void clearLeft() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get right => $_getI64(1);
  @$pb.TagNumber(2)
  set right($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasRight() => $_has(1);
  @$pb.TagNumber(2)
  void clearRight() => $_clearField(2);
}

class AddResponse extends $pb.GeneratedMessage {
  factory AddResponse({
    $fixnum.Int64? result,
  }) {
    final result$ = create();
    if (result != null) result$.result = result;
    return result$;
  }

  AddResponse._();

  factory AddResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AddResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AddResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'sum'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'result')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AddResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AddResponse copyWith(void Function(AddResponse) updates) =>
      super.copyWith((message) => updates(message as AddResponse))
          as AddResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AddResponse create() => AddResponse._();
  @$core.override
  AddResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static AddResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AddResponse>(create);
  static AddResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get result => $_getI64(0);
  @$pb.TagNumber(1)
  set result($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasResult() => $_has(0);
  @$pb.TagNumber(1)
  void clearResult() => $_clearField(1);
}

class SumServiceApi {
  final $pb.RpcClient _client;

  SumServiceApi(this._client);

  $async.Future<AddResponse> add($pb.ClientContext? ctx, AddRequest request) =>
      _client.invoke<AddResponse>(
          ctx, 'SumService', 'Add', request, AddResponse());
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
