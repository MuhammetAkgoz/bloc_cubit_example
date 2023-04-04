import 'package:flutter/material.dart';

import 'package:keyboard_actions/keyboard_actions.dart';
import 'package:neo_flutter_base/core/storage/enum/resource_key.dart';
import 'package:neo_flutter_base/core/storage/resource/resource_manager.dart';
import 'package:neo_flutter_base/product/component/text/dt_text.dart';

class KeyboardUtil {
  static void unFocus() => FocusManager.instance.primaryFocus?.unfocus();

  static KeyboardActionsConfig getKeyboardOkButton(FocusNode focusNode, BuildContext context) {
    return KeyboardActionsConfig(
      keyboardActionsPlatform: KeyboardActionsPlatform.IOS,
      actions: [
        KeyboardActionsItem(
          focusNode: focusNode,
          displayArrows: false,
          toolbarButtons: [
            (node) {
              return TextButton(
                onPressed: () => KeyboardUtil.unFocus(),
                child: DTText.bodySmall(ResourceManager.instance?.getResource(ResourceKey.common_dialog_ok_button) ?? "",
                    context: context),
              );
            }
          ],
        ),
      ],
    );
  }
}
