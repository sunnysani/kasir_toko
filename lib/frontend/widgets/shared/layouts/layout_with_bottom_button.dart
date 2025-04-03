import 'package:flutter/material.dart';
import 'package:tokkoo_pos_lite/frontend/widgets/shared/layouts/layout_max_width.dart';

class LayoutWithBottomButton extends StatefulWidget {
  const LayoutWithBottomButton({
    super.key,
    this.title,
    this.bottomButton,
    this.childAlignment = Alignment.topCenter,
    required this.child,
  });

  final String? title;
  final Widget? bottomButton;
  final Alignment childAlignment;
  final Widget child;

  @override
  State<LayoutWithBottomButton> createState() => _LayoutWithBottomButtonState();
}

class _LayoutWithBottomButtonState extends State<LayoutWithBottomButton> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: widget.title != null ? AppBar(title: Text(widget.title!)) : null,
      body: SafeArea(
        child: Center(
          child: Stack(
            fit: StackFit.expand,
            alignment: Alignment.center,
            children: [
              Align(
                alignment: widget.childAlignment,
                child: SingleChildScrollView(
                  padding: EdgeInsets.fromLTRB(0, 20, 0, 90),
                  child: LayoutMaxWidth(child: widget.child),
                ),
              ),
              LayoutMaxWidth(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: widget.bottomButton,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
