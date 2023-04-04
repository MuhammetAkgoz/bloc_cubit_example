import 'package:flutter/material.dart';

import 'package:keyboard_actions/keyboard_actions.dart';

class KeyboardUtil {
  static void unFocus() => FocusManager.instance.primaryFocus?.unfocus();

  static KeyboardActionsConfig getKeyboardOkButton(FocusNode focusNode, {Widget? child}) {
    return KeyboardActionsConfig(
      keyboardActionsPlatform: KeyboardActionsPlatform.IOS,
      actions: [
        KeyboardActionsItem(
          focusNode: focusNode,
          displayArrows: false,
          toolbarButtons: [(node) => TextButton(onPressed: KeyboardUtil.unFocus, child: child ?? const SizedBox())],
        ),
      ],
    );
  }
}
