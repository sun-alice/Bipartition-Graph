def possible_bipartition(dislikes)
  doggos = []
  
  dislikes.length.times do |i|
    if doggos[i].nil?
      doggos[i] = 1
    end
    
    return false if helper(i, doggos, dislikes) == false
  end
  
  return true
end

def helper(i, doggos, dislikes)
  dislikes[i].each do |neighbor|
    if doggos[neighbor].nil?
      doggos[neighbor] = -doggos[i]
      return false if helper(neighbor, doggos, dislikes) == false
    elsif doggos[neighbor] == doggos[i]
      return false
    end
  end
  
  return true
end
