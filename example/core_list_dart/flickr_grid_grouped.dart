export 'package:polymer/init.dart';
import 'package:polymer/polymer.dart';
import 'package:core_elements/core_ajax_dart.dart';
import 'package:core_elements/core_list_dart.dart';
import 'dart:html';
import 'dart:async';
import 'dart:math';
import 'dart:convert';

@CustomTag('list-test')
class ListTest extends PolymerElement {
  final data = new ObservableList();
  final groups = new ObservableList();
  static const API_KEY = 'c304f1096a06486d3c1e7ab271bf7f3f';
  static Random rand = new Random();
  static RegExp responseRegexp = new RegExp('jsonFlickrApi\\((.*)\\)');
  static List COUNTRIES = [
    'Afghanistan',
    'Albania',
    'Algeria',
    'American Samoa',
    'Andorra',
    'Angola',
    'Anguilla',
    'Antarctica',
    'Antigua',
    'Argentina',
    'Armenia',
    'Aruba',
    'Australia',
    'Austria',
    'Azerbaijan',
    'Bahamas',
    'Bahrain',
    'Bangladesh',
    'Barbados',
    'Belarus',
    'Belgium',
    'Belize',
    'Benin',
    'Bermuda',
    'Bhutan',
    'Bolivia',
    'Bosnia and Herzegovina',
    'Botswana',
    'Bouvet Island',
    'Brazil',
    'Brunei Darussalam',
    'Bulgaria',
    'Burkina Faso',
    'Burundi',
    'Cambodia',
    'Cameroon',
    'Canada',
    'Cape Verde',
    'Cayman Islands',
    'Chad',
    'Chile',
    'China',
    'Christmas Island',
    'Colombia',
    'Comoros',
    'Congo',
    'Cook Islands',
    'Costa Rica',
    'Ivory Coast',
    'Croatia',
    'Cuba',
    'Cyprus',
    'Czech Republic',
    'Denmark',
    'Djibouti',
    'Dominica',
    'Dominican Republic',
    'East Timor',
    'Ecuador',
    'Egypt',
    'El Salvador',
    'Equatorial Guinea',
    'Eritrea',
    'Estonia',
    'Ethiopia',
    'Falkland Islands',
    'Faroe Islands',
    'Fiji',
    'Finland',
    'France',
    'France',
    'Metropolitan',
    'French Guiana',
    'French Polynesia',
    'Gabon',
    'Gambia',
    'Georgia',
    'Germany',
    'Ghana',
    'Gibraltar',
    'Greece',
    'Greenland',
    'Grenada',
    'Guadeloupe',
    'Guam',
    'Guatemala',
    'Guinea',
    'Guyana',
    'Haiti',
    'Honduras',
    'Hong Kong',
    'Hungary',
    'Iceland',
    'India',
    'Indonesia',
    'Iran',
    'Iraq',
    'Ireland',
    'Israel',
    'Italy',
    'Jamaica',
    'Japan',
    'Jordan',
    'Kazakhstan',
    'Kenya',
    'Kiribati',
    'North Korea',
    'South Korea',
    'Kuwait',
    'Kyrgyzstan',
    'Laos',
    'Latvia',
    'Lebanon',
    'Lesotho',
    'Liberia',
    'Libya',
    'Liechtenstein',
    'Lithuania',
    'Luxembourg',
    'Macau',
    'Macedonia',
    'Madagascar',
    'Malawi',
    'Malaysia',
    'Maldives',
    'Mali',
    'Malta',
    'Marshall Islands',
    'Martinique',
    'Mauritania',
    'Mauritius',
    'Mayotte',
    'Mexico',
    'Micronesia',
    'Moldova',
    'Monaco',
    'Mongolia',
    'Montserrat',
    'Morocco',
    'Mozambique',
    'Myanmar',
    'Namibia',
    'Nauru',
    'Nepal',
    'Netherlands',
    'New Caledonia',
    'New Zealand',
    'Nicaragua',
    'Niger',
    'Nigeria',
    'Niue',
    'Norfolk Island',
    'Norway',
    'Oman',
    'Pakistan',
    'Palau',
    'Panama',
    'Papua New Guinea',
    'Paraguay',
    'Peru',
    'Philippines',
    'Pitcairn',
    'Poland',
    'Portugal',
    'Puerto Rico',
    'Qatar',
    'Reunion',
    'Romania',
    'Russian Federation',
    'Rwanda',
    'Sandwich Isls.',
    'Saint Lucia',
    'Samoa',
    'San Marino',
    'Saudi Arabia',
    'Senegal',
    'Seychelles',
    'Sierra Leone',
    'Singapore',
    'Slovak Republic',
    'Slovenia',
    'Solomon Islands',
    'Somalia',
    'South Africa',
    'Spain',
    'Sri Lanka',
    'Sudan',
    'Suriname',
    'Swaziland',
    'Sweden',
    'Switzerland',
    'Syria',
    'Taiwan',
    'Tajikistan',
    'Tanzania',
    'Thailand',
    'Togo',
    'Tokelau',
    'Tonga',
    'Trinidad and Tobago',
    'Tunisia',
    'Turkey',
    'Turkmenistan',
    'Tuvalu',
    'Uganda',
    'Ukraine',
    'United Arab Emirates',
    'United Kingdom',
    'United States',
    'Uruguay',
    'Uzbekistan',
    'Vanuatu',
    'Vatican City',
    'Venezuela',
    'Viet Nam',
    'Virgin Islands',
    'Western Sahara',
    'Yemen',
    'Yugoslavia',
    'Zaire',
    'Zambia',
    'Zimbabwe',
  ];

  ListTest.created() : super.created();

  ready() {
    load(4);
  }

  load(int moreCount) {
    if (COUNTRIES.length > 0) {
      var country = COUNTRIES.removeAt(0);
      var ajax = new CoreAjax();
      var count = (50 + rand.nextDouble() * 20).floor();
      ajax.url = 'https://api.flickr.com/services/rest/?method=flickr.photos.'
          'search&api_key=${API_KEY}&safe_search=1&sort=interestingness-desc&'
          'text=${Uri.encodeComponent(country)}&format=json&per_page=$count';
      ajax.on['core-response'].listen((CustomEvent e) {
        var resp =
            JSON.decode(responseRegexp.firstMatch(e.detail['response'])[1]);
        if (resp['stat'] == 'ok') {
          var photos = toObservable(resp['photos']['photo']);
          data.add(photos);
          groups.add(new CoreListGroup(data: {'name': country}));
          // Alternate flat data array with group length specified.
          //  data.addAll(photos);
          //  groups.add(new CoreListGroup(
          //      length: photos.length, data: {'name': country}));
          $['threshold'].clearLower(true);
          if (moreCount > 0) {
            load(--moreCount);
          }
        }
      });
      ajax.go();
    }
  }

  loadMore() {
    load(2);
  }
}
