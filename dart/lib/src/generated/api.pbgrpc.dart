///
//  Generated code. Do not modify.
//  source: api.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'api.pb.dart' as $0;
export 'api.pb.dart';

class ResponderClient extends $grpc.Client {
  static final _$invoke = $grpc.ClientMethod<$0.Request, $0.Response>(
      '/api.Responder/Invoke',
      ($0.Request value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Response.fromBuffer(value));

  ResponderClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.Response> invoke($0.Request request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$invoke, request, options: options);
  }
}

abstract class ResponderServiceBase extends $grpc.Service {
  $core.String get $name => 'api.Responder';

  ResponderServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.Request, $0.Response>(
        'Invoke',
        invoke_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Request.fromBuffer(value),
        ($0.Response value) => value.writeToBuffer()));
  }

  $async.Future<$0.Response> invoke_Pre(
      $grpc.ServiceCall call, $async.Future<$0.Request> request) async {
    return invoke(call, await request);
  }

  $async.Future<$0.Response> invoke($grpc.ServiceCall call, $0.Request request);
}
