import 'package:http/http.dart' as http;
import 'package:packages/classes/ReqResResponse.dart' as reqres;
import 'package:packages/classes/Country.dart' as country;

void getReqResResponse_service() {
  final url = 'https://reqres.in/api/users?page=2';

  http.get(url).then((res) {
    final body = reqres.reqResResponseFromJson(res.body);

    print('page: ${body.page}');
    print('per_page: ${body.perPage}');
    print('Third element id: ${body.data[2].id}');
  });
}

void getCountry_service() {
  final url = 'https://restcountries.eu/rest/v2/alpha/col';

  http.get(url).then((res) {
    final body = country.countryFromJson(res.body);

    print('País: ${body.name}');
    print('Población: ${body.population}');
    print('Fronteras:');

    for (var border in body.borders) {
      print('   $border');
    }

    print('Lenguajes:');

    for (var language in body.languages) {
      print('   ${language.name}');
    }

    print('Latitud: ${body.latlng[0]}');
    print('Longitud: ${body.latlng[1]}');

    print('Monedas:');

    print('${body.currencies[0].name}');

    print('Bandera: ${body.flag}');
  })
  .catchError((error) => print(error));
}
