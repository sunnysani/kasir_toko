import 'package:app_settings/app_settings.dart' as app_settings_lib;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tokkoo_pos_lite/backend/provider/esc_printer.dart';
import 'package:tokkoo_pos_lite/frontend/widgets/shared/carousel_with_dot_navigator.dart';
import 'package:tokkoo_pos_lite/frontend/widgets/shared/layouts/layout_max_width.dart';
import 'package:tokkoo_pos_lite/frontend/widgets/shared/printer_status.dart';
import 'package:tokkoo_pos_lite/gen/strings.g.dart';
import 'package:tokkoo_pos_lite/utils/common/constant.common.dart';

class OtherInformationPrinterDialogItemBottomAction {
  final String label;
  final VoidCallback onTap;

  OtherInformationPrinterDialogItemBottomAction({
    required this.label,
    required this.onTap,
  });
}

class OtherInformationPrinterDialogItem {
  final Widget header;
  final String title;
  final Widget? titleTrailing;
  final Widget description;
  final dynamic bottomAction;

  OtherInformationPrinterDialogItem({
    required this.header,
    required this.title,
    this.titleTrailing,
    required this.description,
    this.bottomAction,
  });
}

class OtherInformationPrinterDialog extends ConsumerWidget {
  const OtherInformationPrinterDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return LayoutMaxWidth(
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(vertical: 20),
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(t.feature_others.printer_connection_guide,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold)),
                  const Divider(),
                ],
              ),
            ),
            const SizedBox(height: 8),
            CarouselWithDotNavigator(
                height: 380,
                items: [
                  OtherInformationPrinterDialogItem(
                    header:
                        Image.asset("assets/images/printer-tutorial-1.jpeg"),
                    title: t.feature_others.printer_connection_guide_content
                        .title_1,
                    description: Text(t.feature_others
                        .printer_connection_guide_content.desc_1),
                  ),
                  OtherInformationPrinterDialogItem(
                    header:
                        Image.asset("assets/images/printer-tutorial-2.jpeg"),
                    title: t.feature_others.printer_connection_guide_content
                        .title_2,
                    description: Text(t.feature_others
                        .printer_connection_guide_content.desc_2),
                    bottomAction: OtherInformationPrinterDialogItemBottomAction(
                      label: t.feature_others.printer_connection_guide_content
                          .button_text_2,
                      onTap: () => app_settings_lib.AppSettings.openAppSettings(
                          type: app_settings_lib.AppSettingsType.bluetooth),
                    ),
                  ),
                  OtherInformationPrinterDialogItem(
                    header:
                        Image.asset("assets/images/printer-tutorial-3.jpeg"),
                    title: t.feature_others.printer_connection_guide_content
                        .title_3,
                    description: Text(t.feature_others
                        .printer_connection_guide_content.desc_4),
                    bottomAction: const PrinterStatus(),
                  ),
                  OtherInformationPrinterDialogItem(
                    header:
                        Image.asset("assets/images/printer-tutorial-4.jpeg"),
                    title: t.feature_others.printer_connection_guide_content
                        .title_4,
                    description: Text(t.feature_others
                        .printer_connection_guide_content.desc_4),
                    bottomAction: const PrinterStatus(),
                  ),
                  OtherInformationPrinterDialogItem(
                      header:
                          Image.asset("assets/images/printer-tutorial-5.jpeg"),
                      title: t.feature_others.printer_connection_guide_content
                          .title_5,
                      description: Text(t.feature_others
                          .printer_connection_guide_content.desc_5),
                      bottomAction: Column(
                        children: [
                          const PrinterStatus(),
                          SizedBox(
                            width: double.infinity,
                            child: FilledButton(
                              onPressed: () => ref
                                  .read(escPrinterProvider.notifier)
                                  .printTesting(context),
                              style: ButtonTextStyle.secondaryButtonStyle,
                              child: Text(t
                                  .feature_others
                                  .printer_connection_guide_content
                                  .button_text_5),
                            ),
                          ),
                        ],
                      )),
                ]
                    .map((item) => ListView(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          children: [
                            SizedBox(height: 200, child: item.header),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    item.title,
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                if (item.titleTrailing != null)
                                  item.titleTrailing!,
                              ],
                            ),
                            item.description,
                            if (item.bottomAction is Widget)
                              item.bottomAction
                            else if (item.bottomAction
                                is OtherInformationPrinterDialogItemBottomAction)
                              TextButton(
                                onPressed: item.bottomAction!.onTap,
                                child: Text(item.bottomAction!.label),
                              )
                          ],
                        ))
                    .toList()),
          ],
        ),
      ),
    );
  }
}
