// Copyright 2014 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';

class CustomAutocomplete<T extends Object> extends StatelessWidget {
  const CustomAutocomplete({
    required this.optionsBuilder,
    this.displayWidgetForOption = CustomRawAutocomplete.defaultWidgetForOption,
    this.fieldViewBuilder = _defaultFieldViewBuilder,
    this.onSelected,
    this.optionsMaxHeight = 200.0,
    this.optionsViewBuilder,
    this.initialValue,
    super.key,
  });

  final AutocompleteOptionToWidget<T> displayWidgetForOption;

  final AutocompleteFieldViewBuilder fieldViewBuilder;

  final AutocompleteOnSelected<T>? onSelected;

  final AutocompleteOptionsBuilder<T> optionsBuilder;

  final AutocompleteOptionsViewBuilder<T>? optionsViewBuilder;

  final double optionsMaxHeight;

  final TextEditingValue? initialValue;

  static Widget _defaultFieldViewBuilder(
    final BuildContext context,
    final TextEditingController textEditingController,
    final FocusNode focusNode,
    final VoidCallback onFieldSubmitted,
  ) =>
      _CustomAutocompleteField(
        focusNode: focusNode,
        textEditingController: textEditingController,
        onFieldSubmitted: onFieldSubmitted,
      );

  @override
  Widget build(final BuildContext context) => CustomRawAutocomplete<T>(
        displayWidgetForOption: displayWidgetForOption,
        fieldViewBuilder: fieldViewBuilder,
        initialValue: initialValue,
        optionsBuilder: optionsBuilder,
        optionsViewBuilder: optionsViewBuilder ??
            (
              final context,
              final onSelected,
              final options,
            ) =>
                _CustomAutocompleteOptions<T>(
                  displayWidgetForOption: displayWidgetForOption,
                  onSelected: onSelected,
                  options: options,
                  maxOptionsHeight: optionsMaxHeight,
                ),
        onSelected: onSelected,
      );
}

// The default Material-style Autocomplete text field.
class _CustomAutocompleteField extends StatelessWidget {
  const _CustomAutocompleteField({
    required this.focusNode,
    required this.textEditingController,
    required this.onFieldSubmitted,
  });

  final FocusNode focusNode;

  final VoidCallback onFieldSubmitted;

  final TextEditingController textEditingController;

  @override
  Widget build(final BuildContext context) => TextFormField(
        controller: textEditingController,
        focusNode: focusNode,
        onFieldSubmitted: (final value) {
          onFieldSubmitted();
        },
      );
}

// The default Material-style Autocomplete options.
class _CustomAutocompleteOptions<T extends Object> extends StatelessWidget {
  const _CustomAutocompleteOptions({
    required this.displayWidgetForOption,
    required this.onSelected,
    required this.options,
    required this.maxOptionsHeight,
    super.key,
  });

  final AutocompleteOptionToWidget<T> displayWidgetForOption;

  final AutocompleteOnSelected<T> onSelected;

  final Iterable<T> options;
  final double maxOptionsHeight;

