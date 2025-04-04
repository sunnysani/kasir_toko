///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:slang/generated.dart';
import 'strings.g.dart';

// Path: <root>
class TranslationsId extends Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsId({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.id,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <id>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final TranslationsId _root = this; // ignore: unused_field

	@override 
	TranslationsId $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsId(meta: meta ?? this.$meta);

	// Translations
	@override String get outlet => 'Outlet';
	@override String get cashier => 'Kasir';
	@override String get sales_report => 'Data Penjualan';
	@override String get others => 'Lainnya';
	@override String get active => 'aktif';
	@override String get save => 'Simpan';
	@override String get nonactive => 'Nonaktif';
	@override String add_arg({required Object text}) => 'Tambah ${text}';
	@override String edit_arg({required Object text}) => 'Sunting ${text}';
	@override String get access_code => 'Kode Akses';
	@override String get confirm => 'Konfirmasi';
	@override String get yes => 'Ya';
	@override String get no => 'Tidak';
	@override String get print => 'Cetak';
	@override String get total => 'Total';
	@override String get summary => 'Ringkasan';
	@override String get outlet_configuration_complete => ' Konfigurasi Outlet sudah lengkap';
	@override String get before_opreate_cashier_title => 'Sebelum kamu mengoperasikan kasir, pastikan:';
	@override String get before_opreate_cashier_item_1 => 'Konfigurasi outlet Anda telah benar & complete';
	@override String get before_opreate_cashier_item_2 => 'Produk-produk di outlet Anda sudah diaftarkan';
	@override String get before_opreate_cashier_item_3 => 'Terdapat minimal 1 metode pembayaran aktif';
	@override String get enter_pos_screen => 'Masuk ke Halaman Kasir';
	@override String get outlet_management => 'Manajemen Outlet';
	@override String get general_information => 'INFORMASI UMUM';
	@override String get outlet_name => 'Nama Outlet';
	@override String get outlet_addess => 'Alamat Toko';
	@override String get outlet_phone_number => 'No. Telepon Outlet';
	@override String get outlet_receipt_message => 'Pesan di Struk';
	@override String get save_general_information => 'Simpan Informasi Umum';
	@override String get configuration_successfully_saved => 'Konfigurasi berhasil disimpan';
	@override String get product => 'Produk';
	@override String get manage_product => 'Atur Produk';
	@override String product_count({required Object count}) => 'Jumlah produk tersedia: ${count}';
	@override String get find_product_by_name_or_code => 'Temukan Produk berdasarkan nama atau kode';
	@override String get product_name => 'Nama Produk';
	@override String get price => 'Harga';
	@override String get quantity => 'Kuantitas';
	@override String get unit_price => 'Harga Satuan';
	@override String get description => 'Deskripsi';
	@override String get total_price => 'Total Harga';
	@override String get total_payment => 'Jumlah Pembayaran';
	@override String get pay_amount => 'Jumlah yang Dibayarkan';
	@override String get total_income => 'Jumlah Pemasukan';
	@override String get product_code => 'Kode Produk';
	@override String get product_receipt_same_as_product_name => 'Nama Produk di Struk akan sama dengan Nama Produk';
	@override String get product_name_on_receipt => 'Nama Produk di Struk';
	@override String get no_product_category_registered => ' Tidak ada kategori produk terdaftar';
	@override String get product_category => 'Kategori Produk';
	@override String get manage_product_category => 'Atur Kategory Produk';
	@override String product_category_count({required Object count}) => 'Jumlah kategori produk tersedia: ${count}';
	@override String get product_category_name => 'Nama Kategori Produk';
	@override String get find_product_category_based_on_name => 'Temukan Kategory Produk berdasarkan nama';
	@override String get payment_method => 'Metode Pembayaran';
	@override String get manage_payment_method => 'Atur Metode Pembayaran';
	@override String payment_method_count({required Object count}) => 'Jumlah metode pembayaran tersedia: ${count}';
	@override String get payment_method_name => 'Nama Metode Pembayaran';
	@override String get find_payment_method_based_on_name => 'Temukan Metode Pembayaran berdasarkan nama';
	@override String get equals_amount_spent => 'Sama dengan Jumlah yang Dibelanjakan';
	@override late final _TranslationsFeatureWelcomeId feature_welcome = _TranslationsFeatureWelcomeId._(_root);
	@override late final _TranslationsFeaturePosId feature_pos = _TranslationsFeaturePosId._(_root);
	@override late final _TranslationsFeatureSalesReportId feature_sales_report = _TranslationsFeatureSalesReportId._(_root);
	@override late final _TranslationsFeatureOthersId feature_others = _TranslationsFeatureOthersId._(_root);
	@override late final _TranslationsEscStringsId esc_strings = _TranslationsEscStringsId._(_root);
	@override late final _TranslationsModifiedTextFormWidgetId modified_text_form_widget = _TranslationsModifiedTextFormWidgetId._(_root);
}

// Path: feature_welcome
class _TranslationsFeatureWelcomeId extends TranslationsFeatureWelcomeEn {
	_TranslationsFeatureWelcomeId._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get welcome => 'Selamat Datang';
	@override String get thank_you_sentence => 'Hi! Thank you for downloading Tokkoo PoS Lite. We are ready to help you get the best experience. Let\'s get started!';
	@override String get learn_app_usage => 'Pelajari Penggunaan Aplikasi';
}

// Path: feature_pos
class _TranslationsFeaturePosId extends TranslationsFeaturePosEn {
	_TranslationsFeaturePosId._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get set_store_information_first => 'Silakan Atur Informasi Toko terlebih dahulu';
	@override String get at_least_1_active_product => 'Silakan Tambah Minimal 1 Produk Aktif';
	@override String get at_least_1_active_payment_method => 'Silakan Tambah Minimal 1 Matode Pembayaran Aktif';
	@override String get found_with_name_or_code => 'Temukan dengan Nama atau Kode';
	@override String get proceed_payment => 'Lanjut Pembayaran';
	@override String total({required Object total}) => 'Total (${total})';
	@override String get payment => 'Pembayaran';
	@override String get payment_method_empty => 'Metode Pembayaran Kosong';
	@override String get change_is_less_then_0 => 'Kembalian kurang dari 0';
	@override String get confirm_payment => 'Konfirmasi Pembayaran';
	@override late final _TranslationsFeaturePosOrderSummaryId order_summary = _TranslationsFeaturePosOrderSummaryId._(_root);
	@override String get change => 'Kembalian';
	@override String get show_category => 'Tunjukkan Kategori';
	@override String get receipt_has_not_been_printed => 'Struk belum dicetak. Lanjutkan?';
	@override String get back_to_cashier_page => 'Kembali ke Halaman Kasir';
	@override String get order_finished => 'Pemesanan Selesai';
	@override String get dont_forget_to_print_receipt => 'Jangan lupa untuk cetak struk';
	@override String get print_receipt => 'Cetak Struk';
}

// Path: feature_sales_report
class _TranslationsFeatureSalesReportId extends TranslationsFeatureSalesReportEn {
	_TranslationsFeatureSalesReportId._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get see_report => 'Lihat Laporan';
	@override String get select_date => 'Pilih Tanggal';
	@override String get confirm_access_code => 'Konfirmasi Kode Akses';
	@override String get wrong_access_code => 'Kode akses salah!';
	@override String get report => 'Laporan';
	@override String time_arg({required Object time_string}) => 'Waktu: ${time_string}';
	@override String total_income({required Object income}) => 'Total Pemasukan: ${income}';
	@override String total_product_sold({required Object count}) => 'Total Produk Terjual: ${count}';
	@override String get based_on_payment_method => 'Berdasarkan Metode Pembayaran';
	@override String get based_on_product => 'Berdasarkan Produk';
	@override String get see_report_summary => 'Lihat Ringkasan Laporan';
	@override String report_date_1_arg({required Object date_string}) => 'Laporan Tanggal: ${date_string}';
	@override String report_date_2_args({required Object date_string_1, required Object date_string_2}) => 'Laporan Tanggal: ${date_string_1} - ${date_string_2}';
	@override String get end_time_more_than_start_time => 'Waktu Selesai > Waktu Mulai';
	@override String get e_journal => 'E-Journal';
}

// Path: feature_others
class _TranslationsFeatureOthersId extends TranslationsFeatureOthersEn {
	_TranslationsFeatureOthersId._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get setting => 'Pengaturan';
	@override String get manage_accesss_code => 'Atur Kode Akses';
	@override String get access_code_has_not_been_setup => 'Kode akses belum diatur';
	@override String get access_code_used_to_access_privillaged_data_and_setting => 'Kode akses digunakan untuk mengakses data & pengaturan istimewa';
	@override String get add_access_code => 'Tambah Kode Akses';
	@override String get access_code_successfully_saved => 'Kode akses berhasil disimpan';
	@override String get access_code_is_configured => 'Kode aksus sudah diatur';
	@override String get access_code_reset_text => 'Jika Anda lupa, Anda dapat menghapus kode akses dengan mengklik tombol Atur Ulang di bawah 3 kali.';
	@override String get access_code_reset_button => 'Atur Ulang';
	@override String get access_code_has_been_reset => 'Kode akses berhasil diatur ulang';
	@override String get language => 'Bahasa';
	@override String get change_language => 'Ganti Bahasa';
	@override String get information => 'Informasi';
	@override String get application_usage_guide => 'Panduan Penggunaan Aplikasi';
	@override String get printer_connection_guide => 'Panduan Koneksi Printer';
	@override String get website => 'Halaman Web';
	@override String get website_not_available => 'Website belum tersedia';
	@override late final _TranslationsFeatureOthersApplicationUsageGuideContentId application_usage_guide_content = _TranslationsFeatureOthersApplicationUsageGuideContentId._(_root);
	@override late final _TranslationsFeatureOthersPrinterConnectionGuideContentId printer_connection_guide_content = _TranslationsFeatureOthersPrinterConnectionGuideContentId._(_root);
}

// Path: esc_strings
class _TranslationsEscStringsId extends TranslationsEscStringsEn {
	_TranslationsEscStringsId._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get no_printer_selected => 'Tidak ada printer terpilih';
	@override String get printing_in_progress => 'Sedang Mencetak';
	@override String time_arg({required Object time_string}) => 'Waktu: ${time_string}';
	@override String get print_test_succeeded => 'Tes mencetak berhasil';
	@override String phone_number({required Object phone_number}) => 'No. Telp: ${phone_number}';
	@override String get method => 'Metode';
	@override String get payment => 'Pembayaran';
	@override String get change => 'Kembalian';
	@override String get thank_you_for_coming => 'Terima kasih sudah datang';
	@override String get journal => 'Journal';
	@override String get cancelled => 'DIBATALKAN';
	@override String get income_report => 'LAPORAN PENDAPATAN';
	@override String get total => 'TOTAL';
	@override String get product_sales => 'Penjualan Produk';
	@override String qty({required Object qty}) => '${qty} jml';
	@override String get income => 'Pendapatan';
	@override String get printer_status => 'Status printer:';
	@override String get bluetooth_turned_off => 'Bluetooth mati';
	@override String get not_connected => 'Tidak Terhubung';
	@override String get printing => 'Mencetak';
	@override String get idle => 'Diam';
	@override String get paired_devices => 'Perangkan yang Dikenali';
	@override String get cannot_find_device => 'Tidak menemukan perangkat? Kenali perangkat!';
	@override String get failed_to_connect_device => 'Gagal menghubungkan perangkat';
}

// Path: modified_text_form_widget
class _TranslationsModifiedTextFormWidgetId extends TranslationsModifiedTextFormWidgetEn {
	_TranslationsModifiedTextFormWidgetId._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsModifiedTextFormWidgetAlertId alert = _TranslationsModifiedTextFormWidgetAlertId._(_root);
}

// Path: feature_pos.order_summary
class _TranslationsFeaturePosOrderSummaryId extends TranslationsFeaturePosOrderSummaryEn {
	_TranslationsFeaturePosOrderSummaryId._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Ringkasan Pesanan';
}

// Path: feature_others.application_usage_guide_content
class _TranslationsFeatureOthersApplicationUsageGuideContentId extends TranslationsFeatureOthersApplicationUsageGuideContentEn {
	_TranslationsFeatureOthersApplicationUsageGuideContentId._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title_1 => '1. Atur Informasi Outlet';
	@override String get desc_1 => 'Atur nama, alamat, dan no. telfon outlet untuk informasi di struk';
	@override String get button_text_1 => 'Atur Outlet';
	@override String get title_2 => '2. Tambahkan Kategori Produk';
	@override String get desc_2 => 'Atur Kategori Produk untuk memudahkan penyaringan produk';
	@override String get button_text_2 => 'Atur Kategori Produk';
	@override String get title_3 => '3. Tambahkan Produk';
	@override String get desc_3 => 'Atur Produk yang dijual di dalam Outlet';
	@override String get button_text_3 => 'Atur Produk';
	@override String get title_4 => '4. Tambahkan Metode Pembayaran';
	@override String get desc_4 => 'Atur Metode Pembayaran yang disediakan dalam transaksi toko';
	@override String get button_text_4 => 'Atur Metode Pembayaran';
	@override String get title_5 => '5. Operasikan Kasir';
	@override String get desc_5 => 'Operasikan Point of Sale dengan memilih produk yang pelanggan beli';
	@override String get button_text_5 => 'Operasikan Kasir';
}

// Path: feature_others.printer_connection_guide_content
class _TranslationsFeatureOthersPrinterConnectionGuideContentId extends TranslationsFeatureOthersPrinterConnectionGuideContentEn {
	_TranslationsFeatureOthersPrinterConnectionGuideContentId._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title_1 => '1. Sediakan Perangkat Cetak';
	@override String get desc_1 => 'Perangkat yang dibutuhkan adalah Thermal Printer yang memiliki fitur Bluetooth dengan lebar kertas 58mm';
	@override String get title_2 => '2. Hubungkan Perangkat';
	@override String get desc_2 => 'Buka pengaturan dan pasangkan dengan perangkat Thermal Printer';
	@override String get button_text_2 => 'Buka Pengaturan Bluetooth';
	@override String get title_3 => '3. Hubungkan Printer';
	@override String get desc_3 => '\'Klik tombol teks "Tidak Terhubung (Diam)". Untuk menghubungkan\'';
	@override String get title_4 => '4. Pilih Perangkat';
	@override String get desc_4 => 'Pilih perangkat sesuai dengan nama dan Mac Address';
	@override String get title_5 => '5. Perangkat Berhasil Terhubung';
	@override String get desc_5 => ' the device is successfully connected. Click the "Print" button to print\'';
	@override String get button_text_5 => 'Tes Cetak';
}

// Path: modified_text_form_widget.alert
class _TranslationsModifiedTextFormWidgetAlertId extends TranslationsModifiedTextFormWidgetAlertEn {
	_TranslationsModifiedTextFormWidgetAlertId._(TranslationsId root) : this._root = root, super.internal(root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String empty({required Object item}) => '${item} kosong';
	@override String not_filled_yet({required Object item}) => '${item} belum diisi';
	@override String not_saved_yet({required Object item}) => '${item} belum disimpan';
	@override String has_been_filled({required Object item}) => '${item} sudah diisi';
	@override String has_been_saved({required Object item}) => '${item} sudah disimpan';
	@override String get cannot_be_empty => 'Tidak boleh kosong';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on TranslationsId {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'outlet': return 'Outlet';
			case 'cashier': return 'Kasir';
			case 'sales_report': return 'Data Penjualan';
			case 'others': return 'Lainnya';
			case 'active': return 'aktif';
			case 'save': return 'Simpan';
			case 'nonactive': return 'Nonaktif';
			case 'add_arg': return ({required Object text}) => 'Tambah ${text}';
			case 'edit_arg': return ({required Object text}) => 'Sunting ${text}';
			case 'access_code': return 'Kode Akses';
			case 'confirm': return 'Konfirmasi';
			case 'yes': return 'Ya';
			case 'no': return 'Tidak';
			case 'print': return 'Cetak';
			case 'total': return 'Total';
			case 'summary': return 'Ringkasan';
			case 'outlet_configuration_complete': return ' Konfigurasi Outlet sudah lengkap';
			case 'before_opreate_cashier_title': return 'Sebelum kamu mengoperasikan kasir, pastikan:';
			case 'before_opreate_cashier_item_1': return 'Konfigurasi outlet Anda telah benar & complete';
			case 'before_opreate_cashier_item_2': return 'Produk-produk di outlet Anda sudah diaftarkan';
			case 'before_opreate_cashier_item_3': return 'Terdapat minimal 1 metode pembayaran aktif';
			case 'enter_pos_screen': return 'Masuk ke Halaman Kasir';
			case 'outlet_management': return 'Manajemen Outlet';
			case 'general_information': return 'INFORMASI UMUM';
			case 'outlet_name': return 'Nama Outlet';
			case 'outlet_addess': return 'Alamat Toko';
			case 'outlet_phone_number': return 'No. Telepon Outlet';
			case 'outlet_receipt_message': return 'Pesan di Struk';
			case 'save_general_information': return 'Simpan Informasi Umum';
			case 'configuration_successfully_saved': return 'Konfigurasi berhasil disimpan';
			case 'product': return 'Produk';
			case 'manage_product': return 'Atur Produk';
			case 'product_count': return ({required Object count}) => 'Jumlah produk tersedia: ${count}';
			case 'find_product_by_name_or_code': return 'Temukan Produk berdasarkan nama atau kode';
			case 'product_name': return 'Nama Produk';
			case 'price': return 'Harga';
			case 'quantity': return 'Kuantitas';
			case 'unit_price': return 'Harga Satuan';
			case 'description': return 'Deskripsi';
			case 'total_price': return 'Total Harga';
			case 'total_payment': return 'Jumlah Pembayaran';
			case 'pay_amount': return 'Jumlah yang Dibayarkan';
			case 'total_income': return 'Jumlah Pemasukan';
			case 'product_code': return 'Kode Produk';
			case 'product_receipt_same_as_product_name': return 'Nama Produk di Struk akan sama dengan Nama Produk';
			case 'product_name_on_receipt': return 'Nama Produk di Struk';
			case 'no_product_category_registered': return ' Tidak ada kategori produk terdaftar';
			case 'product_category': return 'Kategori Produk';
			case 'manage_product_category': return 'Atur Kategory Produk';
			case 'product_category_count': return ({required Object count}) => 'Jumlah kategori produk tersedia: ${count}';
			case 'product_category_name': return 'Nama Kategori Produk';
			case 'find_product_category_based_on_name': return 'Temukan Kategory Produk berdasarkan nama';
			case 'payment_method': return 'Metode Pembayaran';
			case 'manage_payment_method': return 'Atur Metode Pembayaran';
			case 'payment_method_count': return ({required Object count}) => 'Jumlah metode pembayaran tersedia: ${count}';
			case 'payment_method_name': return 'Nama Metode Pembayaran';
			case 'find_payment_method_based_on_name': return 'Temukan Metode Pembayaran berdasarkan nama';
			case 'equals_amount_spent': return 'Sama dengan Jumlah yang Dibelanjakan';
			case 'feature_welcome.welcome': return 'Selamat Datang';
			case 'feature_welcome.thank_you_sentence': return 'Hi! Thank you for downloading Tokkoo PoS Lite. We are ready to help you get the best experience. Let\'s get started!';
			case 'feature_welcome.learn_app_usage': return 'Pelajari Penggunaan Aplikasi';
			case 'feature_pos.set_store_information_first': return 'Silakan Atur Informasi Toko terlebih dahulu';
			case 'feature_pos.at_least_1_active_product': return 'Silakan Tambah Minimal 1 Produk Aktif';
			case 'feature_pos.at_least_1_active_payment_method': return 'Silakan Tambah Minimal 1 Matode Pembayaran Aktif';
			case 'feature_pos.found_with_name_or_code': return 'Temukan dengan Nama atau Kode';
			case 'feature_pos.proceed_payment': return 'Lanjut Pembayaran';
			case 'feature_pos.total': return ({required Object total}) => 'Total (${total})';
			case 'feature_pos.payment': return 'Pembayaran';
			case 'feature_pos.payment_method_empty': return 'Metode Pembayaran Kosong';
			case 'feature_pos.change_is_less_then_0': return 'Kembalian kurang dari 0';
			case 'feature_pos.confirm_payment': return 'Konfirmasi Pembayaran';
			case 'feature_pos.order_summary.title': return 'Ringkasan Pesanan';
			case 'feature_pos.change': return 'Kembalian';
			case 'feature_pos.show_category': return 'Tunjukkan Kategori';
			case 'feature_pos.receipt_has_not_been_printed': return 'Struk belum dicetak. Lanjutkan?';
			case 'feature_pos.back_to_cashier_page': return 'Kembali ke Halaman Kasir';
			case 'feature_pos.order_finished': return 'Pemesanan Selesai';
			case 'feature_pos.dont_forget_to_print_receipt': return 'Jangan lupa untuk cetak struk';
			case 'feature_pos.print_receipt': return 'Cetak Struk';
			case 'feature_sales_report.see_report': return 'Lihat Laporan';
			case 'feature_sales_report.select_date': return 'Pilih Tanggal';
			case 'feature_sales_report.confirm_access_code': return 'Konfirmasi Kode Akses';
			case 'feature_sales_report.wrong_access_code': return 'Kode akses salah!';
			case 'feature_sales_report.report': return 'Laporan';
			case 'feature_sales_report.time_arg': return ({required Object time_string}) => 'Waktu: ${time_string}';
			case 'feature_sales_report.total_income': return ({required Object income}) => 'Total Pemasukan: ${income}';
			case 'feature_sales_report.total_product_sold': return ({required Object count}) => 'Total Produk Terjual: ${count}';
			case 'feature_sales_report.based_on_payment_method': return 'Berdasarkan Metode Pembayaran';
			case 'feature_sales_report.based_on_product': return 'Berdasarkan Produk';
			case 'feature_sales_report.see_report_summary': return 'Lihat Ringkasan Laporan';
			case 'feature_sales_report.report_date_1_arg': return ({required Object date_string}) => 'Laporan Tanggal: ${date_string}';
			case 'feature_sales_report.report_date_2_args': return ({required Object date_string_1, required Object date_string_2}) => 'Laporan Tanggal: ${date_string_1} - ${date_string_2}';
			case 'feature_sales_report.end_time_more_than_start_time': return 'Waktu Selesai > Waktu Mulai';
			case 'feature_sales_report.e_journal': return 'E-Journal';
			case 'feature_others.setting': return 'Pengaturan';
			case 'feature_others.manage_accesss_code': return 'Atur Kode Akses';
			case 'feature_others.access_code_has_not_been_setup': return 'Kode akses belum diatur';
			case 'feature_others.access_code_used_to_access_privillaged_data_and_setting': return 'Kode akses digunakan untuk mengakses data & pengaturan istimewa';
			case 'feature_others.add_access_code': return 'Tambah Kode Akses';
			case 'feature_others.access_code_successfully_saved': return 'Kode akses berhasil disimpan';
			case 'feature_others.access_code_is_configured': return 'Kode aksus sudah diatur';
			case 'feature_others.access_code_reset_text': return 'Jika Anda lupa, Anda dapat menghapus kode akses dengan mengklik tombol Atur Ulang di bawah 3 kali.';
			case 'feature_others.access_code_reset_button': return 'Atur Ulang';
			case 'feature_others.access_code_has_been_reset': return 'Kode akses berhasil diatur ulang';
			case 'feature_others.language': return 'Bahasa';
			case 'feature_others.change_language': return 'Ganti Bahasa';
			case 'feature_others.information': return 'Informasi';
			case 'feature_others.application_usage_guide': return 'Panduan Penggunaan Aplikasi';
			case 'feature_others.printer_connection_guide': return 'Panduan Koneksi Printer';
			case 'feature_others.website': return 'Halaman Web';
			case 'feature_others.website_not_available': return 'Website belum tersedia';
			case 'feature_others.application_usage_guide_content.title_1': return '1. Atur Informasi Outlet';
			case 'feature_others.application_usage_guide_content.desc_1': return 'Atur nama, alamat, dan no. telfon outlet untuk informasi di struk';
			case 'feature_others.application_usage_guide_content.button_text_1': return 'Atur Outlet';
			case 'feature_others.application_usage_guide_content.title_2': return '2. Tambahkan Kategori Produk';
			case 'feature_others.application_usage_guide_content.desc_2': return 'Atur Kategori Produk untuk memudahkan penyaringan produk';
			case 'feature_others.application_usage_guide_content.button_text_2': return 'Atur Kategori Produk';
			case 'feature_others.application_usage_guide_content.title_3': return '3. Tambahkan Produk';
			case 'feature_others.application_usage_guide_content.desc_3': return 'Atur Produk yang dijual di dalam Outlet';
			case 'feature_others.application_usage_guide_content.button_text_3': return 'Atur Produk';
			case 'feature_others.application_usage_guide_content.title_4': return '4. Tambahkan Metode Pembayaran';
			case 'feature_others.application_usage_guide_content.desc_4': return 'Atur Metode Pembayaran yang disediakan dalam transaksi toko';
			case 'feature_others.application_usage_guide_content.button_text_4': return 'Atur Metode Pembayaran';
			case 'feature_others.application_usage_guide_content.title_5': return '5. Operasikan Kasir';
			case 'feature_others.application_usage_guide_content.desc_5': return 'Operasikan Point of Sale dengan memilih produk yang pelanggan beli';
			case 'feature_others.application_usage_guide_content.button_text_5': return 'Operasikan Kasir';
			case 'feature_others.printer_connection_guide_content.title_1': return '1. Sediakan Perangkat Cetak';
			case 'feature_others.printer_connection_guide_content.desc_1': return 'Perangkat yang dibutuhkan adalah Thermal Printer yang memiliki fitur Bluetooth dengan lebar kertas 58mm';
			case 'feature_others.printer_connection_guide_content.title_2': return '2. Hubungkan Perangkat';
			case 'feature_others.printer_connection_guide_content.desc_2': return 'Buka pengaturan dan pasangkan dengan perangkat Thermal Printer';
			case 'feature_others.printer_connection_guide_content.button_text_2': return 'Buka Pengaturan Bluetooth';
			case 'feature_others.printer_connection_guide_content.title_3': return '3. Hubungkan Printer';
			case 'feature_others.printer_connection_guide_content.desc_3': return '\'Klik tombol teks "Tidak Terhubung (Diam)". Untuk menghubungkan\'';
			case 'feature_others.printer_connection_guide_content.title_4': return '4. Pilih Perangkat';
			case 'feature_others.printer_connection_guide_content.desc_4': return 'Pilih perangkat sesuai dengan nama dan Mac Address';
			case 'feature_others.printer_connection_guide_content.title_5': return '5. Perangkat Berhasil Terhubung';
			case 'feature_others.printer_connection_guide_content.desc_5': return ' the device is successfully connected. Click the "Print" button to print\'';
			case 'feature_others.printer_connection_guide_content.button_text_5': return 'Tes Cetak';
			case 'esc_strings.no_printer_selected': return 'Tidak ada printer terpilih';
			case 'esc_strings.printing_in_progress': return 'Sedang Mencetak';
			case 'esc_strings.time_arg': return ({required Object time_string}) => 'Waktu: ${time_string}';
			case 'esc_strings.print_test_succeeded': return 'Tes mencetak berhasil';
			case 'esc_strings.phone_number': return ({required Object phone_number}) => 'No. Telp: ${phone_number}';
			case 'esc_strings.method': return 'Metode';
			case 'esc_strings.payment': return 'Pembayaran';
			case 'esc_strings.change': return 'Kembalian';
			case 'esc_strings.thank_you_for_coming': return 'Terima kasih sudah datang';
			case 'esc_strings.journal': return 'Journal';
			case 'esc_strings.cancelled': return 'DIBATALKAN';
			case 'esc_strings.income_report': return 'LAPORAN PENDAPATAN';
			case 'esc_strings.total': return 'TOTAL';
			case 'esc_strings.product_sales': return 'Penjualan Produk';
			case 'esc_strings.qty': return ({required Object qty}) => '${qty} jml';
			case 'esc_strings.income': return 'Pendapatan';
			case 'esc_strings.printer_status': return 'Status printer:';
			case 'esc_strings.bluetooth_turned_off': return 'Bluetooth mati';
			case 'esc_strings.not_connected': return 'Tidak Terhubung';
			case 'esc_strings.printing': return 'Mencetak';
			case 'esc_strings.idle': return 'Diam';
			case 'esc_strings.paired_devices': return 'Perangkan yang Dikenali';
			case 'esc_strings.cannot_find_device': return 'Tidak menemukan perangkat? Kenali perangkat!';
			case 'esc_strings.failed_to_connect_device': return 'Gagal menghubungkan perangkat';
			case 'modified_text_form_widget.alert.empty': return ({required Object item}) => '${item} kosong';
			case 'modified_text_form_widget.alert.not_filled_yet': return ({required Object item}) => '${item} belum diisi';
			case 'modified_text_form_widget.alert.not_saved_yet': return ({required Object item}) => '${item} belum disimpan';
			case 'modified_text_form_widget.alert.has_been_filled': return ({required Object item}) => '${item} sudah diisi';
			case 'modified_text_form_widget.alert.has_been_saved': return ({required Object item}) => '${item} sudah disimpan';
			case 'modified_text_form_widget.alert.cannot_be_empty': return 'Tidak boleh kosong';
			default: return null;
		}
	}
}

