///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import

part of 'strings.g.dart';

// Path: <root>
typedef TranslationsEn = Translations; // ignore: unused_element
class Translations implements BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final t = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final Translations _root = this; // ignore: unused_field

	Translations $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => Translations(meta: meta ?? this.$meta);

	// Translations
	String get outlet => 'Outlet';
	String get cashier => 'Cashier';
	String get sales_report => 'Sales Report';
	String get others => 'Others';
	String get active => 'Active';
	String get save => 'Save';
	String get nonactive => 'Nonactive';
	String add_arg({required Object text}) => 'Add ${text}';
	String edit_arg({required Object text}) => 'Edit ${text}';
	String get access_code => 'Access Code';
	String get confirm => 'Confirm';
	String get yes => 'Yes';
	String get no => 'No';
	String get print => 'Print';
	String get total => 'Total';
	String get summary => 'Summary';
	String get outlet_configuration_complete => 'Outlet configuration complete';
	String get before_opreate_cashier_title => 'Before you operate cashier, make sure:';
	String get before_opreate_cashier_item_1 => 'Your outlet configuration is correct & complete ';
	String get before_opreate_cashier_item_2 => 'The products in your outlet have been registered';
	String get before_opreate_cashier_item_3 => 'There must be at least 1 active payment method';
	String get enter_pos_screen => 'Enter Cashier Page';
	String get outlet_management => 'Outlet Management';
	String get general_information => 'GENERAL INFORMATION';
	String get outlet_name => 'Outlet Name';
	String get outlet_addess => 'Outlet Address';
	String get outlet_phone_number => 'Outlet Phone Number';
	String get outlet_receipt_message => 'Message on Receipt';
	String get save_general_information => 'Save General Information';
	String get configuration_successfully_saved => 'Configuration successfully saved';
	String get product => 'Product';
	String get manage_product => 'Manage Product';
	String product_count({required Object count}) => 'Number of products available: ${count}';
	String get find_product_by_name_or_code => 'Find Products by name or code';
	String get product_name => 'Product Name';
	String get price => 'Price';
	String get quantity => 'Quantity';
	String get unit_price => 'Unit Price';
	String get description => 'Description';
	String get total_price => 'Total Price';
	String get total_payment => 'Total Payment';
	String get pay_amount => 'Pay Amount';
	String get total_income => 'Total Income';
	String get product_code => 'Product Code';
	String get product_receipt_same_as_product_name => 'Product Name on Receipt will be the same as Product Name';
	String get product_name_on_receipt => 'Product Name on Receipt';
	String get no_product_category_registered => 'No product category registered';
	String get product_category => 'Product Category';
	String get manage_product_category => 'Manage Product Category';
	String product_category_count({required Object count}) => 'Number of product categories available: ${count}';
	String get product_category_name => 'Product Category Name';
	String get find_product_category_based_on_name => 'Find Product Catgeory by name';
	String get payment_method => 'Payment Method';
	String get manage_payment_method => 'Manage Payment Method';
	String payment_method_count({required Object count}) => 'Number of payment methods available: ${count}';
	String get payment_method_name => 'Payment Method Name';
	String get find_payment_method_based_on_name => 'Find Payment Method by name nama';
	String get equals_amount_spent => 'Equals Amount Spent';
	late final TranslationsFeatureWelcomeEn feature_welcome = TranslationsFeatureWelcomeEn.internal(_root);
	late final TranslationsFeaturePosEn feature_pos = TranslationsFeaturePosEn.internal(_root);
	late final TranslationsFeatureSalesReportEn feature_sales_report = TranslationsFeatureSalesReportEn.internal(_root);
	late final TranslationsFeatureOthersEn feature_others = TranslationsFeatureOthersEn.internal(_root);
	late final TranslationsEscStringsEn esc_strings = TranslationsEscStringsEn.internal(_root);
	late final TranslationsModifiedTextFormWidgetEn modified_text_form_widget = TranslationsModifiedTextFormWidgetEn.internal(_root);
}

// Path: feature_welcome
class TranslationsFeatureWelcomeEn {
	TranslationsFeatureWelcomeEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get welcome => 'Welcome';
	String get thank_you_sentence => 'Hi! Thank you for downloading Tokkoo PoS Lite. We are ready to help you get the best experience. Let\'s get started!';
	String get learn_app_usage => 'Learn App Usage';
}

