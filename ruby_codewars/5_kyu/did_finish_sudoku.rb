# https://www.codewars.com/kata/53db96041f1a7d32dc0004d2/train/ruby

# input: array of arrays (9x9 sudoku puzzle)
# output: finished || try again basd on it given board fits with rules
# rules:
#   each row 1-9
#   each column 1-9 
#   each 3x3 region 1-9
#

# A
# rows check:
#   no numbers < 1 or > 9
#   uniq
#   if then size == 9, pass
# column check:
#   assuming all rows pass
#   array from sub[idx] 
#   then same rows check on new array
# region check
#   assuming all columns pass...
#   ...tbd 0..2, 0..2 etc...

def done_or_not(board)
  # rows
  board_v2 = board.map { |el| el.select { |n| n >= 1 && n <= 9}  }.map(&:uniq)
  rows_check = board_v2.select { |sub| sub.size == 9 }
  return 'Try again!' if rows_check.size != 9
  # columns
  columns = {}
  (0..8).each { |n| columns[n] = [] }
  board_v2.each { |sub| sub.each_with_index { |el, idx| columns[idx].push(el) } }
  columns = columns.values.map(&:uniq)
  columns_check = columns.select { |sub| sub.size == 9 }  
  return 'Try again!' if columns_check.size != 9
  # regions
  region_check = []
  row_idx = 0
  loop do
  col_idx = 0
    loop do  
      region_arr = []
      loop do
        row_idx.upto(row_idx+2) do |r|
          col_idx.upto(col_idx+2) do |c|
            region_arr << board_v2[r][c]
          end
        end
        region_check << region_arr
      end
      col_idx += 3
      break if col_idx == board_v2.size
    end
    row_idx += 3
    break if row_idx == board_v2.size
  end
  region_check = region_check.map(&:uniq)
  region_check = region_check.select { |sub| sub.size == 9 }
  region_check.size !=9 ? 'Try again!' : 'Finished!'
end

p done_or_not([[5, 3, 4, 6, 7, 8, 9, 1, 2], 
                         [6, 7, 2, 1, 9, 5, 3, 4, 8],
                         [1, 9, 8, 3, 4, 2, 5, 6, 7],
                         [8, 5, 9, 7, 6, 1, 4, 2, 3],
                         [4, 2, 6, 8, 5, 3, 7, 9, 1],
                         [7, 1, 3, 9, 2, 4, 8, 5, 6],
                         [9, 6, 1, 5, 3, 7, 2, 8, 4],
                         [2, 8, 7, 4, 1, 9, 6, 3, 5],
                         [3, 4, 5, 2, 8, 6, 1, 7, 9]])#, 'Finished!')
                                
p done_or_not([[5, 3, 4, 6, 7, 8, 9, 1, 2], 
                         [6, 7, 2, 1, 9, 0, 3, 4, 9],
                         [1, 0, 0, 3, 4, 2, 5, 6, 0],
                         [8, 5, 9, 7, 6, 1, 0, 2, 0],
                         [4, 2, 6, 8, 5, 3, 7, 9, 1],
                         [7, 1, 3, 9, 2, 4, 8, 5, 6],
                         [9, 0, 1, 5, 3, 7, 2, 1, 4],
                         [2, 8, 7, 4, 1, 9, 6, 3, 5],
                         [3, 0, 0, 4, 8, 1, 1, 7, 9]])#, 'Try again!')
