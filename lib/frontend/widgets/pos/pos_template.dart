import 'package:flutter/material.dart';
import 'package:kasir_toko/utils/common/function.common.dart';

class PosTemplate extends StatefulWidget {
  const PosTemplate({
    super.key,
    this.title,
    required this.child,
    required this.bottomSheetWidget,
    this.endDrawer,
    this.childAlignment = Alignment.topCenter,
  });

  final String? title;
  final Widget child;
  final Widget? bottomSheetWidget;
  final Widget? endDrawer;
  final Alignment childAlignment;

  @override
  State<PosTemplate> createState() => _PosTemplateState();
}

class _PosTemplateState extends State<PosTemplate> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: widget.title != null
          ? AppBar(
              title: Text(widget.title!),
              actions: [
                if (widget.endDrawer != null)
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: IconButton(
                      icon: const Icon(Icons.filter_alt),
                      onPressed: () =>
                          scaffoldKey.currentState?.openEndDrawer(),
                    ),
                  )
              ],
            )
          : null,
      endDrawer: widget.endDrawer,
      body: SafeArea(
        child: Center(
          child: Stack(
            fit: StackFit.expand,
            alignment: Alignment.center,
            children: [
              Align(
                alignment: widget.childAlignment,
                child: SingleChildScrollView(
                  padding: EdgeInsets.fromLTRB(
                    CommonFunction.getHorizontalPaddingForMaxWidth(
                        maxWidth: 550, context: context),
                    20,
                    CommonFunction.getHorizontalPaddingForMaxWidth(
                        maxWidth: 550, context: context),
                    90,
                  ),
                  child: widget.child,
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: widget.bottomSheetWidget,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
