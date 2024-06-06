import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';
import 'package:neon_framework/src/bloc/result.dart';
import 'package:neon_framework/src/utils/request_manager.dart';
import 'package:neon_framework/src/widgets/error.dart';
import 'package:neon_framework/src/widgets/image.dart';
import 'package:neon_framework/src/widgets/linear_progress_indicator.dart';
import 'package:neon_framework/testing.dart';
import 'package:nextcloud/nextcloud.dart';
import 'package:rxdart/rxdart.dart';

class MockRequestManager extends Mock implements RequestManager {}

class MockNextcloudClient extends Mock implements NextcloudClient {}

void main() {
  setUpAll(() {
    registerFallbackValue(BehaviorSubject<Result<Uint8List>>());
    registerFallbackValue(MockAccount());
    registerFallbackValue(MockNextcloudClient());
    registerFallbackValue(http.Request('GET', Uri()));
    registerFallbackValue(Uri());
  });

  testWidgets('NeonImage', (tester) async {
    final image = BehaviorSubject<Result<Uint8List>>();
    final callback = MockCallbackFunction<void>();

    await tester.pumpWidgetWithAccessibility(
      TestApp(
        child: NeonImage(
          image: image,
          onRetry: callback.call,
        ),
      ),
    );

    expect(find.byType(NeonLinearProgressIndicator), findsOne);

    image.add(Result.error(''));
    await tester.pumpAndSettle();

    expect(find.byType(NeonError), findsOne);
    await tester.tap(find.byType(NeonError));
    verify(callback.call).called(1);

    image.add(
      Result.success(
        utf8.encode(
          '<svg height="32" width="32" viewBox="0 0 32 32" xmlns="http://www.w3.org/2000/svg"><rect width="32" height="32" fill="#ffffff"/></svg>',
        ),
      ),
    );
    await tester.pumpAndSettle();
    expect(find.byType(SvgPicture), findsOne);

    image.add(
      Result.success(
        base64.decode(
          'iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAIAAACQd1PeAAABhGlDQ1BJQ0MgcHJvZmlsZQAAKJF9kT1Iw1AUhU9TpSIVByuIOmSoTnZREcdahSJUCLVCqw4mL/2DJg1Jiouj4Fpw8Gex6uDirKuDqyAI/oA4OzgpukiJ9yWFFjFeeLyP8+45vHcfIDQqTLO64oCm22Y6mRCzuVUx9IoARjCIIASZWcacJKXgW1/31E11F+NZ/n1/Vp+atxgQEInjzDBt4g3imU3b4LxPHGElWSU+J54w6YLEj1xXPH7jXHRZ4JkRM5OeJ44Qi8UOVjqYlUyNeJo4qmo65QtZj1XOW5y1So217slfGM7rK8tcpzWKJBaxBAkiFNRQRgU2YrTrpFhI03nCxz/s+iVyKeQqg5FjAVVokF0/+B/8nq1VmJr0ksIJoPvFcT7GgNAu0Kw7zvex4zRPgOAzcKW3/dUGMPtJer2tRY+A/m3g4rqtKXvA5Q4w9GTIpuxKQVpCoQC8n9E35YCBW6B3zZtb6xynD0CGZpW6AQ4OgfEiZa/7vLunc27/9rTm9wMlDXKHV2uA4wAAAAlwSFlzAAAuIwAALiMBeKU/dgAAAAd0SU1FB+gBGxUDIIYV2PEAAAAZdEVYdENvbW1lbnQAQ3JlYXRlZCB3aXRoIEdJTVBXgQ4XAAAADElEQVQI12P4//8/AAX+Av7czFnnAAAAAElFTkSuQmCC',
        ),
      ),
    );
    await tester.pumpAndSettle();
    expect(find.byType(Image), findsOne);

    await image.close();
  });

  testWidgets('NeonApiImage', (tester) async {
    final mockRequestManager = MockRequestManager();
    when(
      () => mockRequestManager.wrapBinary(
        account: any(named: 'account'),
        cacheKey: any(named: 'cacheKey'),
        getCacheParameters: any(named: 'getCacheParameters'),
        getRequest: any(named: 'getRequest'),
        unwrap: any(named: 'unwrap'),
        subject: any(named: 'subject'),
      ),
    ).thenAnswer((_) => Future.value());
    RequestManager.instance = mockRequestManager;

    final mockNextcloudClient = MockNextcloudClient();

    final mockAccount = MockAccount();
    when(() => mockAccount.client).thenReturn(mockNextcloudClient);

    final mockRequest = http.Request('GET', Uri());

    await tester.pumpWidgetWithAccessibility(
      TestApp(
        child: NeonApiImage(
          getRequest: (_) => mockRequest,
          cacheKey: 'key',
          etag: null,
          expires: null,
          account: mockAccount,
        ),
      ),
    );

    verify(
      () => mockRequestManager.wrapBinary(
        account: mockAccount,
        cacheKey: 'key',
        getCacheParameters: any(named: 'getCacheParameters'),
        getRequest: any(named: 'getRequest'),
        unwrap: any(named: 'unwrap', that: isNotNull),
        subject: any(named: 'subject'),
      ),
    ).called(1);
  });

  testWidgets('NeonUriImage', (tester) async {
    final mockRequestManager = MockRequestManager();
    when(
      () => mockRequestManager.wrapUri(
        account: any(named: 'account'),
        uri: any(named: 'uri'),
        unwrap: any(named: 'unwrap'),
        subject: any(named: 'subject'),
      ),
    ).thenAnswer((_) => Future.value());
    RequestManager.instance = mockRequestManager;

    final mockNextcloudClient = MockNextcloudClient();

    final mockAccount = MockAccount();
    when(() => mockAccount.client).thenReturn(mockNextcloudClient);

    final uri = Uri.parse('https://example.com');
    await tester.pumpWidgetWithAccessibility(
      TestApp(
        child: NeonUriImage(
          uri: uri,
          account: mockAccount,
        ),
      ),
    );

    verify(
      () => mockRequestManager.wrapUri(
        account: mockAccount,
        uri: uri,
        unwrap: any(named: 'unwrap', that: isNotNull),
        subject: any(named: 'subject'),
      ),
    ).called(1);
  });
}
