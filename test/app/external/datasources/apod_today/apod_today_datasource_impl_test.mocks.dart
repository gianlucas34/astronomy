// Mocks generated by Mockito 5.4.2 from annotations
// in astronomy/test/app/external/datasources/apod_today/apod_today_datasource_impl_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:astronomy/core/interfaces/http.dart' as _i3;
import 'package:astronomy/core/returns/http_result.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeHttpResult_0 extends _i1.SmartFake implements _i2.HttpResult {
  _FakeHttpResult_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [Http].
///
/// See the documentation for Mockito's code generation for more information.
class MockHttp extends _i1.Mock implements _i3.Http {
  @override
  _i4.Future<_i2.HttpResult> get(
    String? url, [
    Map<dynamic, dynamic>? options = const {},
  ]) =>
      (super.noSuchMethod(
        Invocation.method(
          #get,
          [
            url,
            options,
          ],
        ),
        returnValue: _i4.Future<_i2.HttpResult>.value(_FakeHttpResult_0(
          this,
          Invocation.method(
            #get,
            [
              url,
              options,
            ],
          ),
        )),
        returnValueForMissingStub:
            _i4.Future<_i2.HttpResult>.value(_FakeHttpResult_0(
          this,
          Invocation.method(
            #get,
            [
              url,
              options,
            ],
          ),
        )),
      ) as _i4.Future<_i2.HttpResult>);
}