// Path: feature_pos
class TranslationsFeaturePosEn {
	TranslationsFeaturePosEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get set_store_information_first => 'Please Set Store Information First';
	String get at_least_1_active_product => 'Please Add At Least 1 Active Product';
	String get at_least_1_active_payment_method => 'Please Add At Least 1 Active Payment Method';
	String get found_with_name_or_code => 'Find by Name or Code';
	String get proceed_payment => 'Proceed Payment';
	String total({required Object total}) => 'Total (${total})';
	String get payment => 'Payment';
	String get payment_method_empty => 'Payment Method Empty';
	String get change_is_less_then_0 => 'Change is less then 0';
	String get confirm_payment => 'Confirm Payment';
	late final TranslationsFeaturePosOrderSummaryEn order_summary = TranslationsFeaturePosOrderSummaryEn.internal(_root);
	String get change => 'Change';
	String get show_category => 'Show Category';
	String get receipt_has_not_been_printed => 'Receipt has not been printed. Proceed?';
	String get back_to_cashier_page => 'Back to Cashier Page';
	String get order_finished => 'Order Finished';
	String get dont_forget_to_print_receipt => 'Don\'t forget to print the receipt';
	String get print_receipt => 'Print Receipt';
}

// Path: feature_sales_report
class TranslationsFeatureSalesReportEn {
	TranslationsFeatureSalesReportEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get see_report => 'See Report';
	String get select_date => 'Select Date';
	String get confirm_access_code => 'Confirm Access Code';
	String get wrong_access_code => 'Access code wrong!';
	String get report => 'Report';
	String time_arg({required Object time_string}) => 'Time: ${time_string}';
	String total_income({required Object income}) => 'Total Income: ${income}';
	String total_product_sold({required Object count}) => 'Total Product Sold: ${count}';
	String get based_on_payment_method => 'Based on Payment Method';
	String get based_on_product => 'Based on Product';
	String get see_report_summary => 'See Report Summary';
	String report_date_1_arg({required Object date_string}) => 'Report Date: ${date_string}';
	String report_date_2_args({required Object date_string_1, required Object date_string_2}) => 'Report Date: ${date_string_1} - ${date_string_2}';
	String get end_time_more_than_start_time => 'End Time > Start Time';
	String get e_journal => 'E-Journal';
}

// Path: feature_others
class TranslationsFeatureOthersEn {
	TranslationsFeatureOthersEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get setting => 'Setting';
	String get manage_accesss_code => 'Manage Access Code';
	String get access_code_has_not_been_setup => 'Access code has not been setup';
	String get access_code_used_to_access_privillaged_data_and_setting => 'Access code used to access privilaged data & setting';
	String get add_access_code => 'Add Access Code';
	String get access_code_successfully_saved => 'Access code successfully saved';
	String get access_code_is_configured => 'Access code is configured';
	String get access_code_reset_text => 'If you forget it, you can remove the access code by clicking Reset button below 3 times.';
	String get access_code_reset_button => 'Reset';
	String get access_code_has_been_reset => 'Access code has been reset';
	String get language => 'Language';
	String get change_language => 'Change Language';
	String get information => 'Information';
	String get application_usage_guide => 'Application Usage Guide';
	String get printer_connection_guide => 'Printer Connection Guide';
	String get website => 'Website';
	String get website_not_available => 'Website not available yet';
	late final TranslationsFeatureOthersApplicationUsageGuideContentEn application_usage_guide_content = TranslationsFeatureOthersApplicationUsageGuideContentEn.internal(_root);
	late final TranslationsFeatureOthersPrinterConnectionGuideContentEn printer_connection_guide_content = TranslationsFeatureOthersPrinterConnectionGuideContentEn.internal(_root);
}

