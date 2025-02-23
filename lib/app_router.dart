import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tokkoo_pos_lite/backend/db/instance.db.dart';
import 'package:tokkoo_pos_lite/backend/models/useable/drift_usable_product_object.dart';
import 'package:tokkoo_pos_lite/frontend/features/report/screens/report_main_screen.dart';
import 'package:tokkoo_pos_lite/frontend/features/tab/other_tab_screen.dart';
import 'package:tokkoo_pos_lite/frontend/features/tab/outlet_tab_screen.dart';
import 'package:tokkoo_pos_lite/frontend/features/pos/screens/pos_app_screen.dart';
import 'package:tokkoo_pos_lite/frontend/features/pos/screens/proceed/pos_proceed_payment_screen.dart';
import 'package:tokkoo_pos_lite/frontend/features/pos/screens/proceed/pos_proceed_receipt_screen.dart';
import 'package:tokkoo_pos_lite/frontend/features/tab/pos_tab_screen.dart';
import 'package:tokkoo_pos_lite/frontend/features/tab/report_tab_screen.dart';
import 'package:tokkoo_pos_lite/frontend/features/tab/app_router_bottom_navigator.dart';
import 'package:tokkoo_pos_lite/frontend/features/outlet/screens/management/outlet/outlet_management_screen.dart';
import 'package:tokkoo_pos_lite/frontend/features/outlet/screens/management/payment_method/creation/outlet_payment_method_creation_screen.dart';
import 'package:tokkoo_pos_lite/frontend/features/outlet/screens/management/payment_method/outlet_payment_method_management_screen.dart';
import 'package:tokkoo_pos_lite/frontend/features/outlet/screens/management/product_category/creation/outlet_product_category_creation_screen.dart';
import 'package:tokkoo_pos_lite/frontend/features/outlet/screens/management/product_category/outlet_product_category_management_screen.dart';
import 'package:tokkoo_pos_lite/frontend/features/outlet/screens/management/product/creation/outlet_product_creation_screen.dart';
import 'package:tokkoo_pos_lite/frontend/features/outlet/screens/management/product/outlet_product_management.dart';

final appRouter = GoRouter(
  debugLogDiagnostics: true,
  initialLocation: PosTabScreen.routeName,
  routes: [
    // Tab Collection
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return AppRouterBottomNavigator(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(routes: [
          GoRoute(
              path: OutletTabScreen.routeName,
              pageBuilder: (context, state) =>
                  const NoTransitionPage(child: OutletTabScreen())),
        ]),
        StatefulShellBranch(routes: [
          GoRoute(
              path: PosTabScreen.routeName,
              pageBuilder: (context, state) =>
                  const NoTransitionPage(child: PosTabScreen())),
        ]),
        StatefulShellBranch(routes: [
          GoRoute(
              path: ReportTabScreen.routeName,
              pageBuilder: (context, state) =>
                  const NoTransitionPage(child: ReportTabScreen())),
        ]),
        StatefulShellBranch(routes: [
          GoRoute(
              path: OtherTabScreen.routeName,
              pageBuilder: (context, state) =>
                  const NoTransitionPage(child: OtherTabScreen())),
        ]),
      ],
    ),
    // Outlet Collection
    ...[
      GoRoute(
        path: OutletManagementScreen.routeName,
        pageBuilder: (context, state) =>
            const MaterialPage(child: OutletManagementScreen()),
      ),
      GoRoute(
          path: OutletProductCategoryManagementScreen.routeName,
          pageBuilder: (context, state) => const MaterialPage(
              child: OutletProductCategoryManagementScreen()),
          routes: [
            GoRoute(
              path: OutletProductCategoryCreationScreen.childRouteName,
              pageBuilder: (context, state) => MaterialPage(
                  child: OutletProductCategoryCreationScreen(
                      data: state.extra as DriftEntityProductCategoryData?)),
            ),
          ]),
      GoRoute(
          path: OutletPaymentMethodManagementScreen.routeName,
          pageBuilder: (context, state) =>
              const MaterialPage(child: OutletPaymentMethodManagementScreen()),
          routes: [
            GoRoute(
              path: OutletPaymentMethodCreationScreen.childRouteName,
              pageBuilder: (context, state) => MaterialPage(
                  child: OutletPaymentMethodCreationScreen(
                data: state.extra as DriftEntityPaymentMethodData?,
              )),
            ),
          ]),
      GoRoute(
          path: OutletProductManagementScreen.routeName,
          pageBuilder: (context, state) =>
              const MaterialPage(child: OutletProductManagementScreen()),
          routes: [
            GoRoute(
              path: OutletProductCreationScreen.childRouteName,
              pageBuilder: (context, state) => MaterialPage(
                  child: OutletProductCreationScreen(
                      data: state.extra as DriftUsableProductObject?)),
            ),
          ])
    ],
    // PoS Collection
    GoRoute(
        path: PosAppScreen.routeName,
        pageBuilder: (context, state) =>
            const MaterialPage(child: PosAppScreen()),
        routes: [
          GoRoute(
            path: PosProceedPaymentScreen.childRouteName,
            pageBuilder: (context, state) =>
                const MaterialPage(child: PosProceedPaymentScreen()),
          ),
          GoRoute(
            path: PosProceedReceiptScreen.childRouteName,
            pageBuilder: (context, state) =>
                const MaterialPage(child: PosProceedReceiptScreen()),
          ),
        ]),
    // Report Collection
    GoRoute(
      path: ReportMainScreen.routeName,
      pageBuilder: (context, state) => MaterialPage(
        child: ReportMainScreen(param: state.extra as ReportMainScreenParam),
      ),
    ),
    // Other Collection
    GoRoute(
      path: OtherTabScreen.routeName,
      pageBuilder: (context, state) =>
          const NoTransitionPage(child: OtherTabScreen()),
    ),
  ],
);
