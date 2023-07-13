import 'package:flutter/material.dart';
import 'package:flutter_chess_game/models/board.dart';
import 'package:flutter_chess_game/models/cell.dart';
import 'package:flutter_chess_game/ui/cell_widget.dart';

class BoardWidget extends StatelessWidget {
  final Board board;
  final Cell? selectedCell;
  final Set<String> availablePositionsHash;

  const BoardWidget({
    Key? key,
    required this.board,
    required this.selectedCell,
    required this.availablePositionsHash,
  }) : super(key: key);

  List<CellWidget> _buildCells(BuildContext context) {
    final List<CellWidget> cellWidgets = [];

    for (var cellList in board.cells) {
      for (var cell in cellList) {
        cellWidgets.add(CellWidget(
          cell: cell,
          isSelected: selectedCell != null && selectedCell! == cell,
          isAvailable: availablePositionsHash.contains(cell.positionHash),
        ));
      }
    }

    return cellWidgets;
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    final double boardSize = board.cells.length.toDouble();
    final double cellSize = screenWidth / boardSize;

    return Container(

      constraints: BoxConstraints(
        maxWidth: cellSize * boardSize,
        maxHeight: screenHeight * 0.8,
      ),
      child: GridView.count(
        physics: const NeverScrollableScrollPhysics(), // Avoid scrolling
        padding: const EdgeInsets.all(0),
        crossAxisCount: boardSize.toInt(),
        childAspectRatio: 1,
        children: _buildCells(context),
      ),
    );
  }
}
