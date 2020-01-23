import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class RxTextField extends StatelessWidget {
  final Stream<String> suscribe;
  final Function(String) dispatch;
  final controller;
  final focusNode;
  final decoration;
  final textInputAction;
  final textCapitalization;
  final style;
  final strutStyle;
  final textAlign;
  final textAlignVertical;
  final textDirection;
  final readOnly;
  final showCursor;
  final autofocus;
  final obscureText;
  final autocorrect;
  final enableSuggestions;
  final maxLines;
  final minLines;
  final expands;
  final maxLength;
  final maxLengthEnforced;
  final onChanged;
  final onEditingComplete;
  final onSubmitted;
  final inputFormatters;
  final enabled;
  final cursorWidth;
  final cursorRadius;
  final cursorColor;
  final keyboardAppearance;
  final scrollPadding;
  final dragStartBehavior;
  final enableInteractiveSelection;
  final onTap;
  final buildCounter;
  final scrollController;
  final scrollPhysics;

  RxTextField({
    @required this.suscribe,
    @required this.dispatch,
    Key key,
    this.controller,
    this.focusNode,
    this.decoration = const InputDecoration(),
    TextInputType keyboardType,
    this.textInputAction,
    this.textCapitalization = TextCapitalization.none,
    this.style,
    this.strutStyle,
    this.textAlign = TextAlign.start,
    this.textAlignVertical,
    this.textDirection,
    this.readOnly = false,
    ToolbarOptions toolbarOptions,
    this.showCursor,
    this.autofocus = false,
    this.obscureText = false,
    this.autocorrect = true,
    this.enableSuggestions = true,
    this.maxLines = 1,
    this.minLines,
    this.expands = false,
    this.maxLength,
    this.maxLengthEnforced = true,
    this.onChanged,
    this.onEditingComplete,
    this.onSubmitted,
    this.inputFormatters,
    this.enabled,
    this.cursorWidth = 2.0,
    this.cursorRadius,
    this.cursorColor,
    this.keyboardAppearance,
    this.scrollPadding = const EdgeInsets.all(20.0),
    this.dragStartBehavior = DragStartBehavior.start,
    this.enableInteractiveSelection = true,
    this.onTap,
    this.buildCounter,
    this.scrollController,
    this.scrollPhysics,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String>(
      stream: suscribe,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        InputDecoration decoration = this.decoration.copyWith(errorText: snapshot.error);
        return TextField(
          onChanged: dispatch,
          controller: controller,
          focusNode: focusNode,
          decoration: decoration,
          textInputAction: textInputAction,
          textCapitalization: textCapitalization,
          style: style,
          strutStyle: strutStyle,
          textAlign: textAlign,
          textAlignVertical: textAlignVertical,
          textDirection: textDirection,
          readOnly: readOnly,
          showCursor: showCursor,
          autofocus: autofocus,
          obscureText: obscureText,
          autocorrect: autocorrect,
          enableSuggestions: enableSuggestions,
          maxLines: maxLines,
          minLines: minLines,
          expands: expands,
          maxLength: maxLength,
          maxLengthEnforced: maxLengthEnforced,
          onEditingComplete: onEditingComplete,
          onSubmitted: onSubmitted,
          inputFormatters: inputFormatters,
          enabled: enabled,
          cursorWidth: cursorWidth,
          cursorRadius: cursorRadius,
          cursorColor: cursorColor,
          keyboardAppearance: keyboardAppearance,
          scrollPadding: scrollPadding,
          dragStartBehavior: dragStartBehavior,
          enableInteractiveSelection: enableInteractiveSelection,
          onTap: onTap,
          buildCounter: buildCounter,
          scrollController: scrollController,
          scrollPhysics: scrollPhysics,
        );
      },
    );
  }
}
