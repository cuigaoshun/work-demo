// This is a generated file - do not edit.
//
// Generated from sum/sum.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports
// ignore_for_file: unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use addRequestDescriptor instead')
const AddRequest$json = {
  '1': 'AddRequest',
  '2': [
    {'1': 'left', '3': 1, '4': 1, '5': 3, '8': {}, '10': 'left'},
    {'1': 'right', '3': 2, '4': 1, '5': 3, '8': {}, '10': 'right'},
  ],
};

/// Descriptor for `AddRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List addRequestDescriptor = $convert.base64Decode(
    'CgpBZGRSZXF1ZXN0EhwKBGxlZnQYASABKANCCLK7GARsZWZ0UgRsZWZ0Eh8KBXJpZ2h0GAIgAS'
    'gDQgmyuxgFcmlnaHRSBXJpZ2h0');

@$core.Deprecated('Use addResponseDescriptor instead')
const AddResponse$json = {
  '1': 'AddResponse',
  '2': [
    {'1': 'result', '3': 1, '4': 1, '5': 3, '10': 'result'},
  ],
};

/// Descriptor for `AddResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List addResponseDescriptor = $convert
    .base64Decode('CgtBZGRSZXNwb25zZRIWCgZyZXN1bHQYASABKANSBnJlc3VsdA==');

const $core.Map<$core.String, $core.dynamic> SumServiceBase$json = {
  '1': 'SumService',
  '2': [
    {'1': 'Add', '2': '.sum.AddRequest', '3': '.sum.AddResponse', '4': {}},
  ],
};

@$core.Deprecated('Use sumServiceDescriptor instead')
const $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>>
    SumServiceBase$messageJson = {
  '.sum.AddRequest': AddRequest$json,
  '.sum.AddResponse': AddResponse$json,
};

/// Descriptor for `SumService`. Decode as a `google.protobuf.ServiceDescriptorProto`.
final $typed_data.Uint8List sumServiceDescriptor = $convert.base64Decode(
    'CgpTdW1TZXJ2aWNlEjIKA0FkZBIPLnN1bS5BZGRSZXF1ZXN0GhAuc3VtLkFkZFJlc3BvbnNlIg'
    'jKwRgEL3N1bQ==');
