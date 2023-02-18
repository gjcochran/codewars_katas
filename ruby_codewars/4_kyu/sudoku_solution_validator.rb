def valid_solution(board)
  # validate that each line has only one of 1-9 and no 0s
  board.each do |line|
    temp = line.select do |n|
      line.count(n) == 1 && n != 0 
    end
    temp.size == 9 ? next : (return false)
  end
  # validate that columns only contain one of 1-9
  0.upto(8) do |c|
    val = []
    0.upto(8) do |l|
      val << board[l][c] 
    end 
    val.uniq.size == 9 ? next : (return false)
  end
  # validate that 3x3 boxes only contain one of 1-9
  grid = [[0, 1, 2], [3, 4, 5], [6, 7, 8]]
  3.times do |h|
    temp2 = []
    3.times do |v|
      temp2 << board[grid[h][v]][grid[h][0]]
      temp2 << board[grid[h][v]][grid[h][1]]
      temp2 << board[grid[h][v]][grid[h][2]]
    end
    temp2.uniq.size == 9 ? next : (return false)
  end
  true
end

p valid_solution([
  [5, 3, 4, 6, 7, 8, 9, 1, 2],
  [6, 7, 2, 1, 9, 5, 3, 4, 8],
  [1, 9, 8, 3, 4, 2, 5, 6, 7],
  [8, 5, 9, 7, 6, 1, 4, 2, 3],
  [4, 2, 6, 8, 5, 3, 7, 9, 1],
  [7, 1, 3, 9, 2, 4, 8, 5, 6],
  [9, 6, 1, 5, 3, 7, 2, 8, 4],
  [2, 8, 7, 4, 1, 9, 6, 3, 5],
  [3, 4, 5, 2, 8, 6, 1, 7, 9]
])

p valid_solution([[1, 2, 3, 4, 5, 6, 7, 8, 9], [2, 3, 4, 5, 6, 7, 8, 9, 1], [3, 4, 5, 6, 7, 8, 9, 1, 2], [4, 5, 6, 7, 8, 9, 1, 2, 3], [5, 6, 7, 8, 9, 1, 2, 3, 4], [6, 7, 8, 9, 1, 2, 3, 4, 5], [7, 8, 9, 1, 2, 3, 4, 5, 6], [8, 9, 1, 2, 3, 4, 5, 6, 7], [9, 1, 2, 3, 4, 5, 6, 7, 8]])
