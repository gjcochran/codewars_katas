# input: array of arrays that represents battleship game field
#   10 arrays of 10 els each
#   only possible els are integers 0 || 1
#   0 ... free cell
#   1 ... cell occupied by ship

# output: boolean -- true if input field is a valid game setup

# rules:
#   each player can have... 
#     1 - battleship -- 4 cells
#     2 - cruisers -- 3 cells
#     3 - destroyers -- 2 cells
#     4 - submarines -- 1 cell
#   each ship can only be a straight line
#   note that each player has their own field
#   ships cannot touch nor overlap

# how to solve:
#   variables for each type of ship that is decremented when find that ship type
#     at the same time, change those values to 2
#
#   field.each
#     sub.each
#       if el == 1
#         does sub[idx+1] == 1 ?
#         or does field[idx+1][idx] == 1 ?
#         if not... this is a submarine


def validate_battlefield(field)
  battleship = 1
  cruiser = 2
  destroyer = 3
  submarine = 4

  field.each_with_index do |line, line_idx|
    line.each_with_index do |cell, cell_idx|
      if line[cell_idx] == 1 && field[line_idx - 1].nil?
        unless (field[line_idx + 1][cell_idx - 1] == 1) || (field[line_idx + 1][cell_idx + 1] == 1)
          if line[cell_idx + 1] == 1
            if line[cell_idx + 2] == 1
              if line[cell_idx + 3] == 1
                battleship -= 1
                line[cell_idx], line[cell_idx + 1], line[cell_idx + 2], line[cell_idx + 3] = 2, 2, 2, 2  
              else
                cruiser -= 1
                line[cell_idx], line[cell_idx + 1], line[cell_idx + 2] = 2, 2, 2
              end
            else
              destroyer -= 1
              line[cell_idx], line[cell_idx + 1] = 2, 2
            end
          elsif field[line_idx + 1] != nil && field[line_idx + 1][cell_idx] == 1
            if field[line_idx + 2] != nil && field[line_idx + 2][cell_idx] == 1
              if field[line_idx + 3] != nil && field[line_idx + 3][cell_idx] == 1
                battleship -= 1
                line[cell_idx], field[line_idx + 1][cell_idx], field[line_idx + 2][cell_idx], field[line_idx + 3][cell_idx] = 2, 2, 2, 2
              else
                cruiser -= 1
                line[cell_idx], field[line_idx + 1][cell_idx], field[line_idx + 2][cell_idx] = 2, 2, 2
              end
            else
              destroyer -= 1
              line[cell_idx], field[line_idx + 1][cell_idx] = 2, 2
            end
          else
            submarine -= 1
            line[cell_idx] = 2
          end 
        else
          next
        end

      elsif line[cell_idx] == 1 && field[line_idx + 1].nil?
        unless (field[line_idx - 1][cell_idx - 1] == 1) || (field[line_idx - 1][cell_idx + 1] == 1)
          if line[cell_idx + 1] == 1
            if line[cell_idx + 2] == 1
              if line[cell_idx + 3] == 1
                battleship -= 1
                line[cell_idx], line[cell_idx + 1], line[cell_idx + 2], line[cell_idx + 3] = 2, 2, 2, 2  
              else
                cruiser -= 1
                line[cell_idx], line[cell_idx + 1], line[cell_idx + 2] = 2, 2, 2
              end
            else
              destroyer -= 1
              line[cell_idx], line[cell_idx + 1] = 2, 2
            end
        elsif field[line_idx + 1] != nil && field[line_idx + 1][cell_idx] == 1
          if field[line_idx + 2] != nil && field[line_idx + 2][cell_idx] == 1
            if field[line_idx + 3] != nil && field[line_idx + 3][cell_idx] == 1
              battleship -= 1
              line[cell_idx], field[line_idx + 1][cell_idx], field[line_idx + 2][cell_idx], field[line_idx + 3][cell_idx] = 2, 2, 2, 2
            else
              cruiser -= 1
              line[cell_idx], field[line_idx + 1][cell_idx], field[line_idx + 2][cell_idx] = 2, 2, 2
            end
          else
            destroyer -= 1
            line[cell_idx], field[line_idx + 1][cell_idx] = 2, 2
          end
        else
          submarine -= 1
          line[cell_idx] = 2
        end 
      else
        next
      end

      elsif line[cell_idx] == 1
        unless (field[line_idx - 1][cell_idx - 1] == 1) || (field[line_idx - 1][cell_idx + 1] == 1) || (field[line_idx + 1][cell_idx - 1] == 1) || (field[line_idx + 1][cell_idx + 1] == 1)
          if line[cell_idx + 1] == 1
            if line[cell_idx + 2] == 1
              if line[cell_idx + 3] == 1
                battleship -= 1
                line[cell_idx], line[cell_idx + 1], line[cell_idx + 2], line[cell_idx + 3] = 2, 2, 2, 2  
              else
                cruiser -= 1
                line[cell_idx], line[cell_idx + 1], line[cell_idx + 2] = 2, 2, 2
              end
            else
              destroyer -= 1
              line[cell_idx], line[cell_idx + 1] = 2, 2
            end
          elsif field[line_idx + 1] != nil && field[line_idx + 1][cell_idx] == 1
            if field[line_idx + 2] != nil && field[line_idx + 2][cell_idx] == 1
              if field[line_idx + 3] != nil && field[line_idx + 3][cell_idx] == 1
                battleship -= 1
                line[cell_idx], field[line_idx + 1][cell_idx], field[line_idx + 2][cell_idx], field[line_idx + 3][cell_idx] = 2, 2, 2, 2
              else
                cruiser -= 1
                line[cell_idx], field[line_idx + 1][cell_idx], field[line_idx + 2][cell_idx] = 2, 2, 2
              end
            else
              destroyer -= 1
              line[cell_idx], field[line_idx + 1][cell_idx] = 2, 2
            end
          else
            submarine -= 1
            line[cell_idx] = 2
          end 
        else
          next
        end
      else
        next
      end
    end
  end
  p battleship, cruiser, destroyer, submarine, field
  battleship.zero? && cruiser.zero? && destroyer.zero? && submarine.zero? ? true : false
