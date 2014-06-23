// Copyright (c) 2014 The Polymer Project Authors. All rights reserved.
// This code may only be used under the BSD style license found at http://polymer.github.io/LICENSE.txt
// The complete set of authors may be found at http://polymer.github.io/AUTHORS.txt
// The complete set of contributors may be found at http://polymer.github.io/CONTRIBUTORS.txt
// Code distributed by Google as part of the polymer project is also
// subject to an additional IP rights grant found at http://polymer.github.io/PATENTS.txt

/// Helper to parse code generation configurations from a file.
library core_elements.src.config;

import 'dart:io';
import 'package:yaml/yaml.dart';

/// Configuration information corresponding to a given HTML input file.
class FileConfig {
  final Map<String, String> nameSubstitutions;
  final List<String> omitImports;

  FileConfig([Map map])
    : nameSubstitutions = map != null ? map['name_substitutions'] : null,
      omitImports = map != null ? map['omit_imports'] : null;
}

/// Parse configurations from a `.yaml` configuration file.
void parseConfigFile(String filePath, Map<String, FileConfig> result) {
  if (!new File(filePath).existsSync()) {
    print("error: file $filePath doesn't exist");
    exit(1);
  }
  var yaml = loadYaml(new File(filePath).readAsStringSync());
  var toGenerate = yaml['files_to_generate'];

  if (toGenerate == null) return;
  for (var entry in toGenerate) {
    if (entry is String) {
      result['lib/src/$entry'] = new FileConfig();
      continue;
    }

    if (entry is! YamlMap) continue;
    if (entry.length != 1) {
      print('invalid format for: $entry');
      continue;
    }

    result['lib/src/${entry.keys.single}'] =
        new FileConfig(entry.values.single);
  }
}
