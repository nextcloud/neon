// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// Generator: RxBlocGeneratorForAnnotation
// **************************************************************************

part of 'accounts.dart';

/// Used as a contractor for the bloc, events and states classes
/// {@nodoc}
abstract class AccountsBlocType extends RxBlocTypeBase {
  AccountsBlocEvents get events;
  AccountsBlocStates get states;
}

/// [$AccountsBloc] extended by the [AccountsBloc]
/// {@nodoc}
abstract class $AccountsBloc extends RxBlocBase implements AccountsBlocEvents, AccountsBlocStates, AccountsBlocType {
  final _compositeSubscription = CompositeSubscription();

  /// Тhe [Subject] where events sink to by calling [addAccount]
  final _$addAccountEvent = PublishSubject<Account>();

  /// Тhe [Subject] where events sink to by calling [removeAccount]
  final _$removeAccountEvent = PublishSubject<Account>();

  /// Тhe [Subject] where events sink to by calling [updateAccount]
  final _$updateAccountEvent = PublishSubject<Account>();

  /// Тhe [Subject] where events sink to by calling [setActiveAccount]
  final _$setActiveAccountEvent = PublishSubject<Account?>();

  /// The state of [accounts] implemented in [_mapToAccountsState]
  late final BehaviorSubject<List<Account>> _accountsState = _mapToAccountsState();

  /// The state of [activeAccount] implemented in [_mapToActiveAccountState]
  late final BehaviorSubject<Account?> _activeAccountState = _mapToActiveAccountState();

  @override
  void addAccount(Account account) => _$addAccountEvent.add(account);

  @override
  void removeAccount(Account account) => _$removeAccountEvent.add(account);

  @override
  void updateAccount(Account account) => _$updateAccountEvent.add(account);

  @override
  void setActiveAccount(Account? account) => _$setActiveAccountEvent.add(account);

  @override
  BehaviorSubject<List<Account>> get accounts => _accountsState;

  @override
  BehaviorSubject<Account?> get activeAccount => _activeAccountState;

  BehaviorSubject<List<Account>> _mapToAccountsState();

  BehaviorSubject<Account?> _mapToActiveAccountState();

  @override
  AccountsBlocEvents get events => this;

  @override
  AccountsBlocStates get states => this;

  @override
  void dispose() {
    _$addAccountEvent.close();
    _$removeAccountEvent.close();
    _$updateAccountEvent.close();
    _$setActiveAccountEvent.close();
    _compositeSubscription.dispose();
    super.dispose();
  }
}
