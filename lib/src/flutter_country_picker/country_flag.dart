import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'country_data.dart';

/// Rendering mode for [CountryFlag].
enum CountryFlagMode { emoji, svg }

/// Custom builder for SVG flag rendering.
typedef CountryFlagSvgBuilder = Widget Function(
  BuildContext context,
  String svgUrl,
  Country country,
  CountryFlagStyle style,
  Widget fallback,
);

/// Visual style for [CountryFlag].
@immutable
class CountryFlagStyle {
  final double size;
  final bool isCircle;
  final BorderRadiusGeometry borderRadius;
  final Color? backgroundColor;
  final Color? borderColor;
  final double borderWidth;
  final EdgeInsetsGeometry padding;
  final BoxFit fit;
  final TextStyle? emojiTextStyle;

  const CountryFlagStyle({
    this.size = 20,
    this.isCircle = false,
    this.borderRadius = const BorderRadius.all(Radius.circular(6)),
    this.backgroundColor,
    this.borderColor,
    this.borderWidth = 0,
    this.padding = EdgeInsets.zero,
    this.fit = BoxFit.cover,
    this.emojiTextStyle,
  }) : assert(size > 0, 'size must be positive');

  CountryFlagStyle copyWith({
    double? size,
    bool? isCircle,
    BorderRadiusGeometry? borderRadius,
    Color? backgroundColor,
    Color? borderColor,
    double? borderWidth,
    EdgeInsetsGeometry? padding,
    BoxFit? fit,
    TextStyle? emojiTextStyle,
  }) {
    return CountryFlagStyle(
      size: size ?? this.size,
      isCircle: isCircle ?? this.isCircle,
      borderRadius: borderRadius ?? this.borderRadius,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      borderColor: borderColor ?? this.borderColor,
      borderWidth: borderWidth ?? this.borderWidth,
      padding: padding ?? this.padding,
      fit: fit ?? this.fit,
      emojiTextStyle: emojiTextStyle ?? this.emojiTextStyle,
    );
  }
}

/// Country flag widget with emoji and SVG modes.
class CountryFlag extends StatelessWidget {
  final Country? country;
  final CountryFlagMode mode;
  final CountryFlagStyle style;
  final String unknownFlag;
  final String Function(String countryCode)? svgUrlBuilder;
  final CountryFlagSvgBuilder? svgBuilder;
  final String? semanticsLabel;

  const CountryFlag({
    super.key,
    required this.country,
    this.mode = CountryFlagMode.emoji,
    this.style = const CountryFlagStyle(),
    this.unknownFlag = '🏳️',
    this.svgUrlBuilder,
    this.svgBuilder,
    this.semanticsLabel,
  });

  /// Create a flag by ISO country code.
  factory CountryFlag.fromCountryCode(
    String countryCode, {
    Key? key,
    CountryFlagMode mode = CountryFlagMode.emoji,
    CountryFlagStyle style = const CountryFlagStyle(),
    String unknownFlag = '🏳️',
    String Function(String countryCode)? svgUrlBuilder,
    CountryFlagSvgBuilder? svgBuilder,
    String? semanticsLabel,
  }) {
    return CountryFlag(
      key: key,
      country: CountryData.getCountryByCode(countryCode.trim().toUpperCase()),
      mode: mode,
      style: style,
      unknownFlag: unknownFlag,
      svgUrlBuilder: svgUrlBuilder,
      svgBuilder: svgBuilder,
      semanticsLabel: semanticsLabel,
    );
  }

  /// Create a flag by language code (for example `en` or `pt-BR`).
  factory CountryFlag.fromLanguageCode(
    String languageCode, {
    Key? key,
    CountryFlagMode mode = CountryFlagMode.emoji,
    CountryFlagStyle style = const CountryFlagStyle(),
    String unknownFlag = '🏳️',
    String Function(String countryCode)? svgUrlBuilder,
    CountryFlagSvgBuilder? svgBuilder,
    String? semanticsLabel,
  }) {
    return CountryFlag(
      key: key,
      country: lookupByLanguageCode(languageCode),
      mode: mode,
      style: style,
      unknownFlag: unknownFlag,
      svgUrlBuilder: svgUrlBuilder,
      svgBuilder: svgBuilder,
      semanticsLabel: semanticsLabel,
    );
  }