end

field =     [[1, 0, 0, 0, 0, 1, 1, 0, 0, 0],
             [1, 0, 1, 0, 0, 0, 0, 0, 1, 0],
             [1, 0, 1, 0, 1, 1, 1, 0, 1, 0],
             [1, 0, 0, 0, 0, 0, 0, 0, 0, 0],
             [0, 0, 0, 0, 0, 0, 0, 0, 1, 0],
             [0, 0, 0, 0, 1, 1, 1, 0, 0, 0],
             [0, 0, 0, 0, 0, 0, 0, 0, 1, 0],
             [0, 0, 0, 1, 0, 0, 0, 0, 0, 0],
             [0, 0, 0, 0, 0, 0, 0, 1, 0, 0],
             [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]]

field2 =    [[1, 1, 0, 1, 0, 0, 1, 1, 1, 1],
             [0, 0, 0, 1, 0, 0, 0, 0, 0, 0],
             [0, 0, 0, 1, 0, 0, 0, 0, 0, 1],
             [0, 0, 0, 0, 0, 0, 0, 0, 0, 1],
             [0, 1, 0, 0, 0, 0, 0, 0, 0, 0],
             [0, 1, 0, 0, 0, 0, 1, 0, 0, 0],
             [0, 1, 0, 0, 0, 0, 0, 0, 0, 0],
             [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
             [0, 0, 0, 1, 0, 1, 0, 0, 1, 0],
             [1, 0, 0, 0, 0, 0, 0, 0, 1, 0]]

p validate_battlefield(field)
p validate_battlefield(field2)

random = [[0, 0, 0, 0, 0, 0, 0, 1, 1, 1],
          [0, 0, 1, 1, 0, 0, 0, 0, 0, 0], 
          [0, 0, 0, 0, 0, 1, 0, 1, 0, 0],
          [1, 1, 1, 1, 0, 0, 0, 1, 0, 0], 
          [0, 0, 0, 0, 0, 0, 0, 0, 0, 1],
          [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 1, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 1, 0, 0, 0, 1, 0],
          [0, 1, 0, 0, 1, 0, 0, 0, 0, 0], 
          [0, 1, 0, 0, 0, 0, 0, 1, 0, 0]]
p validate_battlefield(random)

# i am failing on the random tests where they are expecting true and i am returning false.. and am not sure why!
