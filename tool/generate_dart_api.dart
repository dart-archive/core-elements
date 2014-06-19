#!/usr/bin/env dart
// Copyright (c) 2014 The Polymer Project Authors. All rights reserved.
// This code may only be used under the BSD style license found at http://polymer.github.io/LICENSE.txt
// The complete set of authors may be found at http://polymer.github.io/AUTHORS.txt
// The complete set of contributors may be found at http://polymer.github.io/CONTRIBUTORS.txt
// Code distributed by Google as part of the polymer project is also
// subject to an additional IP rights grant found at http://polymer.github.io/PATENTS.txt

import 'dart:io';
import 'package:path/path.dart' as path;
import 'package:core_elements/src/parser.dart';
import 'package:core_elements/src/codegen.dart';
import 'package:yaml/yaml.dart';

bool verbose = false;

main(args) {
  if (args.length == 0) {
    final program = 'tool/generate_dart_api';
    print('usage: call generate_dart_api with either input files '
        'or a configuration file that describes input files and name '
        'substitutions. For example: ');
    print('    $program lib/src/x-a/x-a.html lib/src/x-b/x-c.html ...');
    print('    $program config.yaml');
    print('    $program config.yaml lib/src/x-a/x-a.html config2.yaml');
    exit(1);
  }

  var inputPaths = [];
  var nameSubstitutions = {};
  for (var arg in args) {
    if (arg.endsWith('.html')) {
      inputPaths.add(arg);
    } else if (arg.endsWith('.yaml')) {
      _progress('Parsing configuration ... ');
      _parseConfigFile(arg, inputPaths, nameSubstitutions);
    }
  }

  _progress('Running codegen... ');
  var len = inputPaths.length;
  for (int i = 0; i < len; i++) {
    _progress('${i + 1} of $len: ${inputPaths[i]}');
    generateDartApi(inputPaths[i], nameSubstitutions[inputPaths[i]]);
  }
  _progress('Done');
  stdout.write('\n');
}

void _parseConfigFile(String filePath, List<String> inputPaths,
    Map<String, Map<String, String>> nameSubstitutions) {
  if (!new File(filePath).existsSync()) {
    print("error: file $filePath doesn't exist");
    exit(1);
  }
  var yaml = loadYaml(new File(filePath).readAsStringSync());
  var toGenerate = yaml['files_to_generate'];
  if (toGenerate == null) return;
  for (var entry in toGenerate) {
    if (entry is String) {
      inputPaths.add('lib/src/$entry');
      continue;
    }

    if (entry is! YamlMap) continue;
    if (entry.length != 1) {
      print('invalid format for: $entry');
      continue;
    }

    var name = entry.keys.single;
    var inputPath = 'lib/src/$name';
    inputPaths.add(inputPath);
    var map = entry[name];
    if (map != null) {
      nameSubstitutions[inputPath] = map['name_substitutions'];
    }
  }
}

/// Reads the contents of [inputPath], parses the documentation, and then
/// generates a Dart API for it. The input code must be under lib/src/ (for
/// example, lib/src/x-tag/x-tag.html), the output will be generated under lib/
/// (for example, lib/x_tag/x_tag.dart).
void generateDartApi(String inputPath, Map<String, String> nameSubstitutions) {
  _progressLineBroken = false;
  if (!new File(inputPath).existsSync()) {
    print("error: file $inputPath doesn't exist");
    exit(1);
  }
  var segments = path.split(inputPath);
  if (segments.length != 4 || segments[0] != 'lib' || segments[1] != 'src'
      || !segments[3].endsWith('.html')) {
    print('error: expected $inputPath to be of the form '
        'lib/src/x-tag/x-tag2.html');
    exit(1);
  }
  var text = new File(inputPath).readAsStringSync();
  var info = parsePolymerElements(text,
      onWarning: (s) => _showMessage('warning: $s'));
  _showMessage('$info');

  var dashName = path.join(segments[2], segments[3]);
  var name = path.withoutExtension(segments[3]).replaceAll('-', '_');
  var dirName = segments[2].replaceAll('-', '_');
  var outputDir = path.join('lib', dirName);
  if (!new Directory(outputDir).existsSync()) {
    new Directory(outputDir).createSync();
  }

  if (info.length > 1) {
    _showMessage('warning: more than one info in $inputPath');
  }
  new File(path.join(outputDir, '$name.dart')).writeAsStringSync(
      info.map((i) => generateClass(i, nameSubstitutions)).join('\n\n'));
  new File(path.join(outputDir, '$name.html')).writeAsStringSync(
      '<link rel="import" href="../src/$dashName">\n'
      '<script type="application/dart" src="$name.dart"></script>\n');
}

int _lastLength = 0;
_progress(String msg) {
  stdout.write('\r[32m$msg[0m');
  var len = msg.length;
  if (len < _lastLength && !verbose) {
    stdout.write(' ' * (_lastLength - len));
  }
  _lastLength = len;
}

bool _progressLineBroken = false;
_showMessage(String msg) {
  if (!verbose) return;
  if (!_progressLineBroken) {
    _progressLineBroken = true;
    stdout.write('\n');
  }
  print(msg);
}