  /// Create a flag by ISO 4217 currency code (for example `USD`).
  factory CountryFlag.fromCurrencyCode(
    String currencyCode, {
    Key? key,
    CountryFlagMode mode = CountryFlagMode.emoji,
    CountryFlagStyle style = const CountryFlagStyle(),
    String unknownFlag = '🏳️',
    String Function(String countryCode)? svgUrlBuilder,
    CountryFlagSvgBuilder? svgBuilder,
    String? semanticsLabel,
  }) {
    return CountryFlag(
      key: key,
      country: lookupByCurrencyCode(currencyCode),
      mode: mode,
      style: style,
      unknownFlag: unknownFlag,
      svgUrlBuilder: svgUrlBuilder,
      svgBuilder: svgBuilder,
      semanticsLabel: semanticsLabel,
    );
  }

  /// Create a flag by phone code (for example `+1` or `44`).
  factory CountryFlag.fromPhoneCode(
    String phoneCode, {
    Key? key,
    CountryFlagMode mode = CountryFlagMode.emoji,
    CountryFlagStyle style = const CountryFlagStyle(),
    String unknownFlag = '🏳️',
    String Function(String countryCode)? svgUrlBuilder,
    CountryFlagSvgBuilder? svgBuilder,
    String? semanticsLabel,
  }) {
    return CountryFlag(
      key: key,
      country: lookupByPhoneCode(phoneCode),
      mode: mode,
      style: style,
      unknownFlag: unknownFlag,
      svgUrlBuilder: svgUrlBuilder,
      svgBuilder: svgBuilder,
      semanticsLabel: semanticsLabel,
    );
  }

  /// Resolve country by language code.
  static Country? lookupByLanguageCode(String languageCode) {
    final normalized = languageCode.trim().replaceAll('_', '-');
    if (normalized.isEmpty) {
      return null;
    }

    final segments = normalized.split('-');
    if (segments.length > 1) {
      final regionCode = segments.last.toUpperCase();
      final regionCountry = CountryData.getCountryByCode(regionCode);
      if (regionCountry != null) {
        return regionCountry;
      }
    }

    final language = segments.first.toLowerCase();
    final mappedCountryCode = _languageToCountryCode[language];
    if (mappedCountryCode == null) {
      return null;
    }

    return CountryData.getCountryByCode(mappedCountryCode);
  }

  /// Resolve country by currency code.
  static Country? lookupByCurrencyCode(String currencyCode) {
    final normalized = currencyCode.trim().toUpperCase();
    if (normalized.isEmpty) {
      return null;
    }

    final mappedCountryCode = _currencyToCountryCode[normalized];
    if (mappedCountryCode == null) {
      return null;
    }

    return CountryData.getCountryByCode(mappedCountryCode);
  }

  /// Resolve country by phone code.
  static Country? lookupByPhoneCode(String phoneCode) {
    return CountryData.findByPhoneCode(phoneCode);
  }

  /// Default SVG URL builder.
  static String defaultSvgUrlBuilder(String countryCode) {
    return 'https://flagcdn.com/${countryCode.toLowerCase()}.svg';
  }

  static const Map<String, String> _languageToCountryCode = {
    'ar': 'SA',
    'bn': 'BD',
    'de': 'DE',
    'en': 'US',
    'es': 'ES',
    'fa': 'IR',
    'fr': 'FR',
    'he': 'IL',
    'hi': 'IN',
    'id': 'ID',
    'it': 'IT',
    'ja': 'JP',
    'ko': 'KR',
    'ms': 'MY',
    'nl': 'NL',
    'pl': 'PL',
    'pt': 'PT',
    'ru': 'RU',
    'sv': 'SE',
    'th': 'TH',
    'tr': 'TR',
    'uk': 'UA',
    'ur': 'PK',
    'vi': 'VN',
    'zh': 'CN',
  };

