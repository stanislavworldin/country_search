import 'country_localizations.dart';

/// French localization for country names
class CountryLocalizationsFr extends CountryLocalizations {
  CountryLocalizationsFr() : super('fr');

  @override
  String getCountryName(String countryCode) {
    return _countryNames[countryCode] ?? countryCode;
  }

  @override
  Map<String, String> get allCountryNames => _countryNames;

  @override
  String get selectCountry => 'Sélectionner un pays';

  @override
  String get searchCountry => 'Rechercher un pays...';

  @override
  String get selectYourCountry => 'Sélectionnez votre pays';

  static const Map<String, String> _countryNames = {
    "RU": "Russie",
    "US": "États-Unis",
    "GB": "Royaume-Uni",
    "DE": "Allemagne",
    "FR": "France",
    "IT": "Italie",
    "ES": "Espagne",
    "CA": "Canada",
    "AU": "Australie",
    "JP": "Japon",
    "CN": "Chine",
    "IN": "Inde",
    "BR": "Brésil",
    "MX": "Mexique",
    "AR": "Argentine",
    "CL": "Chili",
    "CO": "Colombie",
    "PE": "Pérou",
    "VE": "Venezuela",
    "EC": "Équateur",
    "BO": "Bolivie",
    "PY": "Paraguay",
    "UY": "Uruguay",
    "GY": "Guyana",
    "SR": "Suriname",
    "FK": "Îles Malouines",
    "GF": "Guyane française",
    "NL": "Pays-Bas",
    "BE": "Belgique",
    "CH": "Suisse",
    "AT": "Autriche",
    "SE": "Suède",
    "NO": "Norvège",
    "DK": "Danemark",
    "FI": "Finlande",
    "PL": "Pologne",
    "CZ": "République tchèque",
    "SK": "Slovaquie",
    "HU": "Hongrie",
    "RO": "Roumanie",
    "BG": "Bulgarie",
    "HR": "Croatie",
    "SI": "Slovénie",
    "EE": "Estonie",
    "LV": "Lettonie",
    "LT": "Lituanie",
    "UA": "Ukraine",
    "BY": "Biélorussie",
    "MD": "Moldavie",
    "GE": "Géorgie",
    "AM": "Arménie",
    "AZ": "Azerbaïdjan",
    "KZ": "Kazakhstan",
    "UZ": "Ouzbékistan",
    "KG": "Kirghizistan",
    "TJ": "Tadjikistan",
    "TM": "Turkménistan",
    "TR": "Turquie",
    "GR": "Grèce",
    "PT": "Portugal",
    "IE": "Irlande",
    "IS": "Islande",
    "MT": "Malte",
    "CY": "Chypre",
    "LU": "Luxembourg",
    "MC": "Monaco",
    "LI": "Liechtenstein",
    "SM": "Saint-Marin",
    "VA": "Vatican",
    "AD": "Andorre",
    "AL": "Albanie",
    "AX": "Îles Åland",
    "BA": "Bosnie-Herzégovine",
    "BN": "Brunei",
    "BT": "Bhoutan",
    "FO": "Îles Féroé",
    "GG": "Guernesey",
    "GI": "Gibraltar",
    "IM": "Île de Man",
    "JE": "Jersey",
    "KY": "Îles Caïmans",
    "LK": "Sri Lanka",
    "ME": "Monténégro",
    "MK": "Macédoine du Nord",
    "MN": "Mongolie",
    "MV": "Maldives",
    "NP": "Népal",
    "RS": "Serbie",
    "SJ": "Svalbard et Jan Mayen",
    "TL": "Timor oriental",
    "UM": "Îles mineures éloignées des États-Unis",
    "XK": "Kosovo",
    "KR": "Corée du Sud",
    "KP": "Corée du Nord",
    "TW": "Taïwan",
    "HK": "Hong Kong",
    "MO": "Macao",
    "SG": "Singapour",
    "MY": "Malaisie",
    "TH": "Thaïlande",
    "VN": "Vietnam",
    "PH": "Philippines",
    "ID": "Indonésie",
    "MM": "Myanmar",
    "LA": "Laos",
    "KH": "Cambodge",
    "BD": "Bangladesh",
    "PK": "Pakistan",
    "AF": "Afghanistan",
    "IR": "Iran",
    "IQ": "Irak",
    "SY": "Syrie",
    "LB": "Liban",
    "JO": "Jordanie",
    "IL": "Israël",
    "PS": "Palestine",
    "SA": "Arabie saoudite",
    "AE": "Émirats arabes unis",
    "QA": "Qatar",
    "KW": "Koweït",
    "BH": "Bahreïn",
    "OM": "Oman",
    "YE": "Yémen",
    "EG": "Égypte",
    "LY": "Libye",
    "TN": "Tunisie",
    "DZ": "Algérie",
    "MA": "Maroc",
    "SD": "Soudan",
    "SS": "Soudan du Sud",
    "ET": "Éthiopie",
    "ER": "Érythrée",
    "DJ": "Djibouti",
    "SO": "Somalie",
    "KE": "Kenya",
    "TZ": "Tanzanie",
    "UG": "Ouganda",
    "RW": "Rwanda",
    "BI": "Burundi",
    "MZ": "Mozambique",
    "ZW": "Zimbabwe",
    "ZM": "Zambie",
    "MW": "Malawi",
    "BW": "Botswana",
    "NA": "Namibie",
    "ZA": "Afrique du Sud",
    "LS": "Lesotho",
    "SZ": "Eswatini",
    "MG": "Madagascar",
    "MU": "Maurice",
    "SC": "Seychelles",
    "KM": "Comores",
    "RE": "Réunion",
    "YT": "Mayotte",
    "NG": "Nigeria",
    "GH": "Ghana",
    "CI": "Côte d'Ivoire",
    "BF": "Burkina Faso",
    "ML": "Mali",
    "NE": "Niger",
    "TD": "Tchad",
    "CM": "Cameroun",
    "CF": "République centrafricaine",
    "CG": "République du Congo",
    "CD": "République démocratique du Congo",
    "GA": "Gabon",
    "GQ": "Guinée équatoriale",
    "ST": "São Tomé-et-Principe",
    "AO": "Angola",
    "GW": "Guinée-Bissau",
    "GN": "Guinée",
    "SL": "Sierra Leone",
    "LR": "Libéria",
    "TG": "Togo",
    "BJ": "Bénin",
    "SN": "Sénégal",
    "GM": "Gambie",
    "CV": "Cap-Vert",
    "MR": "Mauritanie",
    "EH": "Sahara occidental",
    "NZ": "Nouvelle-Zélande",
    "FJ": "Fidji",
    "PG": "Papouasie-Nouvelle-Guinée",
    "SB": "Îles Salomon",
    "VU": "Vanuatu",
    "NC": "Nouvelle-Calédonie",
    "PF": "Polynésie française",
    "TO": "Tonga",
    "WS": "Samoa",
    "KI": "Kiribati",
    "TV": "Tuvalu",
    "NR": "Nauru",
    "PW": "Palaos",
    "MH": "Îles Marshall",
    "FM": "Micronésie",
    "CK": "Îles Cook",
    "NU": "Niue",
    "TK": "Tokelau",
    "AS": "Samoa américaines",
    "GU": "Guam",
    "MP": "Îles Mariannes du Nord",
    "PR": "Porto Rico",
    "VI": "Îles Vierges des États-Unis",
    "GP": "Guadeloupe",
    "MQ": "Martinique",
    "BL": "Saint-Barthélemy",
    "MF": "Saint-Martin",
    "AW": "Aruba",
    "CW": "Curaçao",
    "SX": "Saint-Martin",
    "BQ": "Pays-Bas caribéens",
    "TC": "Îles Turques-et-Caïques",
    "AI": "Anguilla",
    "VG": "Îles Vierges britanniques",
    "MS": "Montserrat",
    "DM": "Dominique",
    "GD": "Grenade",
    "LC": "Sainte-Lucie",
    "VC": "Saint-Vincent-et-les Grenadines",
    "BB": "Barbade",
    "TT": "Trinité-et-Tobago",
    "JM": "Jamaïque",
    "HT": "Haïti",
    "DO": "République dominicaine",
    "CU": "Cuba",
    "BS": "Bahamas",
    "KN": "Saint-Kitts-et-Nevis",
    "AG": "Antigua-et-Barbuda",
    "NI": "Nicaragua",
    "CR": "Costa Rica",
    "PA": "Panama",
    "HN": "Honduras",
    "SV": "El Salvador",
    "GT": "Guatemala",
    "BZ": "Belize",
    "GL": "Groenland",
    "PM": "Saint-Pierre-et-Miquelon",
    "BM": "Bermudes",
    "IO": "Territoire britannique de l'océan Indien",
    "SH": "Sainte-Hélène",
    "AC": "Île de l'Ascension",
    "TA": "Tristan da Cunha",
    "CX": "Île Christmas",
    "CC": "Îles Cocos",
    "NF": "Île Norfolk",
    "AQ": "Antarctique",
    "BV": "Île Bouvet",
    "TF": "Terres australes françaises",
    "HM": "Îles Heard-et-MacDonald",
    "GS": "Géorgie du Sud-et-les Îles Sandwich du Sud",
    "PN": "Pitcairn",
    "WF": "Wallis-et-Futuna"
  };
}
