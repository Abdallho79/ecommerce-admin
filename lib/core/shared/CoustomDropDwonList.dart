import 'package:drop_down_list/drop_down_list.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';

class CoustomDropDwonSearch extends StatefulWidget {
  final String? title;
  final List<SelectedListItem>? listdata;
  final TextEditingController? dropdwonSelectedNameCon;
  final TextEditingController? dropdwonSelectedIdCon;
  const CoustomDropDwonSearch(
      {super.key,
      required this.title,
      required this.listdata,
      required this.dropdwonSelectedNameCon,
      required this.dropdwonSelectedIdCon});

  @override
  State<CoustomDropDwonSearch> createState() => _CoustomDropDwonSearchState();
}

class _CoustomDropDwonSearchState extends State<CoustomDropDwonSearch> {
  void showDropDwonList(context) {
    DropDownState(
      DropDown(
        isDismissible: true,
        bottomSheetTitle: Text(
          widget.title!,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
        submitButtonChild: const Text(
          'Done',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        clearButtonChild: const Text(
          'Clear',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        data: widget.listdata ?? [],
        selectedItems: (List<dynamic> selectedList) {
          SelectedListItem selectedListItem = selectedList[0];
          widget.dropdwonSelectedNameCon!.text = selectedListItem.name;
          widget.dropdwonSelectedIdCon!.text = selectedListItem.value!;
          print("===================================");
          print(selectedListItem.name);
          print(selectedListItem.value);
          print("===================================");
          // print(selectedList.indexed);
          // List<String> list = [];
          // for (var item in selectedList) {
          //   if (item is SelectedListItem) {
          //     list.add(item.name);
          //   }
          // }
          // showSnackBar(list.toString());
        },
        // enableMultipleSelection: true,
      ),
    ).showModal(context);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        FocusScope.of(context).unfocus();
        showDropDwonList(context);
      },
      child: TextFormField(
          enabled: false,
          controller: widget.dropdwonSelectedNameCon,
          cursorColor: Colors.black,
          decoration: InputDecoration(
            hintText: widget.dropdwonSelectedNameCon!.text == ""
                ? widget.title
                : widget.dropdwonSelectedNameCon!.text,
            hintStyle: const TextStyle(
                fontSize: 14,
                color: Color.fromARGB(255, 24, 24, 24),
                fontWeight: FontWeight.normal),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
            suffixIcon: const Icon(Icons.arrow_drop_down),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.blue, 
                width: 2.0, 
              ),
              borderRadius: BorderRadius.circular(30),
            ),
          )),
    );
  }
}