  static const Map<String, String> _currencyToCountryCode = {
    'AED': 'AE',
    'ARS': 'AR',
    'AUD': 'AU',
    'BDT': 'BD',
    'BGN': 'BG',
    'BHD': 'BH',
    'BRL': 'BR',
    'CAD': 'CA',
    'CHF': 'CH',
    'CLP': 'CL',
    'CNY': 'CN',
    'COP': 'CO',
    'CZK': 'CZ',
    'DKK': 'DK',
    'DZD': 'DZ',
    'EGP': 'EG',
    'EUR': 'DE',
    'GBP': 'GB',
    'GHS': 'GH',
    'HKD': 'HK',
    'HUF': 'HU',
    'IDR': 'ID',
    'ILS': 'IL',
    'INR': 'IN',
    'IQD': 'IQ',
    'IRR': 'IR',
    'JPY': 'JP',
    'KES': 'KE',
    'KRW': 'KR',
    'KWD': 'KW',
    'KZT': 'KZ',
    'LBP': 'LB',
    'LKR': 'LK',
    'MAD': 'MA',
    'MMK': 'MM',
    'MXN': 'MX',
    'MYR': 'MY',
    'NGN': 'NG',
    'NOK': 'NO',
    'NZD': 'NZ',
    'OMR': 'OM',
    'PEN': 'PE',
    'PHP': 'PH',
    'PKR': 'PK',
    'PLN': 'PL',
    'QAR': 'QA',
    'RON': 'RO',
    'RSD': 'RS',
    'RUB': 'RU',
    'SAR': 'SA',
    'SEK': 'SE',
    'SGD': 'SG',
    'THB': 'TH',
    'TRY': 'TR',
    'TWD': 'TW',
    'UAH': 'UA',
    'USD': 'US',
    'UYU': 'UY',
    'UZS': 'UZ',
    'VND': 'VN',
    'XOF': 'SN',
    'ZAR': 'ZA',
  };

  @override
  Widget build(BuildContext context) {
    final resolvedCountry = country;

    final child = switch (mode) {
      CountryFlagMode.emoji => _buildEmojiFlag(resolvedCountry),
      CountryFlagMode.svg => _buildSvgFlag(context, resolvedCountry),
    };

    return _wrapWithStyle(child);
  }

  Widget _buildEmojiFlag(Country? resolvedCountry) {
    final emoji = resolvedCountry?.flag ?? unknownFlag;
    final baseStyle = TextStyle(fontSize: style.size * 0.72, height: 1);
    return Text(
      emoji,
      textAlign: TextAlign.center,
      overflow: TextOverflow.clip,
      style: style.emojiTextStyle ?? baseStyle,
      semanticsLabel: semanticsLabel,
    );
  }

  Widget _buildSvgFlag(BuildContext context, Country? resolvedCountry) {
    if (resolvedCountry == null) {
      return _buildEmojiFlag(null);
    }

    final fallback = _buildEmojiFlag(resolvedCountry);
    final urlBuilder = svgUrlBuilder ?? defaultSvgUrlBuilder;
    final svgUrl = urlBuilder(resolvedCountry.code).trim();

    final uri = Uri.tryParse(svgUrl);
    if (uri == null || !uri.hasScheme || !uri.hasAuthority) {
      return fallback;
    }

    final builder = svgBuilder ?? _defaultSvgBuilder;
    try {
      return builder(context, svgUrl, resolvedCountry, style, fallback);
    } catch (_) {
      return fallback;
    }
  }

  Widget _defaultSvgBuilder(
    BuildContext context,
    String svgUrl,
    Country country,
    CountryFlagStyle style,
    Widget fallback,
  ) {
    return SvgPicture.network(
      svgUrl,
      width: style.size,
      height: style.size,
      fit: style.fit,
      placeholderBuilder: (_) => fallback,
      semanticsLabel: semanticsLabel ?? country.code,
    );
  }

  Widget _wrapWithStyle(Widget child) {
    final hasBorder = style.borderColor != null && style.borderWidth > 0;

    Widget content = Container(
      width: style.size,
      height: style.size,
      alignment: Alignment.center,
      padding: style.padding,
      decoration: BoxDecoration(
        color: style.backgroundColor,
        shape: style.isCircle ? BoxShape.circle : BoxShape.rectangle,
        borderRadius: style.isCircle ? null : style.borderRadius,
        border: hasBorder
            ? Border.all(color: style.borderColor!, width: style.borderWidth)
            : null,
      ),
      child: child,
    );

    if (style.isCircle) {
      content = ClipOval(child: content);
    } else {
      content = ClipRRect(borderRadius: style.borderRadius, child: content);
    }

    return content;
  }
}
