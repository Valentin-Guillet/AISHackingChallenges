
function getNeighbors(board) {
  let neighbors = [];
  const xh = board.rowHole;
  const yh = board.colHole;

  if (xh > 0) {
    let neigh = board.map(row => row.slice());
    neigh[xh][yh] = neigh[xh - 1][yh];
    neigh[xh - 1][yh] = 0;
    neigh.rowHole = xh - 1;
    neigh.colHole = yh;
    neigh.moves = board.moves.concat("U");
    neighbors.push(neigh);
  }
  if (xh < board.length - 1) {
    let neigh = board.map(row => row.slice());
    neigh[xh][yh] = neigh[xh + 1][yh];
    neigh[xh + 1][yh] = 0;
    neigh.rowHole = xh + 1;
    neigh.colHole = yh;
    neigh.moves = board.moves.concat("D");
    neighbors.push(neigh);
  }
  if (yh > 0) {
    let neigh = board.map(row => row.slice());
    neigh[xh][yh] = neigh[xh][yh - 1];
    neigh[xh][yh - 1] = 0;
    neigh.rowHole = xh;
    neigh.colHole = yh - 1;
    neigh.moves = board.moves.concat("L");
    neighbors.push(neigh);
  }
  if (yh < board[0].length - 1) {
    let neigh = board.map(row => row.slice());
    neigh[xh][yh] = neigh[xh][yh + 1];
    neigh[xh][yh + 1] = 0;
    neigh.rowHole = xh;
    neigh.colHole = yh + 1;
    neigh.moves = board.moves.concat("R");
    neighbors.push(neigh);
  }

  return neighbors;
}

function manhattanDist(board) {
  let dist = 0;
  for (let row = 0; row < board.length; row++) {
    for (let col = 0; col < board[0].length; col++) {
      const val = board[row][col];
      if (val <= 0) {
        continue;
      }
      let targetRow = Math.floor((val - 1) / board.length);
      let targetCol = (val - 1) % board[0].length;
      dist += Math.abs(row - targetRow) + Math.abs(col - targetCol);
    }
  }
  return dist;
}

function linearConflictDist(board) {
  let dist = 0;
  for (let row = 0; row < board.length; row++) {
    for (let col = 0; col < board[0].length; col++) {
      const val1 = board[row][col];
      if (val1 <= 0) {
        continue;
      }
      const targetRow1 = Math.floor((val1 - 1) / board.length);
      const targetCol1 = (val1 - 1) % board[0].length;

      if (row == targetRow1) {
        for (let col2 = 0; col2 < board[0].length; col2++) {
          const val2 = board[row][col2];
          if (col >= col2 || board[row][col2] <= 0) {
            continue;
          }
          const targetRow2 = Math.floor((val2 - 1) / board.length);
          const targetCol2 = (val2 - 1) % board[0].length;

          if (targetRow1 == targetRow2 && targetCol1 > targetCol2) {
            dist++;
          }
        }
      }

      if (col == targetCol1) {
        for (let row2 = 0; row2 < board.length; row2++) {
          const val2 = board[row2][col];
          if (row >= row2 || board[row2][col] <= 0) {
            continue;
          }
          const targetRow2 = Math.floor((val2 - 1) / board.length);
          const targetCol2 = (val2 - 1) % board[0].length;

          if (targetCol1 == targetCol2 && targetRow1 > targetRow2) {
            dist++;
          }
        }
      }
    }
  }
  return dist;
}

function computeDist(board) {
  return manhattanDist(board) + 2 * linearConflictDist(board);
}

function hash(board) {
  return board.join(";");
}

function solveAStar(initBoard, goalBoard) {
  initBoard.dist = computeDist(initBoard, goalBoard);
  let boardQueue = [initBoard];
  let seen = new Set();
  seen.add(hash(initBoard));

  const goalHash = hash(goalBoard);

  while (boardQueue.length) {
    let minDist = 1000000;
    let minIndex = 0;
    for (const [idx, board] of boardQueue.entries()) {
      if (board.dist < minDist) {
        minDist = board.dist;
        minIndex = idx;
      }
    }
    let currBoard = boardQueue[minIndex];
    boardQueue.splice(minIndex, 1);
    seen.add(hash(currBoard));

    if (hash(currBoard) === goalHash) {
      return currBoard.moves;
    }

    for (const neigh of getNeighbors(currBoard)) {
      if (seen.has(hash(neigh))) {
        continue;
      }
      neigh.dist = computeDist(neigh, goalBoard);
      boardQueue.push(neigh);
    }
  }

  return [];
}

function isBoardSolvable(board) {
  let flatBoard = board.flat();
  let nbInversions = 0;
  for (let i = 0; i < flatBoard.length - 1; i++) {
    for (let j = i + 1; j < flatBoard.length; j++) {
      if (flatBoard[i] > flatBoard[j]) {
        nbInversions++;
      }
    }
  }
  return (nbInversions % 2 == 0);
}

function generateRandomBoard(m, n) {
  let board = [];
  do {
    board =
      Array.from({ length: m },
        (_, i) => Array.from({ length: n }, (_, j) => i * m + j + 1));
    board[m - 1][n - 1] = 0;
    for (let i = m * n - 1; i > 0; i--) {
      let k = Math.floor(Math.random() * i);
      let xs = Math.floor(k / m);
      let ys = k % n;
      let xt = Math.floor(i / m);
      let yt = i % n;

      [board[xs][ys], board[xt][yt]] = [board[xt][yt], board[xs][ys]];
    }
  } while (!isBoardSolvable(board));
  return board;
}

function mainRandom() {
  // let initBoard = [[1, 2, 3, 4, 5], [6, 7, 8, 9, 10], [11, 12, 13, 14, 15], [16, 17, 18, 19, 20], [21, 22, 23, 0, 24]];
  // let initBoard = [[1, 3, 0], [4, 2, 5], [7, 8, 6]];
  let initBoard = generateRandomBoard(5, 5);
  let found = false;
  for (let row = 0; !found && row < initBoard.length; row++) {
    for (let col = 0; !found && col < initBoard[0].length; col++) {
      if (initBoard[row][col] == 0) {
        initBoard.rowHole = row;
        initBoard.colHole = col;
        found = true;
      }
    }
  }
  initBoard.moves = [];

  const m = initBoard.length;
  const n = initBoard[0].length;

  let goalBoard =
    Array.from({ length: m },
      (_, i) => Array.from({ length: n }, (_, j) => i * m + j + 1));
  goalBoard[m - 1][n - 1] = 0;

  moves = solveAStar(initBoard, goalBoard);
  console.log(initBoard);
  console.log("Moves: ", moves);
}

function main() {
  let initBoard = Tiles_getGameBoard()
  let found = false;
  for (let row = 0; !found && row < initBoard.length; row++) {
    for (let col = 0; !found && col < initBoard[0].length; col++) {
      if (initBoard[row][col] == "X") {
        initBoard.rowHole = row;
        initBoard.colHole = col;
        initBoard[row][col] = 0;
        found = true;
      }
    }
  }
  initBoard.moves = [];

  const m = initBoard.length;
  const n = initBoard[0].length;

  let goalBoard =
    Array.from({ length: m },
      (_, i) => Array.from({ length: n }, (_, j) => i * m + j + 1));
  goalBoard[m - 1][n - 1] = 0;

  moves = solveAStar(initBoard, goalBoard).join();
  Tiles_submit(moves);
}

main()
