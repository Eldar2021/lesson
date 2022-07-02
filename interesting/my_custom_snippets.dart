/*
{
    "widgetTest": {
        "prefix": "widgettest",
        "body": [
            "testWidgets(",
            "\t'desrp$1',",
            "\t(tester) async {",
            "",
            "\t},",
            ");"
        ]
    },
    "blocTest": {
        "prefix": "cubittest",
        "body": [
            "blocTest<bloc$1, state$2>(",
            "\t'initial state',",
            "\tbuild: () => cubit,",
            ");"
        ]
    },
    "screenLess": {
        "prefix": "screenLess",
        "body": [
            "import 'package:flutter/material.dart';",
            "",
            "class $1View extends StatelessWidget {",
            "\tconst $1View({super.key});",
            "",
            "\t@override",
            "\tWidget build(BuildContext context) {",
            "\t\treturn Scaffold(",
            "\t\t\tappBar: AppBar(",
            "\t\t\t\ttitle: const Text('$1View'),",
            "\t\t\t),",
            "\t\t\tbody: const Center(",
            "\t\t\t\tchild: Text('$1View'),",
            "\t\t\t),",
            "\t\t);",
            "\t}",
            "}",
            ""
        ]
    },
    "blocPage": {
        "prefix": "blocPage",
        "body": [
            "import 'package:flutter/material.dart';",
            "import 'package:flutter_bloc/flutter_bloc.dart';",
            "",
            "class $1Page extends StatelessWidget {",
            "\tconst $1Page({super.key});",
            "",
            "\t@override",
            "\tWidget build(BuildContext context) {",
            "\t\treturn BlocProvider(",
            "\t\t\tcreate: (context) => $1Bloc(),",
            "\t\t\tchild: const $1Screen(),",
            "\t\t);",
            "\t}",
            "}",
            ""
        ]
    },
    "listViewBilder": {
        "prefix": "listViewBilder",
        "body": [
            "ListView.builder(",
            "\titemCount: 10,",
            "\titemBuilder: (context, index) {",
            "\t\treturn Text('$index');",
            "\t},",
            ")",
        ]
    },
    "lazysingleton": {
        "prefix": "lazysingleton",
        "body": [
            "class $1 {",
            "\tstatic $1? _instance;",
            "\tstatic $1 get instance {",
            "\t\t_instance ??= $1._init();",
            "\t\treturn _instance!;",
            "\t}",
            "",
            "\t$1._init();",
            "}",
        ]
    }
}
*/
