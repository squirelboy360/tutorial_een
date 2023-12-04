import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';



class Tutorial extends StatelessWidget {
  const Tutorial({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = ScrollController();
    return PlatformScaffold(
        backgroundColor: Colors.amber,
        appBar: PlatformAppBar(
          title: const Text("Understand Bloc. It's Easy"),
          leading: PlatformIconButton(
            onPressed: () {
              showAdaptiveDialog(
                  context: context,
                  builder: (coontext) {
                    return const AddItemDialog();
                  });
            },
            icon: const Icon(Icons.add),
          ),
        ),
        body: LayoutBuilder(builder: (context, screenSize) {
          if (screenSize.maxWidth <= 480) {
            return SmallScreenUIElement(controller: controller);
          } else {
            return LargeScreenUIElements(controller: controller);
          }
        }));
  }
}

class LargeScreenUIElements extends StatelessWidget {
  final ScrollController controller;
  const LargeScreenUIElements({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 5),
        controller: controller,
        itemBuilder: (context, index) {
          return MainElement(index: index);
        });
  }
}

class SmallScreenUIElement extends StatelessWidget {
  final ScrollController controller;
  const SmallScreenUIElement({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        controller: controller,
        itemBuilder: (context, index) {
          return MainElement(index: index);
        });
  }
}

class MainElement extends StatelessWidget {
  final int index;
  const MainElement({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 5),
              borderRadius: BorderRadius.circular(20),
              color: Color.fromRGBO(1 * index, 2 * index, 3 * index, 1)),
          child: PlatformListTile(title: Text(index.toString())),
        ),
      ),
    );
  }
}

class AddItemDialog extends StatelessWidget {
  const AddItemDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController(text: "You added nothing");
    return PlatformAlertDialog(
      title: const Text("Add your item"),
      content: Column(
        children: [
          PlatformTextField(
            controller: textController,
          ),
          PlatformTextButton(
            child: const Text("Add"),
            onPressed: () {
              Navigator.pop(context);
              //call bloc add method
            },
          )
        ],
      ),
    );
  }
}
