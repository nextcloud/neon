import 'dart:async';

import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:neon_framework/blocs.dart';
import 'package:neon_framework/src/blocs/capabilities.dart';
import 'package:neon_framework/src/models/app_implementation.dart';
import 'package:neon_framework/src/utils/provider.dart';
import 'package:neon_framework/src/widgets/drawer.dart';
import 'package:neon_framework/src/widgets/drawer_destination.dart';
import 'package:neon_framework/testing.dart';
import 'package:nextcloud/core.dart' as core;
import 'package:rxdart/rxdart.dart';

class BuildContextFake extends Fake implements BuildContext {}

void main() {
  setUpAll(() {
    registerFallbackValue(BuildContextFake());
  });

  testWidgets('Drawer', (tester) async {
    final appImplementation = MockAppImplementation();
    when(() => appImplementation.id).thenReturn('id');
    when(() => appImplementation.destination(any())).thenReturn(
      NeonNavigationDestination(
        label: 'label',
        // ignore: avoid_types_on_closure_parameters
        icon: ({size, Color? color}) => Icon(
          Icons.add,
          size: size,
          color: color,
        ),
      ),
    );

    final appImplementations =
        BehaviorSubject<Result<BuiltSet<AppImplementation>>>.seeded(Result.success(BuiltSet({appImplementation})));
    final activeApp = BehaviorSubject<AppImplementation>();
    final appsBloc = MockAppsBloc();
    when(() => appsBloc.activeApp).thenAnswer((_) => activeApp);
    when(() => appsBloc.appImplementations).thenAnswer((_) => appImplementations);

    final capabilities =
        BehaviorSubject<Result<core.OcsGetCapabilitiesResponseApplicationJson_Ocs_Data>>.seeded(Result.error(null));
    final capabilitiesBloc = MockCapabilitiesBloc();
    when(() => capabilitiesBloc.capabilities).thenAnswer((_) => capabilities);

    await tester.pumpWidgetWithAccessibility(
      TestApp(
        providers: [
          NeonProvider<AppsBloc>.value(value: appsBloc),
          NeonProvider<CapabilitiesBloc>.value(value: capabilitiesBloc),
        ],
        child: const NeonDrawer(),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.byType(NavigationDrawerDestination), findsOne);
    expect(find.text('label'), findsOne);
    expect(find.byIcon(Icons.add), findsOne);

    unawaited(capabilities.close());
    unawaited(activeApp.close());
    unawaited(appImplementations.close());
  });
}
