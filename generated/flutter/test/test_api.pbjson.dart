// This is a generated file - do not edit.
//
// Generated from test/test_api.proto.

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

@$core.Deprecated('Use compatibilityEnumDescriptor instead')
const CompatibilityEnum$json = {
  '1': 'CompatibilityEnum',
  '2': [
    {'1': 'COMPATIBILITY_ENUM_UNSPECIFIED', '2': 0},
    {'1': 'COMPATIBILITY_ENUM_FIRST', '2': 1},
    {'1': 'COMPATIBILITY_ENUM_SECOND', '2': 2},
  ],
};

/// Descriptor for `CompatibilityEnum`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List compatibilityEnumDescriptor = $convert.base64Decode(
    'ChFDb21wYXRpYmlsaXR5RW51bRIiCh5DT01QQVRJQklMSVRZX0VOVU1fVU5TUEVDSUZJRUQQAB'
    'IcChhDT01QQVRJQklMSVRZX0VOVU1fRklSU1QQARIdChlDT01QQVRJQklMSVRZX0VOVU1fU0VD'
    'T05EEAI=');

@$core.Deprecated('Use testFieldsRequestDescriptor instead')
const TestFieldsRequest$json = {
  '1': 'TestFieldsRequest',
  '2': [
    {'1': 'int32_value', '3': 4, '4': 1, '5': 5, '10': 'int32Value'},
    {'1': 'uint32_value', '3': 5, '4': 1, '5': 13, '10': 'uint32Value'},
    {'1': 'int64_value', '3': 6, '4': 1, '5': 3, '10': 'int64Value'},
    {'1': 'uint64_value', '3': 7, '4': 1, '5': 4, '10': 'uint64Value'},
    {'1': 'bool_value', '3': 14, '4': 1, '5': 8, '10': 'boolValue'},
    {'1': 'string_value', '3': 15, '4': 1, '5': 9, '10': 'stringValue'},
    {
      '1': 'enum_value',
      '3': 17,
      '4': 1,
      '5': 14,
      '6': '.test.CompatibilityEnum',
      '10': 'enumValue'
    },
    {
      '1': 'nested_value',
      '3': 18,
      '4': 1,
      '5': 11,
      '6': '.test.CompatibilityMessage',
      '10': 'nestedValue'
    },
    {'1': 'repeated_strings', '3': 19, '4': 3, '5': 9, '10': 'repeatedStrings'},
    {'1': 'repeated_int32', '3': 20, '4': 3, '5': 5, '10': 'repeatedInt32'},
    {
      '1': 'repeated_enums',
      '3': 21,
      '4': 3,
      '5': 14,
      '6': '.test.CompatibilityEnum',
      '10': 'repeatedEnums'
    },
    {
      '1': 'repeated_nested',
      '3': 22,
      '4': 3,
      '5': 11,
      '6': '.test.CompatibilityMessage',
      '10': 'repeatedNested'
    },
    {
      '1': 'string_map',
      '3': 23,
      '4': 3,
      '5': 11,
      '6': '.test.TestFieldsRequest.StringMapEntry',
      '10': 'stringMap'
    },
    {
      '1': 'numeric_map',
      '3': 24,
      '4': 3,
      '5': 11,
      '6': '.test.TestFieldsRequest.NumericMapEntry',
      '10': 'numericMap'
    },
    {
      '1': 'nested_map',
      '3': 25,
      '4': 3,
      '5': 11,
      '6': '.test.TestFieldsRequest.NestedMapEntry',
      '10': 'nestedMap'
    },
  ],
  '3': [
    TestFieldsRequest_StringMapEntry$json,
    TestFieldsRequest_NumericMapEntry$json,
    TestFieldsRequest_NestedMapEntry$json
  ],
};

@$core.Deprecated('Use testFieldsRequestDescriptor instead')
const TestFieldsRequest_StringMapEntry$json = {
  '1': 'StringMapEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
  '7': {'7': true},
};

@$core.Deprecated('Use testFieldsRequestDescriptor instead')
const TestFieldsRequest_NumericMapEntry$json = {
  '1': 'NumericMapEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 5, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 4, '10': 'value'},
  ],
  '7': {'7': true},
};

@$core.Deprecated('Use testFieldsRequestDescriptor instead')
const TestFieldsRequest_NestedMapEntry$json = {
  '1': 'NestedMapEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {
      '1': 'value',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.test.CompatibilityMessage',
      '10': 'value'
    },
  ],
  '7': {'7': true},
};

