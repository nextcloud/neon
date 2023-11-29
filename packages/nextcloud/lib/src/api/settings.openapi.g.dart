// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings.openapi.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

abstract mixin class $LogSettingsLogSettingsDownloadHeadersInterfaceBuilder {
  void replace($LogSettingsLogSettingsDownloadHeadersInterface other);
  void update(void Function($LogSettingsLogSettingsDownloadHeadersInterfaceBuilder) updates);
  String? get contentDisposition;
  set contentDisposition(String? contentDisposition);
}

class _$LogSettingsLogSettingsDownloadHeaders extends LogSettingsLogSettingsDownloadHeaders {
  @override
  final String? contentDisposition;

  factory _$LogSettingsLogSettingsDownloadHeaders(
          [void Function(LogSettingsLogSettingsDownloadHeadersBuilder)? updates]) =>
      (LogSettingsLogSettingsDownloadHeadersBuilder()..update(updates))._build();

  _$LogSettingsLogSettingsDownloadHeaders._({this.contentDisposition}) : super._();

  @override
  LogSettingsLogSettingsDownloadHeaders rebuild(void Function(LogSettingsLogSettingsDownloadHeadersBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LogSettingsLogSettingsDownloadHeadersBuilder toBuilder() =>
      LogSettingsLogSettingsDownloadHeadersBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LogSettingsLogSettingsDownloadHeaders && contentDisposition == other.contentDisposition;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, contentDisposition.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'LogSettingsLogSettingsDownloadHeaders')
          ..add('contentDisposition', contentDisposition))
        .toString();
  }
}

class LogSettingsLogSettingsDownloadHeadersBuilder
    implements
        Builder<LogSettingsLogSettingsDownloadHeaders, LogSettingsLogSettingsDownloadHeadersBuilder>,
        $LogSettingsLogSettingsDownloadHeadersInterfaceBuilder {
  _$LogSettingsLogSettingsDownloadHeaders? _$v;

  String? _contentDisposition;
  String? get contentDisposition => _$this._contentDisposition;
  set contentDisposition(covariant String? contentDisposition) => _$this._contentDisposition = contentDisposition;

  LogSettingsLogSettingsDownloadHeadersBuilder();

  LogSettingsLogSettingsDownloadHeadersBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _contentDisposition = $v.contentDisposition;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant LogSettingsLogSettingsDownloadHeaders other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$LogSettingsLogSettingsDownloadHeaders;
  }

  @override
  void update(void Function(LogSettingsLogSettingsDownloadHeadersBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  LogSettingsLogSettingsDownloadHeaders build() => _build();

  _$LogSettingsLogSettingsDownloadHeaders _build() {
    final _$result = _$v ?? _$LogSettingsLogSettingsDownloadHeaders._(contentDisposition: contentDisposition);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
