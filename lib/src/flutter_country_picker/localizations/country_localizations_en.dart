import 'country_localizations.dart';

/// English localization for country names
class CountryLocalizationsEn extends CountryLocalizations {
  CountryLocalizationsEn() : super('en');

  @override
  String getCountryName(String countryCode) {
    return _countryNames[countryCode] ?? countryCode;
  }

  @override
  Map<String, String> get allCountryNames => _countryNames;

  @override
  String get selectCountry => 'Select Country';

  @override
  String get searchCountry => 'Search country...';

  @override
  String get selectYourCountry => 'Select your country';

  static const Map<String, String> _countryNames = {
    "RU": "Russia",
    "US": "United States",
    "GB": "United Kingdom",
    "DE": "Germany",
    "FR": "France",
    "IT": "Italy",
    "ES": "Spain",
    "CA": "Canada",
    "AU": "Australia",
    "JP": "Japan",
    "CN": "China",
    "IN": "India",
    "BR": "Brazil",
    "MX": "Mexico",
    "AR": "Argentina",
    "CL": "Chile",
    "CO": "Colombia",
    "PE": "Peru",
    "VE": "Venezuela",
    "EC": "Ecuador",
    "BO": "Bolivia",
    "PY": "Paraguay",
    "UY": "Uruguay",
    "GY": "Guyana",
    "SR": "Suriname",
    "FK": "Falkland Islands",
    "GF": "French Guiana",
    "NL": "Netherlands",
    "BE": "Belgium",
    "CH": "Switzerland",
    "AT": "Austria",
    "SE": "Sweden",
    "NO": "Norway",
    "DK": "Denmark",
    "FI": "Finland",
    "PL": "Poland",
    "CZ": "Czech Republic",
    "SK": "Slovakia",
    "HU": "Hungary",
    "RO": "Romania",
    "BG": "Bulgaria",
    "HR": "Croatia",
    "SI": "Slovenia",
    "EE": "Estonia",
    "LV": "Latvia",
    "LT": "Lithuania",
    "UA": "Ukraine",
    "BY": "Belarus",
    "MD": "Moldova",
    "GE": "Georgia",
    "AM": "Armenia",
    "AZ": "Azerbaijan",
    "KZ": "Kazakhstan",
    "UZ": "Uzbekistan",
    "KG": "Kyrgyzstan",
    "TJ": "Tajikistan",
    "TM": "Turkmenistan",
    "TR": "Turkey",
    "GR": "Greece",
    "PT": "Portugal",
    "IE": "Ireland",
    "IS": "Iceland",
    "MT": "Malta",
    "CY": "Cyprus",
    "LU": "Luxembourg",
    "MC": "Monaco",
    "LI": "Liechtenstein",
    "SM": "San Marino",
    "VA": "Vatican City",
    "AD": "Andorra",
    "AL": "Albania",
    "AX": "Åland Islands",
    "BA": "Bosnia and Herzegovina",
    "BN": "Brunei",
    "BT": "Bhutan",
    "FO": "Faroe Islands",
    "GG": "Guernsey",
    "GI": "Gibraltar",
    "IM": "Isle of Man",
    "JE": "Jersey",
    "KY": "Cayman Islands",
    "LK": "Sri Lanka",
    "ME": "Montenegro",
    "MK": "North Macedonia",
    "MN": "Mongolia",
    "MV": "Maldives",
    "NP": "Nepal",
    "RS": "Serbia",
    "SJ": "Svalbard and Jan Mayen",
    "TL": "Timor-Leste",
    "UM": "United States Minor Outlying Islands",
    "XK": "Kosovo",
    "KR": "South Korea",
    "KP": "North Korea",
    "TW": "Taiwan",
    "HK": "Hong Kong",
    "MO": "Macau",
    "SG": "Singapore",
    "MY": "Malaysia",
    "TH": "Thailand",
    "VN": "Vietnam",
    "PH": "Philippines",
    "ID": "Indonesia",
    "MM": "Myanmar",
    "LA": "Laos",
    "KH": "Cambodia",
    "BD": "Bangladesh",
    "PK": "Pakistan",
    "AF": "Afghanistan",
    "IR": "Iran",
    "IQ": "Iraq",
    "SY": "Syria",
    "LB": "Lebanon",
    "JO": "Jordan",
    "IL": "Israel",
    "PS": "Palestine",
    "SA": "Saudi Arabia",
    "AE": "United Arab Emirates",
    "QA": "Qatar",
    "KW": "Kuwait",
    "BH": "Bahrain",
    "OM": "Oman",
    "YE": "Yemen",
    "EG": "Egypt",
    "LY": "Libya",
    "TN": "Tunisia",
    "DZ": "Algeria",
    "MA": "Morocco",
    "SD": "Sudan",
    "SS": "South Sudan",
    "ET": "Ethiopia",
    "ER": "Eritrea",
    "DJ": "Djibouti",
    "SO": "Somalia",
    "KE": "Kenya",
    "TZ": "Tanzania",
    "UG": "Uganda",
    "RW": "Rwanda",
    "BI": "Burundi",
    "MZ": "Mozambique",
    "ZW": "Zimbabwe",
    "ZM": "Zambia",
    "MW": "Malawi",
    "BW": "Botswana",
    "NA": "Namibia",
    "ZA": "South Africa",
    "LS": "Lesotho",
    "SZ": "Eswatini",
    "MG": "Madagascar",
    "MU": "Mauritius",
    "SC": "Seychelles",
    "KM": "Comoros",
    "RE": "Réunion",
    "YT": "Mayotte",
    "NG": "Nigeria",
    "GH": "Ghana",
    "CI": "Ivory Coast",
    "BF": "Burkina Faso",
    "ML": "Mali",
    "NE": "Niger",
    "TD": "Chad",
    "CM": "Cameroon",
    "CF": "Central African Republic",
    "CG": "Republic of the Congo",
    "CD": "Democratic Republic of the Congo",
    "GA": "Gabon",
    "GQ": "Equatorial Guinea",
    "ST": "São Tomé and Príncipe",
    "AO": "Angola",
    "GW": "Guinea-Bissau",
    "GN": "Guinea",
    "SL": "Sierra Leone",
    "LR": "Liberia",
    "TG": "Togo",
    "BJ": "Benin",
    "SN": "Senegal",
    "GM": "Gambia",
    "CV": "Cape Verde",
    "MR": "Mauritania",
    "EH": "Western Sahara",
    "NZ": "New Zealand",
    "FJ": "Fiji",
    "PG": "Papua New Guinea",
    "SB": "Solomon Islands",
    "VU": "Vanuatu",
    "NC": "New Caledonia",
    "PF": "French Polynesia",
    "TO": "Tonga",
    "WS": "Samoa",
    "KI": "Kiribati",
    "TV": "Tuvalu",
    "NR": "Nauru",
    "PW": "Palau",
    "MH": "Marshall Islands",
    "FM": "Micronesia",
    "CK": "Cook Islands",
    "NU": "Niue",
    "TK": "Tokelau",
    "AS": "American Samoa",
    "GU": "Guam",
    "MP": "Northern Mariana Islands",
    "PR": "Puerto Rico",
    "VI": "U.S. Virgin Islands",
    "GP": "Guadeloupe",
    "MQ": "Martinique",
    "BL": "Saint Barthélemy",
    "MF": "Saint Martin",
    "AW": "Aruba",
    "CW": "Curaçao",
    "SX": "Sint Maarten",
    "BQ": "Caribbean Netherlands",
    "TC": "Turks and Caicos Islands",
    "AI": "Anguilla",
    "VG": "British Virgin Islands",
    "MS": "Montserrat",
    "DM": "Dominica",
    "GD": "Grenada",
    "LC": "Saint Lucia",
    "VC": "Saint Vincent and the Grenadines",
    "BB": "Barbados",
    "TT": "Trinidad and Tobago",
    "JM": "Jamaica",
    "HT": "Haiti",
    "DO": "Dominican Republic",
    "CU": "Cuba",
    "BS": "Bahamas",
    "KN": "Saint Kitts and Nevis",
    "AG": "Antigua and Barbuda",
    "NI": "Nicaragua",
    "CR": "Costa Rica",
    "PA": "Panama",
    "HN": "Honduras",
    "SV": "El Salvador",
    "GT": "Guatemala",
    "BZ": "Belize",
    "GL": "Greenland",
    "PM": "Saint Pierre and Miquelon",
    "BM": "Bermuda",
    "IO": "British Indian Ocean Territory",
    "SH": "Saint Helena",
    "AC": "Ascension Island",
    "TA": "Tristan da Cunha",
    "CX": "Christmas Island",
    "CC": "Cocos Islands",
    "NF": "Norfolk Island",
    "AQ": "Antarctica",
    "BV": "Bouvet Island",
    "TF": "French Southern Territories",
    "HM": "Heard and McDonald Islands",
    "GS": "South Georgia and the South Sandwich Islands",
    "PN": "Pitcairn",
    "WF": "Wallis and Futuna"
  };
}
