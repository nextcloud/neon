// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings.openapi.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

abstract mixin class SettingsLogSettingsLogSettingsDownloadHeadersInterfaceBuilder {
  void replace(SettingsLogSettingsLogSettingsDownloadHeadersInterface other);
  void update(void Function(SettingsLogSettingsLogSettingsDownloadHeadersInterfaceBuilder) updates);
  String? get contentDisposition;
  set contentDisposition(String? contentDisposition);
}

class _$SettingsLogSettingsLogSettingsDownloadHeaders extends SettingsLogSettingsLogSettingsDownloadHeaders {
  @override
  final String? contentDisposition;

  factory _$SettingsLogSettingsLogSettingsDownloadHeaders(
          [void Function(SettingsLogSettingsLogSettingsDownloadHeadersBuilder)? updates]) =>
      (SettingsLogSettingsLogSettingsDownloadHeadersBuilder()..update(updates))._build();

  _$SettingsLogSettingsLogSettingsDownloadHeaders._({this.contentDisposition}) : super._();

  @override
  SettingsLogSettingsLogSettingsDownloadHeaders rebuild(
          void Function(SettingsLogSettingsLogSettingsDownloadHeadersBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SettingsLogSettingsLogSettingsDownloadHeadersBuilder toBuilder() =>
      SettingsLogSettingsLogSettingsDownloadHeadersBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SettingsLogSettingsLogSettingsDownloadHeaders && contentDisposition == other.contentDisposition;
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
    return (newBuiltValueToStringHelper(r'SettingsLogSettingsLogSettingsDownloadHeaders')
          ..add('contentDisposition', contentDisposition))
        .toString();
  }
}

class SettingsLogSettingsLogSettingsDownloadHeadersBuilder
    implements
        Builder<SettingsLogSettingsLogSettingsDownloadHeaders, SettingsLogSettingsLogSettingsDownloadHeadersBuilder>,
        SettingsLogSettingsLogSettingsDownloadHeadersInterfaceBuilder {
  _$SettingsLogSettingsLogSettingsDownloadHeaders? _$v;

  String? _contentDisposition;
  String? get contentDisposition => _$this._contentDisposition;
  set contentDisposition(covariant String? contentDisposition) => _$this._contentDisposition = contentDisposition;

  SettingsLogSettingsLogSettingsDownloadHeadersBuilder();

  SettingsLogSettingsLogSettingsDownloadHeadersBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _contentDisposition = $v.contentDisposition;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant SettingsLogSettingsLogSettingsDownloadHeaders other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SettingsLogSettingsLogSettingsDownloadHeaders;
  }

  @override
  void update(void Function(SettingsLogSettingsLogSettingsDownloadHeadersBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SettingsLogSettingsLogSettingsDownloadHeaders build() => _build();

  _$SettingsLogSettingsLogSettingsDownloadHeaders _build() {
    final _$result = _$v ?? _$SettingsLogSettingsLogSettingsDownloadHeaders._(contentDisposition: contentDisposition);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
