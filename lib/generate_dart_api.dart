#!/usr/bin/env dart
// Copyright (c) 2014 The Polymer Project Authors. All rights reserved.
// This code may only be used under the BSD style license found at http://polymer.github.io/LICENSE.txt
// The complete set of authors may be found at http://polymer.github.io/AUTHORS.txt
// The complete set of contributors may be found at http://polymer.github.io/CONTRIBUTORS.txt
// Code distributed by Google as part of the polymer project is also
// subject to an additional IP rights grant found at http://polymer.github.io/PATENTS.txt

import 'dart:io';
import 'package:path/path.dart' as path;
import 'package:core_elements/src/codegen.dart';
import 'package:core_elements/src/config.dart';
import 'package:core_elements/src/parser.dart';

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

  var config = new GlobalConfig();
  for (var arg in args) {
    if (arg.endsWith('.html')) {
      config.files[arg] = new FileConfig(config);
    } else if (arg.endsWith('.yaml')) {
      _progress('Parsing configuration ... ');
      parseConfigFile(arg, config);
    }
  }

  _progress('Running codegen... ');
  var len = config.files.length;
  int i = 0;
  config.files.forEach((inputPath, fileConfig) {
    _progress('${++i} of $len: $inputPath');
    generateDartApi(inputPath, fileConfig);
  });

  _progress('Generating stubs... ');
  len = config.stubs.length;
  i = 0;
  config.stubs.forEach((inputPath, packageName) {
    _progress('${++i} of $len: $inputPath');
    generateImportStub(inputPath, packageName);
  });

  _progress('Done');
  stdout.write('\n');
}

void generateImportStub(String inputPath, String packageName) {
  var file = new File(inputPath);

  // We assume the file has to be there becuase bower, even though we could
  // generate without
  if (!file.existsSync()) {
    print("error: file $inputPath doesn't exist");
    exit(1);
  }

  var segments = path.split(inputPath);
  var newFileName = segments.last.replaceAll('-', '_');
  var depth = segments.length;
  var goingUp = '../' * depth;
  var newPath = path.join(goingUp, 'packages/$packageName', newFileName);
  file.writeAsStringSync(
      '<link rel="import" href="$newPath">\n'
      '$EMPTY_SCRIPT_WORKAROUND_ISSUE_11');
}

/// Reads the contents of [inputPath], parses the documentation, and then
/// generates a Dart API for it. The input code must be under lib/src/ (for
/// example, lib/src/x-tag/x-tag.html), the output will be generated under lib/
/// (for example, lib/x_tag/x_tag.dart).
void generateDartApi(String inputPath, FileConfig config) {
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
  var outputDir = 'lib';

  var directives = generateDirectives(name,
      info.elements.map((e) => e.extendName), config);
  var classes = info.elements
      .map((i) => generateClass(i, config))
      .join('\n\n');

  new File(path.join(outputDir, '$name.dart'))
      .writeAsStringSync('$directives$classes');

  var extraImports = new StringBuffer();
  for (var jsImport in info.imports) {
    var importPath = jsImport.importPath;
    if (importPath.contains('polymer.html')) continue;
    var omit = config.omitImports;
    if (omit != null && omit.any((path) => importPath.contains(path))) {
      continue;
    }
    var importSegments = path.split(importPath);
    if (importSegments[0] == '..') importSegments.removeRange(0, 2);
    var dartImport = path.joinAll(importSegments).replaceAll('-', '_');
    var targetElement = importSegments.last;
    var packageName = config.global.findPackageNameForElement(targetElement);
    if (packageName != null) {
      dartImport = path.join('..', '..', 'packages', packageName, dartImport);
    }
    extraImports.write('<link rel="import" href="$dartImport">\n');
  }
  new File(path.join(outputDir, '$name.html')).writeAsStringSync(
      '<link rel="import" href="src/$dashName">\n$extraImports'
      '<script type="application/dart" src="$name.dart"></script>\n');
}

int _lastLength = 0;
_progress(String msg) {
  const ESC = '\x1b';
  stdout.write('\r$ESC[32m$msg$ESC[0m');
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

const String EMPTY_SCRIPT_WORKAROUND_ISSUE_11 = '''
<script>
// This empty script is here to workaround issue
// https://github.com/dart-lang/core-elements/issues/11
</script>''';