/// Descriptor for `TestFieldsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List testFieldsRequestDescriptor = $convert.base64Decode(
    'ChFUZXN0RmllbGRzUmVxdWVzdBIfCgtpbnQzMl92YWx1ZRgEIAEoBVIKaW50MzJWYWx1ZRIhCg'
    'x1aW50MzJfdmFsdWUYBSABKA1SC3VpbnQzMlZhbHVlEh8KC2ludDY0X3ZhbHVlGAYgASgDUgpp'
    'bnQ2NFZhbHVlEiEKDHVpbnQ2NF92YWx1ZRgHIAEoBFILdWludDY0VmFsdWUSHQoKYm9vbF92YW'
    'x1ZRgOIAEoCFIJYm9vbFZhbHVlEiEKDHN0cmluZ192YWx1ZRgPIAEoCVILc3RyaW5nVmFsdWUS'
    'NgoKZW51bV92YWx1ZRgRIAEoDjIXLnRlc3QuQ29tcGF0aWJpbGl0eUVudW1SCWVudW1WYWx1ZR'
    'I9CgxuZXN0ZWRfdmFsdWUYEiABKAsyGi50ZXN0LkNvbXBhdGliaWxpdHlNZXNzYWdlUgtuZXN0'
    'ZWRWYWx1ZRIpChByZXBlYXRlZF9zdHJpbmdzGBMgAygJUg9yZXBlYXRlZFN0cmluZ3MSJQoOcm'
    'VwZWF0ZWRfaW50MzIYFCADKAVSDXJlcGVhdGVkSW50MzISPgoOcmVwZWF0ZWRfZW51bXMYFSAD'
    'KA4yFy50ZXN0LkNvbXBhdGliaWxpdHlFbnVtUg1yZXBlYXRlZEVudW1zEkMKD3JlcGVhdGVkX2'
    '5lc3RlZBgWIAMoCzIaLnRlc3QuQ29tcGF0aWJpbGl0eU1lc3NhZ2VSDnJlcGVhdGVkTmVzdGVk'
    'EkUKCnN0cmluZ19tYXAYFyADKAsyJi50ZXN0LlRlc3RGaWVsZHNSZXF1ZXN0LlN0cmluZ01hcE'
    'VudHJ5UglzdHJpbmdNYXASSAoLbnVtZXJpY19tYXAYGCADKAsyJy50ZXN0LlRlc3RGaWVsZHNS'
    'ZXF1ZXN0Lk51bWVyaWNNYXBFbnRyeVIKbnVtZXJpY01hcBJFCgpuZXN0ZWRfbWFwGBkgAygLMi'
    'YudGVzdC5UZXN0RmllbGRzUmVxdWVzdC5OZXN0ZWRNYXBFbnRyeVIJbmVzdGVkTWFwGjwKDlN0'
    'cmluZ01hcEVudHJ5EhAKA2tleRgBIAEoCVIDa2V5EhQKBXZhbHVlGAIgASgJUgV2YWx1ZToCOA'
    'EaPQoPTnVtZXJpY01hcEVudHJ5EhAKA2tleRgBIAEoBVIDa2V5EhQKBXZhbHVlGAIgASgEUgV2'
    'YWx1ZToCOAEaWAoOTmVzdGVkTWFwRW50cnkSEAoDa2V5GAEgASgJUgNrZXkSMAoFdmFsdWUYAi'
    'ABKAsyGi50ZXN0LkNvbXBhdGliaWxpdHlNZXNzYWdlUgV2YWx1ZToCOAE=');

@$core.Deprecated('Use testFieldsResponseDescriptor instead')
const TestFieldsResponse$json = {
  '1': 'TestFieldsResponse',
  '2': [
    {'1': 'int32_value', '3': 4, '4': 1, '5': 5, '10': 'int32Value'},
    {'1': 'uint32_value', '3': 5, '4': 1, '5': 13, '10': 'uint32Value'},
    {'1': 'int64_value', '3': 6, '4': 1, '5': 3, '10': 'int64Value'},
    {'1': 'uint64_value', '3': 7, '4': 1, '5': 4, '10': 'uint64Value'},
    {'1': 'bool_value', '3': 14, '4': 1, '5': 8, '10': 'boolValue'},
    {'1': 'string_value', '3': 15, '4': 1, '5': 9, '10': 'stringValue'},
    {
      '1': 'enum_value',
      '3': 17,
      '4': 1,
      '5': 14,
      '6': '.test.CompatibilityEnum',
      '10': 'enumValue'
    },
    {
      '1': 'nested_value',
      '3': 18,
      '4': 1,
      '5': 11,
      '6': '.test.CompatibilityMessage',
      '10': 'nestedValue'
    },
    {'1': 'repeated_strings', '3': 19, '4': 3, '5': 9, '10': 'repeatedStrings'},
    {'1': 'repeated_int32', '3': 20, '4': 3, '5': 5, '10': 'repeatedInt32'},
    {
      '1': 'repeated_enums',
      '3': 21,
      '4': 3,
      '5': 14,
      '6': '.test.CompatibilityEnum',
      '10': 'repeatedEnums'
    },
    {
      '1': 'repeated_nested',
      '3': 22,
      '4': 3,
      '5': 11,
      '6': '.test.CompatibilityMessage',
      '10': 'repeatedNested'
    },
    {
      '1': 'string_map',
      '3': 23,
      '4': 3,
      '5': 11,
      '6': '.test.TestFieldsResponse.StringMapEntry',
      '10': 'stringMap'
    },
    {
      '1': 'numeric_map',
      '3': 24,
      '4': 3,
      '5': 11,
      '6': '.test.TestFieldsResponse.NumericMapEntry',
      '10': 'numericMap'
    },
    {
      '1': 'nested_map',
      '3': 25,
      '4': 3,
      '5': 11,
      '6': '.test.TestFieldsResponse.NestedMapEntry',
      '10': 'nestedMap'
    },
  ],
  '3': [
    TestFieldsResponse_StringMapEntry$json,
    TestFieldsResponse_NumericMapEntry$json,
    TestFieldsResponse_NestedMapEntry$json
  ],
};

