import 'package:tic_tac_toe/core/constants.dart';
import 'package:tic_tac_toe/core/winner_rules.dart';
import 'package:tic_tac_toe/enums/player_type.dart';
import 'package:tic_tac_toe/enums/winner_type.dart';
import 'package:tic_tac_toe/models/board_tile.dart';

class GameController {

  List<BoardTile> tiles = [];
  List<int> movesPlayer1 = [];
  List<int> movesPlayer2 = [];
  late PlayerType currentPlayer;
  bool isSinglePlayer = false;

  bool get hasMoves => (movesPlayer1.length + movesPlayer2.length) != BOARD_SIZE;

  GameController() {
    _initialize();
  }

  void _initialize() {
    movesPlayer1.clear();
    movesPlayer2.clear();
    currentPlayer = PlayerType.PLAYER1;
    isSinglePlayer = false;
    tiles = List<BoardTile>.generate(BOARD_SIZE, (index) => BoardTile(index + 1));
  }

  void reset() {
    _initialize();
  }

  void markBoardTileByIndex(index) {
    final tile = tiles[index];
    if (currentPlayer == PlayerType.PLAYER1) {
      _markBoardTileWithPlayer1(tile);
    } else {
      _markBoardTileWithPlayer2(tile);
    }
  }

  void _markBoardTileWithPlayer1(BoardTile tile) {
    tile.symbol = PLAYER1_SYMBOL;
    tile.color = PLAYER1_COLOR;
    movesPlayer1.add(tile.id);
    currentPlayer = PlayerType.PLAYER2;
  }

  void _markBoardTileWithPlayer2(BoardTile tile) {
    tile.symbol = PLAYER2_SYMBOL;
    tile.color = PLAYER2_COLOR;
    movesPlayer2.add(tile.id);
    currentPlayer = PlayerType.PLAYER1;
  }

  bool _checkPlayerWinner(List<int> moves) {
    return winnerRules.any((rule) =>
      moves.contains(rule[0]) && moves.contains(rule[1]) && moves.contains(rule[2])
    );
  }

  WinnerType checkWinner() {
    if (_checkPlayerWinner(movesPlayer1)) return WinnerType.PLAYER1;
    if (_checkPlayerWinner(movesPlayer2)) return WinnerType.PLAYER2;
    return WinnerType.NONE;
  }

}