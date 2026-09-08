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
      '6': '.workdemo.api.test.CompatibilityEnum',
      '10': 'enumValue'
    },
    {
      '1': 'nested_value',
      '3': 18,
      '4': 1,
      '5': 11,
      '6': '.workdemo.api.test.CompatibilityMessage',
      '10': 'nestedValue'
    },
    {'1': 'repeated_strings', '3': 19, '4': 3, '5': 9, '10': 'repeatedStrings'},
    {'1': 'repeated_int32', '3': 20, '4': 3, '5': 5, '10': 'repeatedInt32'},
    {
      '1': 'repeated_enums',
      '3': 21,
      '4': 3,
      '5': 14,
      '6': '.workdemo.api.test.CompatibilityEnum',
      '10': 'repeatedEnums'
    },
    {
      '1': 'repeated_nested',
      '3': 22,
      '4': 3,
      '5': 11,
      '6': '.workdemo.api.test.CompatibilityMessage',
      '10': 'repeatedNested'
    },
    {
      '1': 'string_map',
      '3': 23,
      '4': 3,
      '5': 11,
      '6': '.workdemo.api.test.TestFieldsRequest.StringMapEntry',
      '10': 'stringMap'
    },
    {
      '1': 'numeric_map',
      '3': 24,
      '4': 3,
      '5': 11,
      '6': '.workdemo.api.test.TestFieldsRequest.NumericMapEntry',
      '10': 'numericMap'
    },
    {
      '1': 'nested_map',
      '3': 25,
      '4': 3,
      '5': 11,
      '6': '.workdemo.api.test.TestFieldsRequest.NestedMapEntry',
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
      '6': '.workdemo.api.test.CompatibilityMessage',
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
    'QwoKZW51bV92YWx1ZRgRIAEoDjIkLndvcmtkZW1vLmFwaS50ZXN0LkNvbXBhdGliaWxpdHlFbn'
    'VtUgllbnVtVmFsdWUSSgoMbmVzdGVkX3ZhbHVlGBIgASgLMicud29ya2RlbW8uYXBpLnRlc3Qu'
    'Q29tcGF0aWJpbGl0eU1lc3NhZ2VSC25lc3RlZFZhbHVlEikKEHJlcGVhdGVkX3N0cmluZ3MYEy'
    'ADKAlSD3JlcGVhdGVkU3RyaW5ncxIlCg5yZXBlYXRlZF9pbnQzMhgUIAMoBVINcmVwZWF0ZWRJ'
    'bnQzMhJLCg5yZXBlYXRlZF9lbnVtcxgVIAMoDjIkLndvcmtkZW1vLmFwaS50ZXN0LkNvbXBhdG'
    'liaWxpdHlFbnVtUg1yZXBlYXRlZEVudW1zElAKD3JlcGVhdGVkX25lc3RlZBgWIAMoCzInLndv'
    'cmtkZW1vLmFwaS50ZXN0LkNvbXBhdGliaWxpdHlNZXNzYWdlUg5yZXBlYXRlZE5lc3RlZBJSCg'
    'pzdHJpbmdfbWFwGBcgAygLMjMud29ya2RlbW8uYXBpLnRlc3QuVGVzdEZpZWxkc1JlcXVlc3Qu'
    'U3RyaW5nTWFwRW50cnlSCXN0cmluZ01hcBJVCgtudW1lcmljX21hcBgYIAMoCzI0LndvcmtkZW'
    '1vLmFwaS50ZXN0LlRlc3RGaWVsZHNSZXF1ZXN0Lk51bWVyaWNNYXBFbnRyeVIKbnVtZXJpY01h'
    'cBJSCgpuZXN0ZWRfbWFwGBkgAygLMjMud29ya2RlbW8uYXBpLnRlc3QuVGVzdEZpZWxkc1JlcX'
    'Vlc3QuTmVzdGVkTWFwRW50cnlSCW5lc3RlZE1hcBo8Cg5TdHJpbmdNYXBFbnRyeRIQCgNrZXkY'
    'ASABKAlSA2tleRIUCgV2YWx1ZRgCIAEoCVIFdmFsdWU6AjgBGj0KD051bWVyaWNNYXBFbnRyeR'
    'IQCgNrZXkYASABKAVSA2tleRIUCgV2YWx1ZRgCIAEoBFIFdmFsdWU6AjgBGmUKDk5lc3RlZE1h'
    'cEVudHJ5EhAKA2tleRgBIAEoCVIDa2V5Ej0KBXZhbHVlGAIgASgLMicud29ya2RlbW8uYXBpLn'
    'Rlc3QuQ29tcGF0aWJpbGl0eU1lc3NhZ2VSBXZhbHVlOgI4AQ==');

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
      '6': '.workdemo.api.test.CompatibilityEnum',
      '10': 'enumValue'
    },
    {
      '1': 'nested_value',
      '3': 18,
      '4': 1,
      '5': 11,
      '6': '.workdemo.api.test.CompatibilityMessage',
      '10': 'nestedValue'
    },
    {'1': 'repeated_strings', '3': 19, '4': 3, '5': 9, '10': 'repeatedStrings'},
    {'1': 'repeated_int32', '3': 20, '4': 3, '5': 5, '10': 'repeatedInt32'},
    {
      '1': 'repeated_enums',
      '3': 21,
      '4': 3,
      '5': 14,
      '6': '.workdemo.api.test.CompatibilityEnum',
      '10': 'repeatedEnums'
    },
    {
      '1': 'repeated_nested',
      '3': 22,
      '4': 3,
      '5': 11,
      '6': '.workdemo.api.test.CompatibilityMessage',
      '10': 'repeatedNested'
    },
    {
      '1': 'string_map',
      '3': 23,
      '4': 3,
      '5': 11,
      '6': '.workdemo.api.test.TestFieldsResponse.StringMapEntry',
      '10': 'stringMap'
    },
    {
      '1': 'numeric_map',
      '3': 24,
      '4': 3,
      '5': 11,
      '6': '.workdemo.api.test.TestFieldsResponse.NumericMapEntry',
      '10': 'numericMap'
    },
    {
      '1': 'nested_map',
      '3': 25,
      '4': 3,
      '5': 11,
      '6': '.workdemo.api.test.TestFieldsResponse.NestedMapEntry',
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
      '6': '.workdemo.api.test.CompatibilityMessage',
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
    'EkMKCmVudW1fdmFsdWUYESABKA4yJC53b3JrZGVtby5hcGkudGVzdC5Db21wYXRpYmlsaXR5RW'
    '51bVIJZW51bVZhbHVlEkoKDG5lc3RlZF92YWx1ZRgSIAEoCzInLndvcmtkZW1vLmFwaS50ZXN0'
    'LkNvbXBhdGliaWxpdHlNZXNzYWdlUgtuZXN0ZWRWYWx1ZRIpChByZXBlYXRlZF9zdHJpbmdzGB'
    'MgAygJUg9yZXBlYXRlZFN0cmluZ3MSJQoOcmVwZWF0ZWRfaW50MzIYFCADKAVSDXJlcGVhdGVk'
    'SW50MzISSwoOcmVwZWF0ZWRfZW51bXMYFSADKA4yJC53b3JrZGVtby5hcGkudGVzdC5Db21wYX'
    'RpYmlsaXR5RW51bVINcmVwZWF0ZWRFbnVtcxJQCg9yZXBlYXRlZF9uZXN0ZWQYFiADKAsyJy53'
    'b3JrZGVtby5hcGkudGVzdC5Db21wYXRpYmlsaXR5TWVzc2FnZVIOcmVwZWF0ZWROZXN0ZWQSUw'
    'oKc3RyaW5nX21hcBgXIAMoCzI0LndvcmtkZW1vLmFwaS50ZXN0LlRlc3RGaWVsZHNSZXNwb25z'
    'ZS5TdHJpbmdNYXBFbnRyeVIJc3RyaW5nTWFwElYKC251bWVyaWNfbWFwGBggAygLMjUud29ya2'
    'RlbW8uYXBpLnRlc3QuVGVzdEZpZWxkc1Jlc3BvbnNlLk51bWVyaWNNYXBFbnRyeVIKbnVtZXJp'
    'Y01hcBJTCgpuZXN0ZWRfbWFwGBkgAygLMjQud29ya2RlbW8uYXBpLnRlc3QuVGVzdEZpZWxkc1'
    'Jlc3BvbnNlLk5lc3RlZE1hcEVudHJ5UgluZXN0ZWRNYXAaPAoOU3RyaW5nTWFwRW50cnkSEAoD'
    'a2V5GAEgASgJUgNrZXkSFAoFdmFsdWUYAiABKAlSBXZhbHVlOgI4ARo9Cg9OdW1lcmljTWFwRW'
    '50cnkSEAoDa2V5GAEgASgFUgNrZXkSFAoFdmFsdWUYAiABKARSBXZhbHVlOgI4ARplCg5OZXN0'
    'ZWRNYXBFbnRyeRIQCgNrZXkYASABKAlSA2tleRI9CgV2YWx1ZRgCIAEoCzInLndvcmtkZW1vLm'
    'FwaS50ZXN0LkNvbXBhdGliaWxpdHlNZXNzYWdlUgV2YWx1ZToCOAE=');

