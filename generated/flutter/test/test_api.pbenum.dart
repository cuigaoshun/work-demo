// This is a generated file - do not edit.
//
// Generated from test/test_api.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// CompatibilityEnum 用于测试 protobuf 枚举编码。
class CompatibilityEnum extends $pb.ProtobufEnum {
  static const CompatibilityEnum COMPATIBILITY_ENUM_UNSPECIFIED =
      CompatibilityEnum._(
          0, _omitEnumNames ? '' : 'COMPATIBILITY_ENUM_UNSPECIFIED');
  static const CompatibilityEnum COMPATIBILITY_ENUM_FIRST =
      CompatibilityEnum._(1, _omitEnumNames ? '' : 'COMPATIBILITY_ENUM_FIRST');
  static const CompatibilityEnum COMPATIBILITY_ENUM_SECOND =
      CompatibilityEnum._(2, _omitEnumNames ? '' : 'COMPATIBILITY_ENUM_SECOND');

  static const $core.List<CompatibilityEnum> values = <CompatibilityEnum>[
    COMPATIBILITY_ENUM_UNSPECIFIED,
    COMPATIBILITY_ENUM_FIRST,
    COMPATIBILITY_ENUM_SECOND,
  ];

  static final $core.List<CompatibilityEnum?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static CompatibilityEnum? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const CompatibilityEnum._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');
