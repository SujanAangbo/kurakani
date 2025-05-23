//https://github.com/HeySreelal/countrycodes
import '../entities/country.dart';

class Countries {
  static List<Country> get list => _list;

  static Country findByCode(String code) {
    return _list.firstWhere(
          (country) => country.code == code,
      orElse: () {
        throw Exception('Could not find country by name code: $code');
      },
    );
  }

  static Country findByName(String name) {
    return _list.firstWhere(
          (country) => country.name == name,
      orElse: () {
        throw Exception('Could not find country by name: $name');
      },
    );
  }

  static Country? findByDialCode(String code) {
    return _list.firstWhere(
          (country) => country.dialCode == code,
      orElse: () {
        throw Exception('Invalid dial code: $code');
      },
    );
  }

  static const List<Country> _list = [
    Country(
      name: "Afghanistan",
      code: "AF",
      dialCode: "+93",
      flag: "🇦🇫",
    ),
    Country(
      name: "Albania",
      code: "AL",
      dialCode: "+355",
      flag: "🇦🇱",
    ),
    Country(
      name: "Algeria",
      code: "DZ",
      dialCode: "+213",
      flag: "🇩🇿",
    ),
    Country(
      name: "American Samoa",
      code: "AS",
      dialCode: "+1684",
      flag: "🇦🇸",
    ),
    Country(
      name: "Andorra",
      code: "AD",
      dialCode: "+376",
      flag: "🇦🇩",
    ),
    Country(
      name: "Angola",
      code: "AO",
      dialCode: "+244",
      flag: "🇦🇴",
    ),
    Country(
      name: "Anguilla",
      code: "AI",
      dialCode: "+1264",
      flag: "🇦🇮",
    ),
    Country(
      name: "Antigua and Barbuda",
      code: "AG",
      dialCode: "+1268",
      flag: "🇦🇬",
    ),
    Country(
      name: "Argentina",
      code: "AR",
      dialCode: "+54",
      flag: "🇦🇷",
    ),
    Country(
      name: "Armenia",
      code: "AM",
      dialCode: "+374",
      flag: "🇦🇲",
    ),
    Country(
      name: "Aruba",
      code: "AW",
      dialCode: "+297",
      flag: "🇦🇼",
    ),
    Country(
      name: "Australia",
      code: "AU",
      dialCode: "+61",
      flag: "🇦🇺",
    ),
    Country(
      name: "Austria",
      code: "AT",
      dialCode: "+43",
      flag: "🇦🇹",
    ),
    Country(
      name: "Azerbaijan",
      code: "AZ",
      dialCode: "+994",
      flag: "🇦🇿",
    ),
    Country(
      name: "Bahamas",
      code: "BS",
      dialCode: "+1242",
      flag: "🇧🇸",
    ),
    Country(
      name: "Bahrain",
      code: "BH",
      dialCode: "+973",
      flag: "🇧🇭",
    ),
    Country(
      name: "Bangladesh",
      code: "BD",
      dialCode: "+880",
      flag: "🇧🇩",
    ),
    Country(
      name: "Barbados",
      code: "BB",
      dialCode: "+1246",
      flag: "🇧🇧",
    ),
    Country(
      name: "Belarus",
      code: "BY",
      dialCode: "+375",
      flag: "🇧🇾",
    ),
    Country(
      name: "Belgium",
      code: "BE",
      dialCode: "+32",
      flag: "🇧🇪",
    ),
    Country(
      name: "Belize",
      code: "BZ",
      dialCode: "+501",
      flag: "🇧🇿",
    ),
    Country(
      name: "Benin",
      code: "BJ",
      dialCode: "+229",
      flag: "🇧🇯",
    ),
    Country(
      name: "Bermuda",
      code: "BM",
      dialCode: "+1441",
      flag: "🇧🇲",
    ),
    Country(
      name: "Bhutan",
      code: "BT",
      dialCode: "+975",
      flag: "🇧🇹",
    ),
    Country(
      name: "Bolivia",
      code: "BO",
      dialCode: "+591",
      flag: "🇧🇴",
    ),
    Country(
      name: "Bosnia and Herzegovina",
      code: "BA",
      dialCode: "+387",
      flag: "🇧🇦",
    ),
    Country(
      name: "Botswana",
      code: "BW",
      dialCode: "+267",
      flag: "🇧🇼",
    ),
    Country(
      name: "Brazil",
      code: "BR",
      dialCode: "+55",
      flag: "🇧🇷",
    ),
    Country(
      name: "British Indian Ocean Territory",
      code: "IO",
      dialCode: "+246",
      flag: "🇮🇴",
    ),
    Country(
      name: "British Virgin Islands",
      code: "VG",
      dialCode: "+1284",
      flag: "🇻🇬",
    ),
    Country(
      name: "Brunei",
      code: "BN",
      dialCode: "+673",
      flag: "🇧🇳",
    ),
    Country(
      name: "Bulgaria",
      code: "BG",
      dialCode: "+359",
      flag: "🇧🇬",
    ),
    Country(
      name: "Burkina Faso",
      code: "BF",
      dialCode: "+226",
      flag: "🇧🇫",
    ),
    Country(
      name: "Burkina Faso",
      code: "BF",
      dialCode: "+226",
      flag: "🇧🇫",
    ),
    Country(
      name: "Burundi",
      code: "BI",
      dialCode: "+257",
      flag: "🇧🇮",
    ),
    Country(
      name: "Cambodia",
      code: "KH",
      dialCode: "+855",
      flag: "🇰🇭",
    ),
    Country(
      name: "Cameroon",
      code: "CM",
      dialCode: "+237",
      flag: "🇨🇲",
    ),
    Country(
      name: "Canada",
      code: "CA",
      dialCode: "+1",
      flag: "🇨🇦",
    ),
    Country(
      name: "Cape Verde",
      code: "CV",
      dialCode: "+238",
      flag: "🇨🇻",
    ),
    Country(
      name: "Cayman Islands",
      code: "KY",
      dialCode: "+1345",
      flag: "🇰🇾",
    ),
    Country(
      name: "Central African Republic",
      code: "CF",
      dialCode: "+236",
      flag: "🇨🇫",
    ),
    Country(
      name: "Chad",
      code: "TD",
      dialCode: "+235",
      flag: "🇹🇩",
    ),
    Country(
      name: "Chile",
      code: "CL",
      dialCode: "+56",
      flag: "🇨🇱",
    ),
    Country(
      name: "China",
      code: "CN",
      dialCode: "+86",
      flag: "🇨🇳",
    ),
    Country(
      name: "Christmas Island",
      code: "CX",
      dialCode: "+61",
      flag: "🇨🇽",
    ),
    Country(
      name: "Cocos Islands",
      code: "CC",
      dialCode: "+61",
      flag: "🇨🇨",
    ),
    Country(
      name: "Colombia",
      code: "CO",
      dialCode: "+57",
      flag: "🇨🇴",
    ),
    Country(
      name: "Comoros",
      code: "KM",
      dialCode: "+269",
      flag: "🇰🇲",
    ),
    Country(
      name: "Cook Islands",
      code: "CK",
      dialCode: "+682",
      flag: "🇨🇰",
    ),
    Country(
      name: "Costa Rica",
      code: "CR",
      dialCode: "+506",
      flag: "🇨🇷",
    ),
    Country(
      name: "Croatia",
      code: "HR",
      dialCode: "+385",
      flag: "🇭🇷",
    ),
    Country(
      name: "Cuba",
      code: "CU",
      dialCode: "+53",
      flag: "🇨🇺",
    ),
    Country(
      name: "Curacao",
      code: "CW",
      dialCode: "+599",
      flag: "🇨🇼",
    ),
    Country(
      name: "Cyprus",
      code: "CY",
      dialCode: "+357",
      flag: "🇨🇾",
    ),
    Country(
      name: "Czech Republic",
      code: "CZ",
      dialCode: "+420",
      flag: "🇨🇿",
    ),
    Country(
      name: "Democratic Republic of the Congo",
      code: "CD",
      dialCode: "+243",
      flag: "🇨🇩",
    ),
    Country(
      name: "Denmark",
      code: "DK",
      dialCode: "+45",
      flag: "🇩🇰",
    ),
    Country(
      name: "Djibouti",
      code: "DJ",
      dialCode: "+253",
      flag: "🇩🇯",
    ),
    Country(
      name: "Dominica",
      code: "DM",
      dialCode: "+1767",
      flag: "🇩🇲",
    ),
    Country(
      name: "Dominican Republic",
      code: "DO",
      dialCode: "+1809",
      flag: "🇩🇴",
    ),
    Country(
      name: "Dominican Republic",
      code: "DO",
      dialCode: "+1829",
      flag: "🇩🇴",
    ),
    Country(
      name: "Dominican Republic",
      code: "DO",
      dialCode: "+1849",
      flag: "🇩🇴",
    ),
    Country(
      name: "Ecuador",
      code: "EC",
      dialCode: "+593",
      flag: "🇪🇨",
    ),
    Country(
      name: "Egypt",
      code: "EG",
      dialCode: "+20",
      flag: "🇪🇬",
    ),
    Country(
      name: "El Salvador",
      code: "SV",
      dialCode: "+503",
      flag: "🇸🇻",
    ),
    Country(
      name: "Equatorial Guinea",
      code: "GQ",
      dialCode: "+240",
      flag: "🇬🇶",
    ),
    Country(
      name: "Eritrea",
      code: "ER",
      dialCode: "+291",
      flag: "🇪🇷",
    ),
    Country(
      name: "Estonia",
      code: "EE",
      dialCode: "+372",
      flag: "🇪🇪",
    ),
    Country(
      name: "Ethiopia",
      code: "ET",
      dialCode: "+251",
      flag: "🇪🇹",
    ),
    Country(
      name: "Falkland Islands",
      code: "FK",
      dialCode: "+500",
      flag: "🇫🇰",
    ),
    Country(
      name: "Faroe Islands",
      code: "FO",
      dialCode: "+298",
      flag: "🇫🇴",
    ),
    Country(
      name: "Fiji",
      code: "FJ",
      dialCode: "+679",
      flag: "🇫🇯",
    ),
    Country(
      name: "Finland",
      code: "FI",
      dialCode: "+358",
      flag: "🇫🇮",
    ),
    Country(
      name: "France",
      code: "FR",
      dialCode: "+33",
      flag: "🇫🇷",
    ),
    Country(
      name: "French Guiana",
      code: "GF",
      dialCode: "+594",
      flag: "🇬🇫",
    ),
    Country(
      name: "French Polynesia",
      code: "PF",
      dialCode: "+689",
      flag: "🇵🇫",
    ),
    Country(
      name: "Gabon",
      code: "GA",
      dialCode: "+241",
      flag: "🇬🇦",
    ),
    Country(
      name: "Gambia",
      code: "GM",
      dialCode: "+220",
      flag: "🇬🇲",
    ),
    Country(
      name: "Georgia",
      code: "GE",
      dialCode: "+995",
      flag: "🇬🇪",
    ),
    Country(
      name: "Germany",
      code: "DE",
      dialCode: "+49",
      flag: "🇩🇪",
    ),
    Country(
      name: "Ghana",
      code: "GH",
      dialCode: "+233",
      flag: "🇬🇭",
    ),
    Country(
      name: "Gibraltar",
      code: "GI",
      dialCode: "+350",
      flag: "🇬🇮",
    ),
    Country(
      name: "Global Mobile Satellite System",
      code: "GMS",
      dialCode: "+881",
      flag: "🛰",
    ),
    Country(
      name: "Greece",
      code: "GR",
      dialCode: "+30",
      flag: "🇬🇷",
    ),
    Country(
      name: "Greenland",
      code: "GL",
      dialCode: "+299",
      flag: "🇬🇱",
    ),
    Country(
      name: "Grenada",
      code: "GD",
      dialCode: "+1473",
      flag: "🇬🇩",
    ),
    Country(
      name: "Guadeloupe",
      code: "GP",
      dialCode: "+590",
      flag: "🇬🇵",
    ),
    Country(
      name: "Guam",
      code: "GU",
      dialCode: "+1671",
      flag: "🇬🇺",
    ),
    Country(
      name: "Guatemala",
      code: "GT",
      dialCode: "+502",
      flag: "🇬🇹",
    ),
    Country(
      name: "Guernsey",
      code: "GG",
      dialCode: "+44",
      flag: "🇬🇬",
    ),
    Country(
      name: "Guinea",
      code: "GN",
      dialCode: "+224",
      flag: "🇬🇳",
    ),
    Country(
      name: "Guinea-Bissau",
      code: "GW",
      dialCode: "+245",
      flag: "🇬🇼",
    ),
    Country(
      name: "Guyana",
      code: "GY",
      dialCode: "+592",
      flag: "🇬🇾",
    ),
    Country(
      name: "Haiti",
      code: "HT",
      dialCode: "+509",
      flag: "🇭🇹",
    ),
    Country(
      name: "Honduras",
      code: "HN",
      dialCode: "+504",
      flag: "🇭🇳",
    ),
    Country(
      name: "Hong Kong",
      code: "HK",
      dialCode: "+852",
      flag: "🇭🇰",
    ),
    Country(
      name: "Hungary",
      code: "HU",
      dialCode: "+36",
      flag: "🇭🇺",
    ),
    Country(
      name: "Iceland",
      code: "IS",
      dialCode: "+354",
      flag: "🇮🇸",
    ),
    Country(
      name: "India",
      code: "IN",
      dialCode: "+91",
      flag: "🇮🇳",
    ),
    Country(
      name: "Indonesia",
      code: "ID",
      dialCode: "+62",
      flag: "🇮🇩",
    ),
    Country(
      name: "Iran",
      code: "IR",
      dialCode: "+98",
      flag: "🇮🇷",
    ),
    Country(
      name: "International Networks",
      code: "INT",
      dialCode: "+882",
      flag: "🌍",
    ),
    Country(
      name: "International Networks",
      code: "INT",
      dialCode: "+883",
      flag: "🌍",
    ),
    Country(
      name: "Iraq",
      code: "IQ",
      dialCode: "+964",
      flag: "🇮🇶",
    ),
    Country(
      name: "Ireland",
      code: "IE",
      dialCode: "+353",
      flag: "🇮🇪",
    ),
    Country(
      name: "Israel",
      code: "IL",
      dialCode: "+972",
      flag: "🇮🇱",
    ),
    Country(
      name: "Italy",
      code: "IT",
      dialCode: "39",
      flag: "🇮🇹",
    ),
    Country(
      code: "JM",
      name: "Jamaica",
      dialCode: "+1876",
      flag: "🇯🇲",
    ),
    Country(
      name: "Japan",
      code: "JP",
      dialCode: "+81",
      flag: "🇯🇵",
    ),
    Country(
      name: "Jersey",
      code: "JE",
      dialCode: "+44",
      flag: "🇯🇪",
    ),
    Country(
      name: "Jordan",
      code: "JO",
      dialCode: "+962",
      flag: "🇯🇴",
    ),
    Country(
      name: "Kazakhstan",
      code: "KZ",
      dialCode: "+7",
      flag: "🇰🇿",
    ),
    Country(
      name: "Kenya",
      code: "KE",
      dialCode: "+254",
      flag: "🇰🇪",
    ),
    Country(
      name: "Kiribati",
      code: "KI",
      dialCode: "+686",
      flag: "🇰🇮",
    ),
    Country(
      name: "Kosovo",
      code: "XK",
      dialCode: "+383",
      flag: "🇽🇰",
    ),
    Country(
      name: "Kuwait",
      code: "KW",
      dialCode: "+965",
      flag: "🇰🇼",
    ),
    Country(
      name: "Kyrgyzstan",
      code: "KG",
      dialCode: "+996",
      flag: "🇰🇬",
    ),
    Country(
      name: "Laos",
      code: "LA",
      dialCode: "+856",
      flag: "🇱🇦",
    ),
    Country(
      name: "Latvia",
      code: "LV",
      dialCode: "+371",
      flag: "🇱🇻",
    ),
    Country(
      name: "Lebanon",
      code: "LB",
      dialCode: "+961",
      flag: "🇱🇧",
    ),
    Country(
      name: "Lesotho",
      code: "LS",
      dialCode: "+266",
      flag: "🇱🇸",
    ),
    Country(
      name: "Liberia",
      code: "LR",
      dialCode: "+231",
      flag: "🇱🇷",
    ),
    Country(
      name: "Libya",
      code: "LY",
      dialCode: "+218",
      flag: "🇱🇾",
    ),
    Country(
      name: "Liechtenstein",
      code: "LI",
      dialCode: "+423",
      flag: "🇱🇮",
    ),
    Country(
      name: "Lithuania",
      code: "LT",
      dialCode: "+370",
      flag: "🇱🇹",
    ),
    Country(
      name: "Luxembourg",
      code: "LU",
      dialCode: "+352",
      flag: "🇱🇺",
    ),
    Country(
      name: "Macau",
      code: "MO",
      dialCode: "+853",
      flag: "🇲🇴",
    ),
    Country(
      name: "Macedonia",
      code: "MK",
      dialCode: "+389",
      flag: "🇲🇰",
    ),
    Country(
      name: "Madagascar",
      code: "MG",
      dialCode: "+261",
      flag: "🇲🇬",
    ),
    Country(
      name: "Malawi",
      code: "MW",
      dialCode: "+265",
      flag: "🇲🇼",
    ),
    Country(
      name: "Malaysia",
      code: "MY",
      dialCode: "+60",
      flag: "🇲🇾",
    ),
    Country(
      name: "Maldives",
      code: "MV",
      dialCode: "+960",
      flag: "🇲🇻",
    ),
    Country(
      name: "Mali",
      code: "ML",
      dialCode: "+223",
      flag: "🇲🇱",
    ),
    Country(
      name: "Malta",
      code: "MT",
      dialCode: "+356",
      flag: "🇲🇹",
    ),
    Country(
      name: "Marshall Islands",
      code: "MH",
      dialCode: "+692",
      flag: "🇲🇭",
    ),
    Country(
      name: "Martinique",
      code: "MQ",
      dialCode: "+596",
      flag: "🇲🇶",
    ),
    Country(
      name: "Mauritania",
      code: "MR",
      dialCode: "+222",
      flag: "🇲🇷",
    ),
    Country(
      name: "Mauritius",
      code: "MU",
      dialCode: "+230",
      flag: "🇲🇺",
    ),
    Country(
      name: "Mayotte",
      code: "YT",
      dialCode: "+262",
      flag: "🇾🇹",
    ),
    Country(
      name: "Mexico",
      code: "MX",
      dialCode: "+52",
      flag: "🇲🇽",
    ),
    Country(
      name: "Micronesia",
      code: "FM",
      dialCode: "+691",
      flag: "🇫🇲",
    ),
    Country(
      name: "Moldova",
      code: "MD",
      dialCode: "+373",
      flag: "🇲🇩",
    ),
    Country(
      name: "Monaco",
      code: "MC",
      dialCode: "+377",
      flag: "🇲🇨",
    ),
    Country(
      name: "Mongolia",
      code: "MN",
      dialCode: "+976",
      flag: "🇲🇳",
    ),
    Country(
      name: "Montenegro",
      code: "ME",
      dialCode: "+382",
      flag: "🇲🇪",
    ),
    Country(
      name: "Montserrat",
      code: "MS",
      dialCode: "+1664",
      flag: "🇲🇸",
    ),
    Country(
      name: "Morocco",
      code: "MA",
      dialCode: "+212",
      flag: "🇲🇦",
    ),
    Country(
      name: "Mozambique",
      code: "MZ",
      dialCode: "+258",
      flag: "🇲🇿",
    ),
    Country(
      name: "Myanmar",
      code: "MM",
      dialCode: "+95",
      flag: "🇲🇲",
    ),
    Country(
      name: "Namibia",
      code: "NA",
      dialCode: "+264",
      flag: "🇳🇦",
    ),
    Country(
      name: "Nauru",
      code: "NR",
      dialCode: "+674",
      flag: "🇳🇷",
    ),
    Country(
      name: "Nepal",
      code: "NP",
      dialCode: "+977",
      flag: "🇳🇵",
    ),
    Country(
      name: "Netherlands",
      code: "NL",
      dialCode: "+31",
      flag: "🇳🇱",
    ),
    Country(
      name: "New Caledonia",
      code: "NC",
      dialCode: "+687",
      flag: "🇳🇨",
    ),
    Country(
      name: "New Zealand",
      code: "NZ",
      dialCode: "+64",
      flag: "🇳🇿",
    ),
    Country(
      name: "Nicaragua",
      code: "NI",
      dialCode: "+505",
      flag: "🇳🇮",
    ),
    Country(
      name: "Niger",
      code: "NE",
      dialCode: "+227",
      flag: "🇳🇪",
    ),
    Country(
      name: "Nigeria",
      code: "NG",
      dialCode: "+234",
      flag: "🇳🇬",
    ),
    Country(
      name: "Niue",
      code: "NU",
      dialCode: "+683",
      flag: "🇳🇺",
    ),
    Country(
      name: "Norfolk Island",
      code: "NF",
      dialCode: "+672",
      flag: "🇳🇫",
    ),
    Country(
      name: "North Korea",
      code: "KP",
      dialCode: "+850",
      flag: "🇰🇵",
    ),
    Country(
      name: "Northern Mariana Islands",
      code: "MP",
      dialCode: "+1670",
      flag: "🇲🇵",
    ),
    Country(
      name: "Norway",
      code: "NO",
      dialCode: "+47",
      flag: "🇳🇴",
    ),
    Country(
      name: "Oman",
      code: "OM",
      dialCode: "+968",
      flag: "🇴🇲",
    ),
    Country(
      name: "Pakistan",
      code: "PK",
      dialCode: "+92",
      flag: "🇵🇰",
    ),
    Country(
      name: "Palau",
      code: "PW",
      dialCode: "+680",
      flag: "🇵🇼",
    ),
    Country(
      name: "Palastinian Territories",
      code: "PS",
      dialCode: "+970",
      flag: "🇵🇸",
    ),
    Country(
      name: "Panama",
      code: "PA",
      dialCode: "+507",
      flag: "🇵🇦",
    ),
    Country(
      name: "Papua New Guinea",
      code: "PG",
      dialCode: "+675",
      flag: "🇵🇬",
    ),
    Country(
      name: "Paraguay",
      code: "PY",
      dialCode: "+595",
      flag: "🇵🇾",
    ),
    Country(
      name: "Peru",
      code: "PE",
      dialCode: "+51",
      flag: "🇵🇪",
    ),
    Country(
      name: "Philippines",
      code: "PH",
      dialCode: "+63",
      flag: "🇵🇭",
    ),
    Country(
      name: "Pitcairn Islands",
      code: "PN",
      dialCode: "+64",
      flag: "🇵🇳",
    ),
    Country(
      name: "Poland",
      code: "PL",
      dialCode: "+48",
      flag: "🇵🇱",
    ),
    Country(
      name: "Portugal",
      code: "PT",
      dialCode: "+351",
      flag: "🇵🇹",
    ),
    Country(
      name: "Puerto Rico",
      code: "PR",
      dialCode: "+1787",
      flag: "🇵🇷",
    ),
    Country(
      name: "Puerto Rico",
      code: "PR",
      dialCode: "+1939",
      flag: "🇵🇷",
    ),
    Country(
      name: "Qatar",
      code: "QA",
      dialCode: "+974",
      flag: "🇶🇦",
    ),
    Country(
      name: "Republic of the Congo",
      code: "CG",
      dialCode: "+242",
      flag: "🇨🇬",
    ),
    Country(
      name: "Réunion",
      code: "RE",
      dialCode: "+262",
      flag: "🇷🇪",
    ),
    Country(
      name: "Romania",
      code: "RO",
      dialCode: "+40",
      flag: "🇷🇴",
    ),
    Country(
      name: "Russia",
      code: "RU",
      dialCode: "+7",
      flag: "🇷🇺",
    ),
    Country(
      name: "Rwanda",
      code: "RW",
      dialCode: "+250",
      flag: "🇷🇼",
    ),
    Country(
      name: "Saint Barthélemy",
      code: "BL",
      dialCode: "+590",
      flag: "🇧🇱",
    ),
    Country(
      name: "Saint Helena",
      code: "SH",
      dialCode: "+290",
      flag: "🇸🇭",
    ),
    Country(
      name: "Saint Helena",
      code: "SH",
      dialCode: "+247",
      flag: "🇸🇭",
    ),
    Country(
      name: "Saint Kitts and Nevis",
      code: "KN",
      dialCode: "+1869",
      flag: "🇰🇳",
    ),
    Country(
      name: "Saint Lucia",
      code: "LC",
      dialCode: "+1758",
      flag: "🇱🇨",
    ),
    Country(
      name: "Saint Martin",
      code: "MF",
      dialCode: "+590",
      flag: "🇲🇫",
    ),
    Country(
      name: "Saint Pierre and Miquelon",
      code: "PM",
      dialCode: "+508",
      flag: "🇵🇲",
    ),
    Country(
      name: "Saint Vincent and the Grenadines",
      code: "VC",
      dialCode: "+1784",
      flag: "🇻🇨",
    ),
    Country(
      name: "Samoa",
      code: "WS",
      dialCode: "+685",
      flag: "🇼🇸",
    ),
    Country(
      name: "San Marino",
      code: "SM",
      dialCode: "+378",
      flag: "🇸🇲",
    ),
    Country(
      name: "São Tomé and Príncipe",
      code: "ST",
      dialCode: "+239",
      flag: "🇸🇹",
    ),
    Country(
      name: "Saudi Arabia",
      code: "SA",
      dialCode: "+966",
      flag: "🇸🇦",
    ),
    Country(
      name: "Senegal",
      code: "SN",
      dialCode: "+221",
      flag: "🇸🇳",
    ),
    Country(
      name: "Serbia",
      code: "RS",
      dialCode: "+381",
      flag: "🇷🇸",
    ),
    Country(
      name: "Seychelles",
      code: "SC",
      dialCode: "+248",
      flag: "🇸🇨",
    ),
    Country(
      name: "Sierra Leone",
      code: "SL",
      dialCode: "+232",
      flag: "🇸🇱",
    ),
    Country(
      name: "Singapore",
      code: "SG",
      dialCode: "+65",
      flag: "🇸🇬",
    ),
    Country(
      name: "Sint Maarten",
      code: "SX",
      dialCode: "+1721",
      flag: "🇸🇽",
    ),
    Country(
      name: "Slovakia",
      code: "SK",
      dialCode: "+421",
      flag: "🇸🇰",
    ),
    Country(
      name: "Slovenia",
      code: "SI",
      dialCode: "+386",
      flag: "🇸🇮",
    ),
    Country(
      name: "Solomon Islands",
      code: "SB",
      dialCode: "+677",
      flag: "🇸🇧",
    ),
    Country(
      name: "Somalia",
      code: "SO",
      dialCode: "+252",
      flag: "🇸🇴",
    ),
    Country(
      name: "South Africa",
      code: "ZA",
      dialCode: "+27",
      flag: "🇿🇦",
    ),
    Country(
      name: "South Georgia and the South Sandwich Islands",
      code: "GS",
      dialCode: "+500",
      flag: "🇬🇸",
    ),
    Country(
      name: "South Korea",
      code: "KR",
      dialCode: "+82",
      flag: "🇰🇷",
    ),
    Country(
      name: "South Sudan",
      code: "SS",
      dialCode: "+211",
      flag: "🇸🇸",
    ),
    Country(
      name: "Spain",
      code: "ES",
      dialCode: "+34",
      flag: "🇪🇸",
    ),
    Country(
      name: "Sri Lanka",
      code: "LK",
      dialCode: "+94",
      flag: "🇱🇰",
    ),
    Country(
      name: "Sudan",
      code: "SD",
      dialCode: "+249",
      flag: "🇸🇩",
    ),
    Country(
      name: "Suriname",
      code: "SR",
      dialCode: "+597",
      flag: "🇸🇷",
    ),
    Country(
      name: "Svalbard and Jan Mayen",
      code: "SJ",
      dialCode: "+47",
      flag: "🇸🇯",
    ),
    Country(
      name: "Swaziland",
      code: "SZ",
      dialCode: "+268",
      flag: "🇸🇿",
    ),
    Country(
      name: "Sweden",
      code: "SE",
      dialCode: "+46",
      flag: "🇸🇪",
    ),
    Country(
      name: "Switzerland",
      code: "CH",
      dialCode: "+41",
      flag: "🇨🇭",
    ),
    Country(
      name: "Syria",
      code: "SY",
      dialCode: "+963",
      flag: "🇸🇾",
    ),
    Country(
      name: "Taiwan",
      code: "TW",
      dialCode: "+886",
      flag: "🇹🇼",
    ),
    Country(
      name: "Tajikistan",
      code: "TJ",
      dialCode: "+992",
      flag: "🇹🇯",
    ),
    Country(
      name: "Tanzania",
      code: "TZ",
      dialCode: "+255",
      flag: "🇹🇿",
    ),
    Country(
      name: "Thailand",
      code: "TH",
      dialCode: "+66",
      flag: "🇹🇭",
    ),
    Country(
      name: "Timor-Leste",
      code: "TL",
      dialCode: "+670",
      flag: "🇹🇱",
    ),
    Country(
      name: "Togo",
      code: "TG",
      dialCode: "+228",
      flag: "🇹🇬",
    ),
    Country(
      name: "Tokelau",
      code: "TK",
      dialCode: "+690",
      flag: "🇹🇰",
    ),
    Country(
      name: "Tonga",
      code: "TO",
      dialCode: "+676",
      flag: "🇹🇴",
    ),
    Country(
      name: "Trinidad and Tobago",
      code: "TT",
      dialCode: "+1868",
      flag: "🇹🇹",
    ),
    Country(
      name: "Tunisia",
      code: "TN",
      dialCode: "+216",
      flag: "🇹🇳",
    ),
    Country(
      name: "Turkey",
      code: "TR",
      dialCode: "+90",
      flag: "🇹🇷",
    ),
    Country(
      name: "Turkmenistan",
      code: "TM",
      dialCode: "+993",
      flag: "🇹🇲",
    ),
    Country(
      name: "Turks and Caicos Islands",
      code: "TC",
      dialCode: "+1649",
      flag: "🇹🇨",
    ),
    Country(
      name: "Tuvalu",
      code: "TV",
      dialCode: "+688",
      flag: "🇹🇻",
    ),
    Country(
      name: "Uganda",
      code: "UG",
      dialCode: "+256",
      flag: "🇺🇬",
    ),
    Country(
      name: "Ukraine",
      code: "UA",
      dialCode: "+380",
      flag: "🇺🇦",
    ),
    Country(
      name: "United Arab Emirates",
      code: "AE",
      dialCode: "+971",
      flag: "🇦🇪",
    ),
    Country(
      name: "United Kingdom",
      code: "GB",
      dialCode: "+44",
      flag: "🇬🇧",
    ),
    Country(
      name: "United States",
      code: "US",
      dialCode: "+1",
      flag: "🇺🇸",
    ),
    Country(
      name: "Uruguay",
      code: "UY",
      dialCode: "+598",
      flag: "🇺🇾",
    ),
    Country(
      name: "Uzbekistan",
      code: "UZ",
      dialCode: "+998",
      flag: "🇺🇿",
    ),
    Country(
      name: "Vanuatu",
      code: "VU",
      dialCode: "+678",
      flag: "🇻🇺",
    ),
    Country(
      name: "Venezuela",
      code: "VE",
      dialCode: "+58",
      flag: "🇻🇪",
    ),
    Country(
      name: "Vietnam",
      code: "VN",
      dialCode: "+84",
      flag: "🇻🇳",
    ),
    Country(
      name: "Virgin Islands, British",
      code: "VG",
      dialCode: "+1284",
      flag: "🇻🇬",
    ),
    Country(
      name: "Virgin Islands, U.S.",
      code: "VI",
      dialCode: "+1340",
      flag: "🇻🇮",
    ),
    Country(
      name: "Wallis and Futuna",
      code: "WF",
      dialCode: "+681",
      flag: "🇼🇫",
    ),
    Country(
      name: "Yemen",
      code: "YE",
      dialCode: "+967",
      flag: "🇾🇪",
    ),
    Country(
      name: "Zambia",
      code: "ZM",
      dialCode: "+260",
      flag: "🇿🇲",
    ),
    Country(
      name: "Zimbabwe",
      code: "ZW",
      dialCode: "+263",
      flag: "🇿🇼",
    ),
    Country(
      name: "Åland Islands",
      code: "AX",
      dialCode: "+358",
      flag: "🇦🇽",
    ),
  ];
}
