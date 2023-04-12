import 'package:flutter/cupertino.dart';

/// SyncScrollController keeps scroll controllers in sync.
class SyncScrollController {
  SyncScrollController(
      this._titleController,
      this._bodyController,
      );

  final ScrollController _titleController;
  final ScrollController _bodyController;

  ScrollController? _scrollingController;
  bool _scrollingActive = false;

  /// Returns true if reached scroll end
  bool processNotification(
      ScrollNotification notification,
      ScrollController controller, {
        Function(double x, double y)? onEndScrolling,
      }) {
    if (notification is ScrollStartNotification && !_scrollingActive) {
      _scrollingController = controller;
      _scrollingActive = true;
      return false;
    }

    if (identical(controller, _scrollingController) && _scrollingActive) {
      if (notification is ScrollEndNotification) {
        _scrollingController = null;
        _scrollingActive = false;
        return true;
      }

      if (notification is ScrollUpdateNotification) {
        for (final controller in [_titleController, _bodyController]) {
          if (identical(_scrollingController, controller)) continue;
          if (controller.positions.isEmpty) continue;
          final offset = _scrollingController?.offset;
          if (offset != null) {
            controller.jumpTo(offset);
          }
        }
      }
    }
    return false;
  }
}