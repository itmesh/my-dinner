import 'dart:convert';
import 'dart:io';

dynamic jsonFixture(String name) =>
    json.decode(File('assets/demo/$name').readAsStringSync());
