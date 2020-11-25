def win_move(i, check)
    $adj = [[2, 4, 5, 3, 7, 9], [1, 3, 5, 8], [2, 5, 6, 1, 7, 9], [1, 5, 7, 6], [1, 2, 3, 4, 6, 7, 8, 9], [3, 5, 9, 4], [4, 5, 8, 1, 3, 9], [5, 7, 9, 2], [5, 6, 8, 1, 3, 7]]
    $adj2 = [[3, 7, 9], [8], [1, 7, 9], [6], [], [4], [1, 3, 9], [ 2], [1, 3, 7]]
    if $adj[i-1].any?(check)
      diff = check - i  
      if $adj2[i-1].any?(check)
        return (i + check) / 2
      elsif diff == 1 
        return check%3 == 0 ? check - 2*diff : check + diff 
      elsif diff.positive? && (check+diff) <= 9 && i!=5
        return check+diff
      elsif diff.positive? 
        return check - 2*diff
      elsif diff == -1
        return check%3 == 1 ? check - 2*diff : check+diff
      elsif diff.negative? && (check+diff) > 0 && i!=5
        return check+diff   
      elsif diff.negative?  
        return check - 2*diff                  
     end 
    else 
      puts "No win move"
    end     
end 

