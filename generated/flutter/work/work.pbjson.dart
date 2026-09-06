// This is a generated file - do not edit.
//
// Generated from work/work.proto.

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

@$core.Deprecated('Use getWorkRequestDescriptor instead')
const GetWorkRequest$json = {
  '1': 'GetWorkRequest',
  '2': [
    {'1': 'work_id', '3': 1, '4': 1, '5': 3, '8': {}, '10': 'workId'},
  ],
};

/// Descriptor for `GetWorkRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getWorkRequestDescriptor = $convert.base64Decode(
    'Cg5HZXRXb3JrUmVxdWVzdBIjCgd3b3JrX2lkGAEgASgDQgrSuxgGd29ya0lEUgZ3b3JrSWQ=');

@$core.Deprecated('Use getWorkResponseDescriptor instead')
const GetWorkResponse$json = {
  '1': 'GetWorkResponse',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 3, '10': 'id'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'user', '3': 3, '4': 1, '5': 11, '6': '.work.User', '10': 'user'},
  ],
};

/// Descriptor for `GetWorkResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getWorkResponseDescriptor = $convert.base64Decode(
    'Cg9HZXRXb3JrUmVzcG9uc2USDgoCaWQYASABKANSAmlkEhIKBG5hbWUYAiABKAlSBG5hbWUSHg'
    'oEdXNlchgDIAEoCzIKLndvcmsuVXNlclIEdXNlcg==');

@$core.Deprecated('Use userDescriptor instead')
const User$json = {
  '1': 'User',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 3, '10': 'id'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
  ],
};

/// Descriptor for `User`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userDescriptor = $convert
    .base64Decode('CgRVc2VyEg4KAmlkGAEgASgDUgJpZBISCgRuYW1lGAIgASgJUgRuYW1l');

const $core.Map<$core.String, $core.dynamic> WorkServiceBase$json = {
  '1': 'WorkService',
  '2': [
    {
      '1': 'GetWork',
      '2': '.work.GetWorkRequest',
      '3': '.work.GetWorkResponse',
      '4': {}
    },
  ],
};

@$core.Deprecated('Use workServiceDescriptor instead')
const $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>>
    WorkServiceBase$messageJson = {
  '.work.GetWorkRequest': GetWorkRequest$json,
  '.work.GetWorkResponse': GetWorkResponse$json,
  '.work.User': User$json,
};

/// Descriptor for `WorkService`. Decode as a `google.protobuf.ServiceDescriptorProto`.
final $typed_data.Uint8List workServiceDescriptor = $convert.base64Decode(
    'CgtXb3JrU2VydmljZRJKCgdHZXRXb3JrEhQud29yay5HZXRXb3JrUmVxdWVzdBoVLndvcmsuR2'
    'V0V29ya1Jlc3BvbnNlIhLKwRgOL3dvcmtzLzp3b3JrSUQ=');
