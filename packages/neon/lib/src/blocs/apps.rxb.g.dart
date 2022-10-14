// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// Generator: RxBlocGeneratorForAnnotation
// **************************************************************************

part of 'apps.dart';

/// Used as a contractor for the bloc, events and states classes
/// {@nodoc}
abstract class AppsBlocType extends RxBlocTypeBase {
  AppsBlocEvents get events;
  AppsBlocStates get states;
}

/// [$AppsBloc] extended by the [AppsBloc]
/// {@nodoc}
abstract class $AppsBloc extends RxBlocBase implements AppsBlocEvents, AppsBlocStates, AppsBlocType {
  final _compositeSubscription = CompositeSubscription();

  /// Тhe [Subject] where events sink to by calling [refresh]
  final _$refreshEvent = PublishSubject<void>();

  /// Тhe [Subject] where events sink to by calling [setActiveApp]
  final _$setActiveAppEvent = PublishSubject<String?>();

  /// The state of [apps] implemented in [_mapToAppsState]
  late final BehaviorSubject<Result<List<CoreNavigationApps_Ocs_Data>>> _appsState = _mapToAppsState();

  /// The state of [appImplementations] implemented in
  /// [_mapToAppImplementationsState]
  late final BehaviorSubject<Result<List<AppImplementation<RxBlocBase, NextcloudAppSpecificOptions>>>>
      _appImplementationsState = _mapToAppImplementationsState();

  /// The state of [activeAppID] implemented in [_mapToActiveAppIDState]
  late final BehaviorSubject<String?> _activeAppIDState = _mapToActiveAppIDState();

  @override
  void refresh() => _$refreshEvent.add(null);

  @override
  void setActiveApp(String? appID) => _$setActiveAppEvent.add(appID);

  @override
  BehaviorSubject<Result<List<CoreNavigationApps_Ocs_Data>>> get apps => _appsState;

  @override
  BehaviorSubject<Result<List<AppImplementation<RxBlocBase, NextcloudAppSpecificOptions>>>> get appImplementations =>
      _appImplementationsState;

  @override
  BehaviorSubject<String?> get activeAppID => _activeAppIDState;

  BehaviorSubject<Result<List<CoreNavigationApps_Ocs_Data>>> _mapToAppsState();

  BehaviorSubject<Result<List<AppImplementation<RxBlocBase, NextcloudAppSpecificOptions>>>>
      _mapToAppImplementationsState();

  BehaviorSubject<String?> _mapToActiveAppIDState();

  @override
  AppsBlocEvents get events => this;

  @override
  AppsBlocStates get states => this;

  @override
  void dispose() {
    _$refreshEvent.close();
    _$setActiveAppEvent.close();
    _compositeSubscription.dispose();
    super.dispose();
  }
}
