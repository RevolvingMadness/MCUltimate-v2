import 'dart:io';

import 'mcfunction.dart';

class Datapack {
  String? folder_name;
  MCFunction load = new MCFunction(name: "load", commands: [], log: false);
  MCFunction tick = new MCFunction(name: "tick", commands: [], log: false);
  List<MCFunction> functions = [];
  String? namespace;

  Datapack(String folder_name, String namespace, MCFunction load,
      MCFunction tick, List<MCFunction> functions) {
    this.folder_name = folder_name;
    this.load = load;
    this.tick = tick;
    this.functions = functions;
    this.namespace = namespace.toLowerCase();
    print("Initalized Datapack class. With namepace: " + namespace);
  }

  String getPackMCMeta() {
    return """{
  "pack": {
    "pack_format": 12,
    "description": "Datapack generated with MCUltimate-v2.0"
  }
}""";
  }

  void init(String location) async {
    String base_dir = location + this.folder_name.toString();
    String namespace_dir = base_dir + "/data/" + this.namespace.toString();
    // String tags_dir = namespace_dir + "/tags";
    String minecraft_dir = base_dir + "/data/minecraft";
    new Directory(base_dir + "/data").deleteSync(recursive: true);
    new Directory(base_dir).createSync();
    await new File(base_dir + "/pack.mcmeta")
        .writeAsString(getPackMCMeta(), mode: FileMode.append);
    new Directory(base_dir + "/data").createSync();
    new Directory(namespace_dir).createSync();
    new Directory(minecraft_dir).createSync();
    new Directory(namespace_dir + "/functions").createSync();
    new Directory(namespace_dir + "/recipes").createSync();
    new Directory(minecraft_dir + "/tags").createSync();
    new Directory(minecraft_dir + "/tags/functions").createSync();
    new File(minecraft_dir + "/tags/functions/tick.json").writeAsString("""{
	"values":
	[
		"${namespace}:${tick.name}"
	]
}""", mode: FileMode.append);
    new File(minecraft_dir + "/tags/functions/load.json").writeAsString("""{
	"values":
	[
		"${namespace}:${load.name}"
	]
}""", mode: FileMode.append);
    load.generate(namespace_dir + "/functions");
    tick.generate(namespace_dir + "/functions");
    for (MCFunction func in functions) {
      func.generate(namespace_dir + "/functions");
    }
  }

  void build({required String location}) {
    if (!location.endsWith("/")) location += '/';
    init(location);
    print("Build Successful!");
  }
}
