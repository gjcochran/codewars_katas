# input: array of arrays, array
#   maze
#   direction
# output: string
# input maze array element options:
#   0 -- safe
#   1 -- wall
#   2 -- start
#   3 -- finish
# input directions array options:
#   "N" -- north, etc %w(N S W E)
# output return string options: 
#   "Finish" if reached finish point
#   "Dead" if hit walls or leave maze
#   "Lost" if can't finish maze in given number of moves
# rule: array of arrays will always be a square maze

def maze_runner(maze, directions)
  col = 0
  row = 0
  maze.each_with_index do |r, ri|
    r.each_with_index do |el, ci|
      if el == 2
        col = ci
        row = ri
      end
    end
  end
  directions.each do |dir|
    case dir
      when 'N' then row -= 1
      when 'S' then row += 1
      when 'E' then col += 1
      when 'W' then col -= 1
    end
    if row > maze.size - 1 || col > maze.size - 1 || row < 0 || col < 0
      return "Dead"
    end
    case maze[row][col]
      when 1 then return "Dead"
      when 3 then return "Finish"
      else
        next
    end
  end
  'Lost'
end

maze = [[1,1,1,1,1,1,1],
        [1,0,0,0,0,0,3],
        [1,0,1,0,1,0,1],
        [0,0,1,0,0,0,1],
        [1,0,1,0,1,0,1],
        [1,0,0,0,0,0,1],
        [1,2,1,0,1,0,1]]

direction = ["N","N","N","N","N","E","E","E","E","E"]

p maze_runner(maze, direction)