@$core.Deprecated('Use testFieldsResponseDescriptor instead')
const TestFieldsResponse_StringMapEntry$json = {
  '1': 'StringMapEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
  '7': {'7': true},
};

@$core.Deprecated('Use testFieldsResponseDescriptor instead')
const TestFieldsResponse_NumericMapEntry$json = {
  '1': 'NumericMapEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 5, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 4, '10': 'value'},
  ],
  '7': {'7': true},
};

@$core.Deprecated('Use testFieldsResponseDescriptor instead')
const TestFieldsResponse_NestedMapEntry$json = {
  '1': 'NestedMapEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {
      '1': 'value',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.test.CompatibilityMessage',
      '10': 'value'
    },
  ],
  '7': {'7': true},
};

/// Descriptor for `TestFieldsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List testFieldsResponseDescriptor = $convert.base64Decode(
    'ChJUZXN0RmllbGRzUmVzcG9uc2USHwoLaW50MzJfdmFsdWUYBCABKAVSCmludDMyVmFsdWUSIQ'
    'oMdWludDMyX3ZhbHVlGAUgASgNUgt1aW50MzJWYWx1ZRIfCgtpbnQ2NF92YWx1ZRgGIAEoA1IK'
    'aW50NjRWYWx1ZRIhCgx1aW50NjRfdmFsdWUYByABKARSC3VpbnQ2NFZhbHVlEh0KCmJvb2xfdm'
    'FsdWUYDiABKAhSCWJvb2xWYWx1ZRIhCgxzdHJpbmdfdmFsdWUYDyABKAlSC3N0cmluZ1ZhbHVl'
    'EjYKCmVudW1fdmFsdWUYESABKA4yFy50ZXN0LkNvbXBhdGliaWxpdHlFbnVtUgllbnVtVmFsdW'
    'USPQoMbmVzdGVkX3ZhbHVlGBIgASgLMhoudGVzdC5Db21wYXRpYmlsaXR5TWVzc2FnZVILbmVz'
    'dGVkVmFsdWUSKQoQcmVwZWF0ZWRfc3RyaW5ncxgTIAMoCVIPcmVwZWF0ZWRTdHJpbmdzEiUKDn'
    'JlcGVhdGVkX2ludDMyGBQgAygFUg1yZXBlYXRlZEludDMyEj4KDnJlcGVhdGVkX2VudW1zGBUg'
    'AygOMhcudGVzdC5Db21wYXRpYmlsaXR5RW51bVINcmVwZWF0ZWRFbnVtcxJDCg9yZXBlYXRlZF'
    '9uZXN0ZWQYFiADKAsyGi50ZXN0LkNvbXBhdGliaWxpdHlNZXNzYWdlUg5yZXBlYXRlZE5lc3Rl'
    'ZBJGCgpzdHJpbmdfbWFwGBcgAygLMicudGVzdC5UZXN0RmllbGRzUmVzcG9uc2UuU3RyaW5nTW'
    'FwRW50cnlSCXN0cmluZ01hcBJJCgtudW1lcmljX21hcBgYIAMoCzIoLnRlc3QuVGVzdEZpZWxk'
    'c1Jlc3BvbnNlLk51bWVyaWNNYXBFbnRyeVIKbnVtZXJpY01hcBJGCgpuZXN0ZWRfbWFwGBkgAy'
    'gLMicudGVzdC5UZXN0RmllbGRzUmVzcG9uc2UuTmVzdGVkTWFwRW50cnlSCW5lc3RlZE1hcBo8'
    'Cg5TdHJpbmdNYXBFbnRyeRIQCgNrZXkYASABKAlSA2tleRIUCgV2YWx1ZRgCIAEoCVIFdmFsdW'
    'U6AjgBGj0KD051bWVyaWNNYXBFbnRyeRIQCgNrZXkYASABKAVSA2tleRIUCgV2YWx1ZRgCIAEo'
    'BFIFdmFsdWU6AjgBGlgKDk5lc3RlZE1hcEVudHJ5EhAKA2tleRgBIAEoCVIDa2V5EjAKBXZhbH'
    'VlGAIgASgLMhoudGVzdC5Db21wYXRpYmlsaXR5TWVzc2FnZVIFdmFsdWU6AjgB');