  @override
  Widget build(final BuildContext context) => Align(
        alignment: Alignment.topLeft,
        child: Material(
          elevation: 4,
          child: ConstrainedBox(
            constraints: BoxConstraints(maxHeight: maxOptionsHeight),
            child: ListView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              itemCount: options.length,
              itemBuilder: (final context, final index) {
                final option = options.elementAt(index);
                return InkWell(
                  onTap: () {
                    onSelected(option);
                  },
                  child: Builder(
                    builder: (final context) {
                      final highlight = AutocompleteHighlightedOption.of(context) == index;
                      if (highlight) {
                        SchedulerBinding.instance.addPostFrameCallback((final timeStamp) async {
                          await Scrollable.ensureVisible(context, alignment: 0.5);
                        });
                      }
                      return Container(
                        color: highlight ? Theme.of(context).focusColor : null,
                        padding: const EdgeInsets.all(16),
                        child: displayWidgetForOption(option),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ),
      );
}

typedef AutocompleteOptionToWidget<T extends Object> = Widget Function(T option);

class CustomRawAutocomplete<T extends Object> extends StatefulWidget {
  const CustomRawAutocomplete({
    required this.optionsViewBuilder,
    required this.optionsBuilder,
    this.displayWidgetForOption = defaultWidgetForOption,
    this.fieldViewBuilder,
    this.focusNode,
    this.onSelected,
    this.textEditingController,
    this.initialValue,
    super.key,
  })  : assert(
          fieldViewBuilder != null || (key != null && focusNode != null && textEditingController != null),
          'Pass in a fieldViewBuilder, or otherwise create a separate field and pass in the FocusNode, TextEditingController, and a key. Use the key with RawAutocomplete.onFieldSubmitted.',
        ),
        // ignore: prefer_asserts_with_message
        assert((focusNode == null) == (textEditingController == null)),
        assert(
          !(textEditingController != null && initialValue != null),
          'textEditingController and initialValue cannot be simultaneously defined.',
        );

  final AutocompleteFieldViewBuilder? fieldViewBuilder;

  final FocusNode? focusNode;

  final AutocompleteOptionsViewBuilder<T> optionsViewBuilder;

  final AutocompleteOptionToWidget<T> displayWidgetForOption;

  final AutocompleteOnSelected<T>? onSelected;

  final AutocompleteOptionsBuilder<T> optionsBuilder;

  final TextEditingController? textEditingController;

  final TextEditingValue? initialValue;

  static void onFieldSubmitted<T extends Object>(final GlobalKey key) {
    (key.currentState! as _CustomRawAutocompleteState<T>)._onFieldSubmitted();
  }

  static Widget defaultWidgetForOption(final dynamic option) => Text(option.toString());

  @override
  State<CustomRawAutocomplete<T>> createState() => _CustomRawAutocompleteState<T>();
}

class _CustomRawAutocompleteState<T extends Object> extends State<CustomRawAutocomplete<T>> {
  final GlobalKey _fieldKey = GlobalKey();
  final LayerLink _optionsLayerLink = LayerLink();
  late TextEditingController _textEditingController;
  late FocusNode _focusNode;
  late final Map<Type, Action<Intent>> _actionMap;
  late final _CustomAutocompleteCallbackAction<AutocompletePreviousOptionIntent> _previousOptionAction;
  late final _CustomAutocompleteCallbackAction<AutocompleteNextOptionIntent> _nextOptionAction;
  late final _CustomAutocompleteCallbackAction<DismissIntent> _hideOptionsAction;
  Iterable<T> _options = Iterable<T>.empty();
  T? _selection;
  bool _userHidOptions = false;
  String _lastFieldText = '';
  final ValueNotifier<int> _highlightedOptionIndex = ValueNotifier<int>(0);

  static const Map<ShortcutActivator, Intent> _shortcuts = <ShortcutActivator, Intent>{
    SingleActivator(LogicalKeyboardKey.arrowUp): AutocompletePreviousOptionIntent(),
    SingleActivator(LogicalKeyboardKey.arrowDown): AutocompleteNextOptionIntent(),
  };

  // The OverlayEntry containing the options.
  OverlayEntry? _floatingOptions;

  // True iff the state indicates that the options should be visible.
  bool get _shouldShowOptions => !_userHidOptions && _focusNode.hasFocus && _selection == null && _options.isNotEmpty;

  // Called when _textEditingController changes.
  Future<void> _onChangedField() async {
    final value = _textEditingController.value;
    final options = await widget.optionsBuilder(
      value,
    );
    _options = options;
    _updateHighlight(_highlightedOptionIndex.value);
    if (_selection != null && value.text != _selection!.toString()) {
      _selection = null;
    }

    // Make sure the options are no longer hidden if the content of the field
    // changes (ignore selection changes).
    if (value.text != _lastFieldText) {
      _userHidOptions = false;
      _lastFieldText = value.text;
    }
    _updateActions();
    _updateOverlay();
  }

  // Called when the field's FocusNode changes.
  void _onChangedFocus() {
    // Options should no longer be hidden when the field is re-focused.
    _userHidOptions = !_focusNode.hasFocus;
    _updateActions();
    _updateOverlay();
  }

  // Called from fieldViewBuilder when the user submits the field.
  void _onFieldSubmitted() {
    if (_options.isEmpty || _userHidOptions) {
      return;
    }
    _select(_options.elementAt(_highlightedOptionIndex.value));
  }

  // Select the given option and update the widget.
  void _select(final T nextSelection) {
    if (nextSelection == _selection) {
      return;
    }
    _selection = nextSelection;
    final selectionString = nextSelection.toString();
    _textEditingController.value = TextEditingValue(
      selection: TextSelection.collapsed(offset: selectionString.length),
      text: selectionString,
    );
    _updateActions();
    _updateOverlay();
    widget.onSelected?.call(_selection!);
  }

  void _updateHighlight(final int newIndex) {
    _highlightedOptionIndex.value = _options.isEmpty ? 0 : newIndex % _options.length;
  }

  void _highlightPreviousOption(final AutocompletePreviousOptionIntent intent) {
    if (_userHidOptions) {
      _userHidOptions = false;
      _updateActions();
      _updateOverlay();
      return;
    }
    _updateHighlight(_highlightedOptionIndex.value - 1);
  }

  void _highlightNextOption(final AutocompleteNextOptionIntent intent) {
    if (_userHidOptions) {
      _userHidOptions = false;
      _updateActions();
      _updateOverlay();
      return;
    }
    _updateHighlight(_highlightedOptionIndex.value + 1);
  }

  Object? _hideOptions(final DismissIntent intent) {
    if (!_userHidOptions) {
      _userHidOptions = true;
      _updateActions();
      _updateOverlay();
      return null;
    }
    return Actions.invoke(context, intent);
  }

  void _setActionsEnabled(final bool enabled) {
    // The enabled state determines whether the action will consume the
    // key shortcut or let it continue on to the underlying text field.
    // They should only be enabled when the options are showing so shortcuts
    // can be used to navigate them.
    _previousOptionAction.enabled = enabled;
    _nextOptionAction.enabled = enabled;
    _hideOptionsAction.enabled = enabled;
  }

  void _updateActions() {
    _setActionsEnabled(_focusNode.hasFocus && _selection == null && _options.isNotEmpty);
  }

  bool _floatingOptionsUpdateScheduled = false;
  // Hide or show the options overlay, if needed.
  void _updateOverlay() {
    if (SchedulerBinding.instance.schedulerPhase == SchedulerPhase.persistentCallbacks) {
      if (!_floatingOptionsUpdateScheduled) {
        _floatingOptionsUpdateScheduled = true;
        SchedulerBinding.instance.addPostFrameCallback((final timeStamp) {
          _floatingOptionsUpdateScheduled = false;
          _updateOverlay();
        });
      }
      return;
    }

    _floatingOptions?.remove();
    if (_shouldShowOptions) {
      final newFloatingOptions = OverlayEntry(
        builder: (final context) => CompositedTransformFollower(
          link: _optionsLayerLink,
          showWhenUnlinked: false,
          targetAnchor: Alignment.bottomLeft,
          child: AutocompleteHighlightedOption(
            highlightIndexNotifier: _highlightedOptionIndex,
            child: Builder(
              builder: (final context) => widget.optionsViewBuilder(
                context,
                _select,
                _options,
              ),
            ),
          ),
        ),
      );
      Overlay.of(context, rootOverlay: true)!.insert(newFloatingOptions);
      _floatingOptions = newFloatingOptions;
    } else {
      _floatingOptions = null;
    }
  }

  // Handle a potential change in textEditingController by properly disposing of
  // the old one and setting up the new one, if needed.
  void _updateTextEditingController(final TextEditingController? old, final TextEditingController? current) {
    if ((old == null && current == null) || old == current) {
      return;
    }
    if (old == null) {
      _textEditingController
        ..removeListener(_onChangedField)
        ..dispose();
      _textEditingController = current!;
    } else if (current == null) {
      _textEditingController.removeListener(_onChangedField);
      _textEditingController = TextEditingController();
    } else {
      _textEditingController.removeListener(_onChangedField);
      _textEditingController = current;
    }
    _textEditingController.addListener(_onChangedField);
  }

  // Handle a potential change in focusNode by properly disposing of the old one
  // and setting up the new one, if needed.
  void _updateFocusNode(final FocusNode? old, final FocusNode? current) {
    if ((old == null && current == null) || old == current) {
      return;
    }
    if (old == null) {
      _focusNode
        ..removeListener(_onChangedFocus)
        ..dispose();
      _focusNode = current!;
    } else if (current == null) {
      _focusNode.removeListener(_onChangedFocus);
      _focusNode = FocusNode();
    } else {
      _focusNode.removeListener(_onChangedFocus);
      _focusNode = current;
    }
    _focusNode.addListener(_onChangedFocus);
  }

  @override
  void initState() {
    super.initState();
    _textEditingController = widget.textEditingController ?? TextEditingController.fromValue(widget.initialValue);
    _textEditingController.addListener(_onChangedField);
    _focusNode = widget.focusNode ?? FocusNode();
    _focusNode.addListener(_onChangedFocus);
    _previousOptionAction =
        _CustomAutocompleteCallbackAction<AutocompletePreviousOptionIntent>(onInvoke: _highlightPreviousOption);
    _nextOptionAction = _CustomAutocompleteCallbackAction<AutocompleteNextOptionIntent>(onInvoke: _highlightNextOption);
    _hideOptionsAction = _CustomAutocompleteCallbackAction<DismissIntent>(onInvoke: _hideOptions);
    _actionMap = <Type, Action<Intent>>{
      AutocompletePreviousOptionIntent: _previousOptionAction,
      AutocompleteNextOptionIntent: _nextOptionAction,
      DismissIntent: _hideOptionsAction,
    };
    _updateActions();
    _updateOverlay();
  }

  @override
  void didUpdateWidget(final CustomRawAutocomplete<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    _updateTextEditingController(
      oldWidget.textEditingController,
      widget.textEditingController,
    );
    _updateFocusNode(oldWidget.focusNode, widget.focusNode);
    _updateActions();
    _updateOverlay();
  }

  @override
  void dispose() {
    _textEditingController.removeListener(_onChangedField);
    if (widget.textEditingController == null) {
      _textEditingController.dispose();
    }
    _focusNode.removeListener(_onChangedFocus);
    if (widget.focusNode == null) {
      _focusNode.dispose();
    }
    _floatingOptions?.remove();
    _floatingOptions = null;
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) => Container(
        key: _fieldKey,
        child: Shortcuts(
          shortcuts: _shortcuts,
          child: Actions(
            actions: _actionMap,
            child: CompositedTransformTarget(
              link: _optionsLayerLink,
              child: widget.fieldViewBuilder == null
                  ? const SizedBox.shrink()
                  : widget.fieldViewBuilder!(
                      context,
                      _textEditingController,
                      _focusNode,
                      _onFieldSubmitted,
                    ),
            ),
          ),
        ),
      );
}

class _CustomAutocompleteCallbackAction<T extends Intent> extends CallbackAction<T> {
  _CustomAutocompleteCallbackAction({
    required super.onInvoke,
    this.enabled = true,
  });

  bool enabled;

  @override
  bool isEnabled(covariant final T intent) => enabled;

  @override
  bool consumesKey(covariant final T intent) => enabled;
}
