import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:spannable_grid/spannable_grid.dart';

import 'spannable_grid_cell_data.dart';

class SpannableGridEmptyCellView extends StatefulWidget {
  SpannableGridEmptyCellView({
    Key? key,
    required this.data,
    required this.style,
    required this.onWillAccept,
    required this.onAccept,
    this.content,
    this.isEditing = false,
  }) : super(key: key);


  final SpannableGridCellData data;

  final SpannableGridStyle style;

  final Function(SpannableGridCellData data) onWillAccept;

  final Function(SpannableGridCellData data) onAccept;

  final Widget? content;

  final bool isEditing;
  @override
  _SpannableGridEmptyCellViewState createState() => _SpannableGridEmptyCellViewState();
}


class _SpannableGridEmptyCellViewState extends State<SpannableGridEmptyCellView>{



  bool cellEditing = false;

  @override
  Widget build(BuildContext context) {
    final emptyCellView = widget.content ??
        InkWell(
          onTap: (){
            print("单价。。。。。。。${widget.data.id }");
            setState(() {
              cellEditing = !cellEditing;
            });
            //cellEditing =
          },
          child: cellEditing?Container(child: Icon(Icons.add,color: Colors.grey,),decoration: BoxDecoration(
            border: Border(
              left: BorderSide(
                width: 0.1,//宽度
                color: Colors.blue, //边框颜色
              ),bottom: BorderSide(
              width: 0.1,//宽度
              color: Colors.blue, //边框颜色
            ),
            ),
          ),):Container(
              decoration: BoxDecoration(
                border: Border(
                  left: BorderSide(
                    width: 0.1,//宽度
                    color: Colors.blue, //边框颜色
                  ),bottom: BorderSide(
                    width: 0.1,//宽度
                    color: Colors.blue, //边框颜色
                  ),
                ),
              ),

          ),
          //child: cellEditing?Container(color: Colors.red,):Container(color: Colors.green,),
        );
    return widget.isEditing
        ? DragTarget<SpannableGridCellData>(
      builder: (context, List<SpannableGridCellData?> candidateData,
          rejectedData) {
        return emptyCellView;
      },
      onWillAccept: (data) => widget.onWillAccept(data!),
      onAccept: (data) => widget.onAccept(data),
    )
        : emptyCellView;
  }


}