@$core.Deprecated('Use compatibilityMessageDescriptor instead')
const CompatibilityMessage$json = {
  '1': 'CompatibilityMessage',
  '2': [
    {'1': 'label', '3': 1, '4': 1, '5': 9, '10': 'label'},
    {'1': 'values', '3': 2, '4': 3, '5': 3, '10': 'values'},
    {
      '1': 'attributes',
      '3': 3,
      '4': 3,
      '5': 11,
      '6': '.test.CompatibilityMessage.AttributesEntry',
      '10': 'attributes'
    },
    {
      '1': 'child',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.test.CompatibilityMessage',
      '10': 'child'
    },
  ],
  '3': [CompatibilityMessage_AttributesEntry$json],
};

@$core.Deprecated('Use compatibilityMessageDescriptor instead')
const CompatibilityMessage_AttributesEntry$json = {
  '1': 'AttributesEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 5, '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `CompatibilityMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List compatibilityMessageDescriptor = $convert.base64Decode(
    'ChRDb21wYXRpYmlsaXR5TWVzc2FnZRIUCgVsYWJlbBgBIAEoCVIFbGFiZWwSFgoGdmFsdWVzGA'
    'IgAygDUgZ2YWx1ZXMSSgoKYXR0cmlidXRlcxgDIAMoCzIqLnRlc3QuQ29tcGF0aWJpbGl0eU1l'
    'c3NhZ2UuQXR0cmlidXRlc0VudHJ5UgphdHRyaWJ1dGVzEjAKBWNoaWxkGAQgASgLMhoudGVzdC'
    '5Db21wYXRpYmlsaXR5TWVzc2FnZVIFY2hpbGQaPQoPQXR0cmlidXRlc0VudHJ5EhAKA2tleRgB'
    'IAEoCVIDa2V5EhQKBXZhbHVlGAIgASgFUgV2YWx1ZToCOAE=');

const $core.Map<$core.String, $core.dynamic> TestServiceBase$json = {
  '1': 'TestService',
  '2': [
    {
      '1': 'TestFields',
      '2': '.test.TestFieldsRequest',
      '3': '.test.TestFieldsResponse',
      '4': {}
    },
  ],
};

@$core.Deprecated('Use testServiceDescriptor instead')
const $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>>
    TestServiceBase$messageJson = {
  '.test.TestFieldsRequest': TestFieldsRequest$json,
  '.test.CompatibilityMessage': CompatibilityMessage$json,
  '.test.CompatibilityMessage.AttributesEntry':
      CompatibilityMessage_AttributesEntry$json,
  '.test.TestFieldsRequest.StringMapEntry':
      TestFieldsRequest_StringMapEntry$json,
  '.test.TestFieldsRequest.NumericMapEntry':
      TestFieldsRequest_NumericMapEntry$json,
  '.test.TestFieldsRequest.NestedMapEntry':
      TestFieldsRequest_NestedMapEntry$json,
  '.test.TestFieldsResponse': TestFieldsResponse$json,
  '.test.TestFieldsResponse.StringMapEntry':
      TestFieldsResponse_StringMapEntry$json,
  '.test.TestFieldsResponse.NumericMapEntry':
      TestFieldsResponse_NumericMapEntry$json,
  '.test.TestFieldsResponse.NestedMapEntry':
      TestFieldsResponse_NestedMapEntry$json,
};

/// Descriptor for `TestService`. Decode as a `google.protobuf.ServiceDescriptorProto`.
final $typed_data.Uint8List testServiceDescriptor = $convert.base64Decode(
    'CgtUZXN0U2VydmljZRJLCgpUZXN0RmllbGRzEhcudGVzdC5UZXN0RmllbGRzUmVxdWVzdBoYLn'
    'Rlc3QuVGVzdEZpZWxkc1Jlc3BvbnNlIgrSwRgGL3Rlc3Rt');