// Path: esc_strings
class TranslationsEscStringsEn {
	TranslationsEscStringsEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get no_printer_selected => 'No printer selected';
	String get printing_in_progress => 'Printing in Progress';
	String time_arg({required Object time_string}) => 'Time: ${time_string}';
	String get print_test_succeeded => 'Print test succeeded';
	String phone_number({required Object phone_number}) => 'Phone Number: ${phone_number}';
	String get method => 'Method';
	String get payment => 'Payment';
	String get change => 'Change';
	String get thank_you_for_coming => 'Thank you for coming';
	String get journal => 'Journal';
	String get cancelled => 'CANCELLED';
	String get income_report => 'INCOME REPORT';
	String get total => 'TOTAL';
	String get product_sales => 'Product Sales';
	String qty({required Object qty}) => '${qty} qty';
	String get income => 'Income';
	String get printer_status => 'Printer status:';
	String get bluetooth_turned_off => 'Bluetooth turned off';
	String get not_connected => 'Not Connected';
	String get printing => 'Printing';
	String get idle => 'Idle';
	String get paired_devices => 'Paired Devices';
	String get cannot_find_device => 'Cannot find device? Pair device!';
	String get failed_to_connect_device => 'Failed to connect device';
}

// Path: modified_text_form_widget
class TranslationsModifiedTextFormWidgetEn {
	TranslationsModifiedTextFormWidgetEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final TranslationsModifiedTextFormWidgetAlertEn alert = TranslationsModifiedTextFormWidgetAlertEn.internal(_root);
}

// Path: feature_pos.order_summary
class TranslationsFeaturePosOrderSummaryEn {
	TranslationsFeaturePosOrderSummaryEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Order Summary';
}

// Path: feature_others.application_usage_guide_content
class TranslationsFeatureOthersApplicationUsageGuideContentEn {
	TranslationsFeatureOthersApplicationUsageGuideContentEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title_1 => '1. Manage Outlet Information';
	String get desc_1 => 'Set the name, address, and phone number of the outlet for information on the receipt';
	String get button_text_1 => 'Manage Outlet';
	String get title_2 => '2. Add Product Category';
	String get desc_2 => 'Set Product Categories to make it easier to filter products';
	String get button_text_2 => 'Manage Product Category';
	String get title_3 => '3. Add Product';
	String get desc_3 => 'Manage Products sold in the Outlet';
	String get button_text_3 => 'Manage Product';
	String get title_4 => '4. Add Payment Method';
	String get desc_4 => 'Set the Payment Method provided in the outlet transaction';
	String get button_text_4 => 'Manage Payment Method';
	String get title_5 => '5. Operate Cashier';
	String get desc_5 => 'Operate Point of Sale by selecting the products that customers purchase';
	String get button_text_5 => 'Operate Cashier';
}

// Path: feature_others.printer_connection_guide_content
class TranslationsFeatureOthersPrinterConnectionGuideContentEn {
	TranslationsFeatureOthersPrinterConnectionGuideContentEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title_1 => '1. Provide Printer Device';
	String get desc_1 => 'The device needed is a Thermal Printer that has Bluetooth features with a paper width of 58mm.';
	String get title_2 => '2. Pair Device';
	String get desc_2 => 'Open settings and pair with the Thermal Printer device';
	String get button_text_2 => 'Open Bluetooth Settings';
	String get title_3 => '3. Connects Printer';
	String get desc_3 => '\'Click the "Not Connected (Idle)" text button to connect.\'';
	String get title_4 => '4. Choose Device';
	String get desc_4 => 'Select the device according to its name and Mac Address.';
	String get title_5 => '5. Device Connected';
	String get desc_5 => '\'When the printer status displays the name';
	String get button_text_5 => 'Test Printer';
}

