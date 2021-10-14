import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:tic_tac_toe/controller/game_controller.dart';
import 'package:tic_tac_toe/core/constants.dart';
import 'package:tic_tac_toe/enums/winner_type.dart';
import 'package:tic_tac_toe/widgets/custom_dialog.dart';

class GamePage extends StatefulWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  final _controller = GameController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
      backgroundColor: Colors.blueGrey.shade900,
    );
  }

  _buildAppBar() {
    return AppBar(
      title: const Text(GAME_TITLE),
    );
  }

  _buildBody() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildBoard(),
        // _buildPlayerMode(),
        _buildResetButton(),
      ],
    );
  }

  _buildBoard() {
    return Expanded(
      child: GridView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: BOARD_SIZE,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, mainAxisSpacing: 10, crossAxisSpacing: 10),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () => _onMarkTile(index),
            child: Container(
              color: _controller.tiles[index].color,
              child: Center(
                child: Text(
                  _controller.tiles[index].symbol,
                  style: const TextStyle(fontSize: 70.0, color: Colors.white,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

 /* _buildPlayerMode() {

  }*/

  _buildResetButton() {
    return ElevatedButton(
      onPressed: _onResetGame,
      child: Text(RESET_BUTTON),
    );
  }

  _onMarkTile(int index) {
    if (!_controller.tiles[index].enable) return;

    setState(() {
      _controller.markBoardTileByIndex(index);
    });

    _checkWinner();
  }

  _checkWinner() {
    var winner = _controller.checkWinner();
    if (winner == WinnerType.NONE) {
      if (!_controller.hasMoves) {
        _showTiedDialog();
      }
    } else {
      var symbol =
      winner == WinnerType.PLAYER1 ? PLAYER1_SYMBOL : PLAYER2_SYMBOL;
      _showWinnerDialog(symbol);
    }
  }

  _showTiedDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return CustomDialog(
          title: GAME_TIED,
          message: DIALOG_MESSAGE,
          onPressed: _onResetGame,
        );
      },
      barrierDismissible: false,
    );
  }

  _showWinnerDialog(String symbol) {
    showDialog(
      context: context,
      builder: (context) {
        return CustomDialog(
          title: WIN_TITLE.replaceAll('#symbol#', symbol),
          message: DIALOG_MESSAGE,
          onPressed: _onResetGame,
        );
      },
      barrierDismissible: false,
    );
  }

  _onResetGame() {
    setState(() {
      _controller.reset();
    });
  }
}