@$core.Deprecated('Use testBindRequestDescriptor instead')
const TestBindRequest$json = {
  '1': 'TestBindRequest',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 3, '10': 'id'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '8': {}, '10': 'name'},
  ],
};

/// Descriptor for `TestBindRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List testBindRequestDescriptor = $convert.base64Decode(
    'Cg9UZXN0QmluZFJlcXVlc3QSDgoCaWQYASABKANSAmlkEiQKBG5hbWUYAiABKAlCENq7GAxsZW'
    '4oJCkgPD0gMjBSBG5hbWU=');

@$core.Deprecated('Use testBindResponseDescriptor instead')
const TestBindResponse$json = {
  '1': 'TestBindResponse',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 3, '10': 'id'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
  ],
};

/// Descriptor for `TestBindResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List testBindResponseDescriptor = $convert.base64Decode(
    'ChBUZXN0QmluZFJlc3BvbnNlEg4KAmlkGAEgASgDUgJpZBISCgRuYW1lGAIgASgJUgRuYW1l');

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
      '6': '.workdemo.api.test.CompatibilityMessage.AttributesEntry',
      '10': 'attributes'
    },
    {
      '1': 'child',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.workdemo.api.test.CompatibilityMessage',
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
    'IgAygDUgZ2YWx1ZXMSVwoKYXR0cmlidXRlcxgDIAMoCzI3LndvcmtkZW1vLmFwaS50ZXN0LkNv'
    'bXBhdGliaWxpdHlNZXNzYWdlLkF0dHJpYnV0ZXNFbnRyeVIKYXR0cmlidXRlcxI9CgVjaGlsZB'
    'gEIAEoCzInLndvcmtkZW1vLmFwaS50ZXN0LkNvbXBhdGliaWxpdHlNZXNzYWdlUgVjaGlsZBo9'
    'Cg9BdHRyaWJ1dGVzRW50cnkSEAoDa2V5GAEgASgJUgNrZXkSFAoFdmFsdWUYAiABKAVSBXZhbH'
    'VlOgI4AQ==');

const $core.Map<$core.String, $core.dynamic> TestServiceBase$json = {
  '1': 'TestService',
  '2': [
    {
      '1': 'TestBind',
      '2': '.workdemo.api.test.TestBindRequest',
      '3': '.workdemo.api.test.TestBindResponse',
      '4': {}
    },
  ],
};

@$core.Deprecated('Use testServiceDescriptor instead')
const $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>>
    TestServiceBase$messageJson = {
  '.workdemo.api.test.TestBindRequest': TestBindRequest$json,
  '.workdemo.api.test.TestBindResponse': TestBindResponse$json,
};

/// Descriptor for `TestService`. Decode as a `google.protobuf.ServiceDescriptorProto`.
final $typed_data.Uint8List testServiceDescriptor = $convert.base64Decode(
    'CgtUZXN0U2VydmljZRJiCghUZXN0QmluZBIiLndvcmtkZW1vLmFwaS50ZXN0LlRlc3RCaW5kUm'
    'VxdWVzdBojLndvcmtkZW1vLmFwaS50ZXN0LlRlc3RCaW5kUmVzcG9uc2UiDdLBGAkvdGVzdEJp'
    'bmQ=');
