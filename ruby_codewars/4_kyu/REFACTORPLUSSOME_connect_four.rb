# thought -- hash with columns array for the values
# note that my solution below works but will need to be refactored
# as it currently does not account for who got to 4 in a row first
# and there are tests on codewars which have both red and yellow achieve
# 4 in a row, so need to refactor such that program returns color who does it first

def who_is_winner(pieces_position_list)
  board = {}
  ('A'..'G').each { |l| board[l] = [] }
  # build board first
  pieces_position_list.each do |str|
    dir = str.split('_')
    board[dir[0]] << dir[1]
  end
  board = board.values
  # test across
  board[0..3].each_with_index do |c, ci|
    c.each_with_index do |r, ri|
      if r == board[ci+1][ri] && r == board[ci+2][ri] && r == board[ci+3][ri] 
        return r
      else
        next
      end
    end
  end
  # test down
  board.each_with_index do |c, ci|
    c[0..2].each_with_index do |r, ri|
      if r == board[ci][ri+1] && r == board[ci][ri+2] && r == board[ci][ri+3]
        return r
      else
        next
      end
    end
  end
  # test diag up
  board[0..3].each_with_index do |c, ci|
    c[3..5].each_with_index do |r, ri|
      if r == board[ci+1][ri-1] && r == board[ci+2][ri-2] && r == board[ci+3][ri-3]
        return r
      else
        next
      end
    end
  end
  # test diag down
  board[0..3].each_with_index do |c, ci|
    c[0..2].each_with_index do |r, ri|
      if r == board[ci+1][ri+1] && r == board[ci+2][ri+2] && r == board[ci+3][ri+3]
        return r
      else
        next
      end
    end
  end
  "Draw"
end

p who_is_winner([ "C_Yellow",
  "E_Red",
  "G_Yellow",
  "B_Red",
  "D_Yellow",
  "B_Red",
  "B_Yellow",
  "G_Red",
  "C_Yellow",
  "C_Red",
  "D_Yellow",
  "F_Red",
  "E_Yellow",
  "A_Red",
  "A_Yellow",
  "G_Red",
  "A_Yellow",
  "F_Red",
  "F_Yellow",
  "D_Red",
  "B_Yellow",
  "E_Red",
  "D_Yellow",
  "A_Red",
  "G_Yellow",
  "D_Red",
  "D_Yellow",
  "C_Red"])

p who_is_winner([ "C_Yellow",
  "E_Yellow",
  "G_Yellow",
  "B_Red",
  "D_Yellow",
  "B_Yellow",
  "B_Yellow",
  "G_Red",
  "C_Yellow",
  "C_Red",
  "D_Yellow",
  "F_Red",
  "E_Yellow",
  "A_Red",
  "A_Yellow",
  "G_Red",
  "A_Yellow",
  "F_Red",
  "F_Yellow",
  "D_Red",
  "B_Yellow",
  "E_Red",
  "D_Yellow",
  "A_Red",
  "G_Yellow",
  "D_Red",
  "D_Yellow",
  "C_Red"])

p who_is_winner([ "C_Yellow",
  "E_Red",
  "G_Yellow",
  "B_Red",
  "D_Yellow",
  "B_Red",
  "B_Yellow",
  "G_Red",
  "C_Yellow",
  "C_Yellow",
  "D_Yellow",
  "F_Red",
  "E_Yellow",
  "A_Red",
  "A_Yellow",
  "G_Red",
  "A_Yellow",
  "F_Red",
  "F_Yellow",
  "D_Red",
  "B_Yellow",
  "E_Red",
  "D_Yellow",
  "A_Red",
  "G_Yellow",
  "D_Red",
  "D_Yellow",
  "C_Yellow"])


