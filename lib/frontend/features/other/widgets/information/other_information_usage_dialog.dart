import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tokkoo_pos_lite/frontend/features/pos/screens/pos_app_screen.dart';
import 'package:tokkoo_pos_lite/frontend/widgets/shared/carousel_with_dot_navigator.dart';
import 'package:tokkoo_pos_lite/frontend/widgets/shared/layouts/layout_max_width.dart';
import 'package:tokkoo_pos_lite/gen/strings.g.dart';

class OtherInformationUsageDialogItemBottomAction {
  final String label;
  final VoidCallback onTap;

  OtherInformationUsageDialogItemBottomAction({
    required this.label,
    required this.onTap,
  });
}

class OtherInformationUsageDialogItem {
  final Widget header;
  final String title;
  final Widget? titleTrailing;
  final Widget description;
  final OtherInformationUsageDialogItemBottomAction? bottomAction;

  OtherInformationUsageDialogItem({
    required this.header,
    required this.title,
    this.titleTrailing,
    required this.description,
    this.bottomAction,
  });
}

class OtherInformationUsageDialog extends StatelessWidget {
  const OtherInformationUsageDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutMaxWidth(
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
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
                  Text(t.feature_others.application_usage_guide,
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
                  OtherInformationUsageDialogItem(
                    header: Image.asset("assets/images/tutorial-1.jpeg"),
                    title: t
                        .feature_others.application_usage_guide_content.title_1,
                    description: Text(t
                        .feature_others.application_usage_guide_content.desc_1),
                    bottomAction: OtherInformationUsageDialogItemBottomAction(
                      label: t.feature_others.application_usage_guide_content
                          .button_text_1,
                      onTap: () => context.push(PosAppScreen.routeName),
                    ),
                  ),
                  OtherInformationUsageDialogItem(
                    header: Image.asset("assets/images/tutorial-2.jpeg"),
                    title: t
                        .feature_others.application_usage_guide_content.title_2,
                    description: Text(t
                        .feature_others.application_usage_guide_content.desc_2),
                    bottomAction: OtherInformationUsageDialogItemBottomAction(
                      label: t.feature_others.application_usage_guide_content
                          .button_text_2,
                      onTap: () => context.push(PosAppScreen.routeName),
                    ),
                  ),
                  OtherInformationUsageDialogItem(
                    header: Image.asset("assets/images/tutorial-3.jpeg"),
                    title: t
                        .feature_others.application_usage_guide_content.title_3,
                    description: Text(t
                        .feature_others.application_usage_guide_content.desc_3),
                    bottomAction: OtherInformationUsageDialogItemBottomAction(
                      label: t.feature_others.application_usage_guide_content
                          .button_text_3,
                      onTap: () => context.push(PosAppScreen.routeName),
                    ),
                  ),
                  OtherInformationUsageDialogItem(
                    header: Image.asset("assets/images/tutorial-4.jpeg"),
                    title: t
                        .feature_others.application_usage_guide_content.title_4,
                    description: Text(t
                        .feature_others.application_usage_guide_content.desc_4),
                    bottomAction: OtherInformationUsageDialogItemBottomAction(
                      label: t.feature_others.application_usage_guide_content
                          .button_text_4,
                      onTap: () => context.push(PosAppScreen.routeName),
                    ),
                  ),
                  OtherInformationUsageDialogItem(
                    header: Image.asset("assets/images/tutorial-5.jpeg"),
                    title: t
                        .feature_others.application_usage_guide_content.title_5,
                    description: Text(t
                        .feature_others.application_usage_guide_content.desc_5),
                    bottomAction: OtherInformationUsageDialogItemBottomAction(
                      label: t.feature_others.application_usage_guide_content
                          .button_text_5,
                      onTap: () => context.push(PosAppScreen.routeName),
                    ),
                  ),
                ]
                    .map((item) => ListView(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          children: [
                            SizedBox(height: 240, child: item.header),
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
                            if (item.bottomAction != null)
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