// Path: modified_text_form_widget.alert
class TranslationsModifiedTextFormWidgetAlertEn {
	TranslationsModifiedTextFormWidgetAlertEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String empty({required Object item}) => '${item} is empty';
	String not_filled_yet({required Object item}) => '${item} not filled yet';
	String not_saved_yet({required Object item}) => '${item} not saved yet';
	String has_been_filled({required Object item}) => '${item} has been filled';
	String has_been_saved({required Object item}) => '${item} has been saved';
	String get cannot_be_empty => 'Cannot be empty';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on Translations {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'outlet': return 'Outlet';
			case 'cashier': return 'Cashier';
			case 'sales_report': return 'Sales Report';
			case 'others': return 'Others';
			case 'active': return 'Active';
			case 'save': return 'Save';
			case 'nonactive': return 'Nonactive';
			case 'add_arg': return ({required Object text}) => 'Add ${text}';
			case 'edit_arg': return ({required Object text}) => 'Edit ${text}';
			case 'access_code': return 'Access Code';
			case 'confirm': return 'Confirm';
			case 'yes': return 'Yes';
			case 'no': return 'No';
			case 'print': return 'Print';
			case 'total': return 'Total';
			case 'summary': return 'Summary';
			case 'outlet_configuration_complete': return 'Outlet configuration complete';
			case 'before_opreate_cashier_title': return 'Before you operate cashier, make sure:';
			case 'before_opreate_cashier_item_1': return 'Your outlet configuration is correct & complete ';
			case 'before_opreate_cashier_item_2': return 'The products in your outlet have been registered';
			case 'before_opreate_cashier_item_3': return 'There must be at least 1 active payment method';
			case 'enter_pos_screen': return 'Enter Cashier Page';
			case 'outlet_management': return 'Outlet Management';
			case 'general_information': return 'GENERAL INFORMATION';
			case 'outlet_name': return 'Outlet Name';
			case 'outlet_addess': return 'Outlet Address';
			case 'outlet_phone_number': return 'Outlet Phone Number';
			case 'outlet_receipt_message': return 'Message on Receipt';
			case 'save_general_information': return 'Save General Information';
			case 'configuration_successfully_saved': return 'Configuration successfully saved';
			case 'product': return 'Product';
			case 'manage_product': return 'Manage Product';
			case 'product_count': return ({required Object count}) => 'Number of products available: ${count}';
			case 'find_product_by_name_or_code': return 'Find Products by name or code';
			case 'product_name': return 'Product Name';
			case 'price': return 'Price';
			case 'quantity': return 'Quantity';
			case 'unit_price': return 'Unit Price';
			case 'description': return 'Description';
			case 'total_price': return 'Total Price';
			case 'total_payment': return 'Total Payment';
			case 'pay_amount': return 'Pay Amount';
			case 'total_income': return 'Total Income';
			case 'product_code': return 'Product Code';
			case 'product_receipt_same_as_product_name': return 'Product Name on Receipt will be the same as Product Name';
			case 'product_name_on_receipt': return 'Product Name on Receipt';
			case 'no_product_category_registered': return 'No product category registered';
			case 'product_category': return 'Product Category';
			case 'manage_product_category': return 'Manage Product Category';
			case 'product_category_count': return ({required Object count}) => 'Number of product categories available: ${count}';
			case 'product_category_name': return 'Product Category Name';
			case 'find_product_category_based_on_name': return 'Find Product Catgeory by name';
			case 'payment_method': return 'Payment Method';
			case 'manage_payment_method': return 'Manage Payment Method';
			case 'payment_method_count': return ({required Object count}) => 'Number of payment methods available: ${count}';
			case 'payment_method_name': return 'Payment Method Name';
			case 'find_payment_method_based_on_name': return 'Find Payment Method by name nama';
			case 'equals_amount_spent': return 'Equals Amount Spent';
			case 'feature_welcome.welcome': return 'Welcome';
			case 'feature_welcome.thank_you_sentence': return 'Hi! Thank you for downloading Tokkoo PoS Lite. We are ready to help you get the best experience. Let\'s get started!';
			case 'feature_welcome.learn_app_usage': return 'Learn App Usage';
			case 'feature_pos.set_store_information_first': return 'Please Set Store Information First';
			case 'feature_pos.at_least_1_active_product': return 'Please Add At Least 1 Active Product';
			case 'feature_pos.at_least_1_active_payment_method': return 'Please Add At Least 1 Active Payment Method';
			case 'feature_pos.found_with_name_or_code': return 'Find by Name or Code';
			case 'feature_pos.proceed_payment': return 'Proceed Payment';
			case 'feature_pos.total': return ({required Object total}) => 'Total (${total})';
			case 'feature_pos.payment': return 'Payment';
			case 'feature_pos.payment_method_empty': return 'Payment Method Empty';
			case 'feature_pos.change_is_less_then_0': return 'Change is less then 0';
			case 'feature_pos.confirm_payment': return 'Confirm Payment';
			case 'feature_pos.order_summary.title': return 'Order Summary';
			case 'feature_pos.change': return 'Change';
			case 'feature_pos.show_category': return 'Show Category';
			case 'feature_pos.receipt_has_not_been_printed': return 'Receipt has not been printed. Proceed?';
			case 'feature_pos.back_to_cashier_page': return 'Back to Cashier Page';
			case 'feature_pos.order_finished': return 'Order Finished';
			case 'feature_pos.dont_forget_to_print_receipt': return 'Don\'t forget to print the receipt';
			case 'feature_pos.print_receipt': return 'Print Receipt';
			case 'feature_sales_report.see_report': return 'See Report';
			case 'feature_sales_report.select_date': return 'Select Date';
			case 'feature_sales_report.confirm_access_code': return 'Confirm Access Code';
			case 'feature_sales_report.wrong_access_code': return 'Access code wrong!';
			case 'feature_sales_report.report': return 'Report';
			case 'feature_sales_report.time_arg': return ({required Object time_string}) => 'Time: ${time_string}';
			case 'feature_sales_report.total_income': return ({required Object income}) => 'Total Income: ${income}';
			case 'feature_sales_report.total_product_sold': return ({required Object count}) => 'Total Product Sold: ${count}';
			case 'feature_sales_report.based_on_payment_method': return 'Based on Payment Method';
			case 'feature_sales_report.based_on_product': return 'Based on Product';
			case 'feature_sales_report.see_report_summary': return 'See Report Summary';
			case 'feature_sales_report.report_date_1_arg': return ({required Object date_string}) => 'Report Date: ${date_string}';
			case 'feature_sales_report.report_date_2_args': return ({required Object date_string_1, required Object date_string_2}) => 'Report Date: ${date_string_1} - ${date_string_2}';
			case 'feature_sales_report.end_time_more_than_start_time': return 'End Time > Start Time';
			case 'feature_sales_report.e_journal': return 'E-Journal';
			case 'feature_others.setting': return 'Setting';
			case 'feature_others.manage_accesss_code': return 'Manage Access Code';
			case 'feature_others.access_code_has_not_been_setup': return 'Access code has not been setup';
			case 'feature_others.access_code_used_to_access_privillaged_data_and_setting': return 'Access code used to access privilaged data & setting';
			case 'feature_others.add_access_code': return 'Add Access Code';
			case 'feature_others.access_code_successfully_saved': return 'Access code successfully saved';
			case 'feature_others.access_code_is_configured': return 'Access code is configured';
			case 'feature_others.access_code_reset_text': return 'If you forget it, you can remove the access code by clicking Reset button below 3 times.';
			case 'feature_others.access_code_reset_button': return 'Reset';
			case 'feature_others.access_code_has_been_reset': return 'Access code has been reset';
			case 'feature_others.language': return 'Language';
			case 'feature_others.change_language': return 'Change Language';
			case 'feature_others.information': return 'Information';
			case 'feature_others.application_usage_guide': return 'Application Usage Guide';
			case 'feature_others.printer_connection_guide': return 'Printer Connection Guide';
			case 'feature_others.website': return 'Website';
			case 'feature_others.website_not_available': return 'Website not available yet';
			case 'feature_others.application_usage_guide_content.title_1': return '1. Manage Outlet Information';
			case 'feature_others.application_usage_guide_content.desc_1': return 'Set the name, address, and phone number of the outlet for information on the receipt';
			case 'feature_others.application_usage_guide_content.button_text_1': return 'Manage Outlet';
			case 'feature_others.application_usage_guide_content.title_2': return '2. Add Product Category';
			case 'feature_others.application_usage_guide_content.desc_2': return 'Set Product Categories to make it easier to filter products';
			case 'feature_others.application_usage_guide_content.button_text_2': return 'Manage Product Category';
			case 'feature_others.application_usage_guide_content.title_3': return '3. Add Product';
			case 'feature_others.application_usage_guide_content.desc_3': return 'Manage Products sold in the Outlet';
			case 'feature_others.application_usage_guide_content.button_text_3': return 'Manage Product';
			case 'feature_others.application_usage_guide_content.title_4': return '4. Add Payment Method';
			case 'feature_others.application_usage_guide_content.desc_4': return 'Set the Payment Method provided in the outlet transaction';
			case 'feature_others.application_usage_guide_content.button_text_4': return 'Manage Payment Method';
			case 'feature_others.application_usage_guide_content.title_5': return '5. Operate Cashier';
			case 'feature_others.application_usage_guide_content.desc_5': return 'Operate Point of Sale by selecting the products that customers purchase';
			case 'feature_others.application_usage_guide_content.button_text_5': return 'Operate Cashier';
			case 'feature_others.printer_connection_guide_content.title_1': return '1. Provide Printer Device';
			case 'feature_others.printer_connection_guide_content.desc_1': return 'The device needed is a Thermal Printer that has Bluetooth features with a paper width of 58mm.';
			case 'feature_others.printer_connection_guide_content.title_2': return '2. Pair Device';
			case 'feature_others.printer_connection_guide_content.desc_2': return 'Open settings and pair with the Thermal Printer device';
			case 'feature_others.printer_connection_guide_content.button_text_2': return 'Open Bluetooth Settings';
			case 'feature_others.printer_connection_guide_content.title_3': return '3. Connects Printer';
			case 'feature_others.printer_connection_guide_content.desc_3': return '\'Click the "Not Connected (Idle)" text button to connect.\'';
			case 'feature_others.printer_connection_guide_content.title_4': return '4. Choose Device';
			case 'feature_others.printer_connection_guide_content.desc_4': return 'Select the device according to its name and Mac Address.';
			case 'feature_others.printer_connection_guide_content.title_5': return '5. Device Connected';
			case 'feature_others.printer_connection_guide_content.desc_5': return '\'When the printer status displays the name';
			case 'feature_others.printer_connection_guide_content.button_text_5': return 'Test Printer';
			case 'esc_strings.no_printer_selected': return 'No printer selected';
			case 'esc_strings.printing_in_progress': return 'Printing in Progress';
			case 'esc_strings.time_arg': return ({required Object time_string}) => 'Time: ${time_string}';
			case 'esc_strings.print_test_succeeded': return 'Print test succeeded';
			case 'esc_strings.phone_number': return ({required Object phone_number}) => 'Phone Number: ${phone_number}';
			case 'esc_strings.method': return 'Method';
			case 'esc_strings.payment': return 'Payment';
			case 'esc_strings.change': return 'Change';
			case 'esc_strings.thank_you_for_coming': return 'Thank you for coming';
			case 'esc_strings.journal': return 'Journal';
			case 'esc_strings.cancelled': return 'CANCELLED';
			case 'esc_strings.income_report': return 'INCOME REPORT';
			case 'esc_strings.total': return 'TOTAL';
			case 'esc_strings.product_sales': return 'Product Sales';
			case 'esc_strings.qty': return ({required Object qty}) => '${qty} qty';
			case 'esc_strings.income': return 'Income';
			case 'esc_strings.printer_status': return 'Printer status:';
			case 'esc_strings.bluetooth_turned_off': return 'Bluetooth turned off';
			case 'esc_strings.not_connected': return 'Not Connected';
			case 'esc_strings.printing': return 'Printing';
			case 'esc_strings.idle': return 'Idle';
			case 'esc_strings.paired_devices': return 'Paired Devices';
			case 'esc_strings.cannot_find_device': return 'Cannot find device? Pair device!';
			case 'esc_strings.failed_to_connect_device': return 'Failed to connect device';
			case 'modified_text_form_widget.alert.empty': return ({required Object item}) => '${item} is empty';
			case 'modified_text_form_widget.alert.not_filled_yet': return ({required Object item}) => '${item} not filled yet';
			case 'modified_text_form_widget.alert.not_saved_yet': return ({required Object item}) => '${item} not saved yet';
			case 'modified_text_form_widget.alert.has_been_filled': return ({required Object item}) => '${item} has been filled';
			case 'modified_text_form_widget.alert.has_been_saved': return ({required Object item}) => '${item} has been saved';
			case 'modified_text_form_widget.alert.cannot_be_empty': return 'Cannot be empty';
			default: return null;
		}
	}
}

