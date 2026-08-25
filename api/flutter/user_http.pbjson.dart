// This is a generated file - do not edit.
//
// Generated from user_http.proto.

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

@$core.Deprecated('Use getUserNameRequestDescriptor instead')
const GetUserNameRequest$json = {
  '1': 'GetUserNameRequest',
  '2': [
    {'1': 'user_id', '3': 1, '4': 1, '5': 3, '8': {}, '10': 'userId'},
  ],
};

/// Descriptor for `GetUserNameRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getUserNameRequestDescriptor = $convert.base64Decode(
    'ChJHZXRVc2VyTmFtZVJlcXVlc3QSHwoHdXNlcl9pZBgBIAEoA0IG0rsYAmlkUgZ1c2VySWQ=');

@$core.Deprecated('Use getUserNameResponseDescriptor instead')
const GetUserNameResponse$json = {
  '1': 'GetUserNameResponse',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
  ],
};

/// Descriptor for `GetUserNameResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getUserNameResponseDescriptor = $convert
    .base64Decode('ChNHZXRVc2VyTmFtZVJlc3BvbnNlEhIKBG5hbWUYASABKAlSBG5hbWU=');

const $core.Map<$core.String, $core.dynamic> UserServiceBase$json = {
  '1': 'UserService',
  '2': [
    {
      '1': 'GetUserName',
      '2': '.user.GetUserNameRequest',
      '3': '.user.GetUserNameResponse',
      '4': {}
    },
  ],
};

@$core.Deprecated('Use userServiceDescriptor instead')
const $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>>
    UserServiceBase$messageJson = {
  '.user.GetUserNameRequest': GetUserNameRequest$json,
  '.user.GetUserNameResponse': GetUserNameResponse$json,
};

/// Descriptor for `UserService`. Decode as a `google.protobuf.ServiceDescriptorProto`.
final $typed_data.Uint8List userServiceDescriptor = $convert.base64Decode(
    'CgtVc2VyU2VydmljZRJSCgtHZXRVc2VyTmFtZRIYLnVzZXIuR2V0VXNlck5hbWVSZXF1ZXN0Gh'
    'kudXNlci5HZXRVc2VyTmFtZVJlc3BvbnNlIg7KwRgKL3VzZXJzLzppZA==');
