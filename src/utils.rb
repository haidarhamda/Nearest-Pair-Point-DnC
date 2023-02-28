def printPoint(point)
  i=0
  print "("
  while i<point[0].length()
    print point[0][i]
    if i!=point[0].length-1
      print ","
    end
    i+=1
  end
  print ")"
end

def quickSortPoint(array, low, high)
  if low < high
    partitionIdx = partition(array, low, high)
    quickSortPoint(array, low, partitionIdx-1)
    quickSortPoint(array, partitionIdx+1, high)
  end
  return array
end

def partition(array, low, high)
  pivot = array[high][0][0]
  j = low
  i = low
  while j < high
    if array[j][0][0] <= pivot
      array[j], array[i] = array[i], array[j]
      i += 1
    end
    j += 1
  end
  array[i], array[high] = array[high], array[i]
  return i
end

def getPointById(points,id)
  return points.find{|item| item[1]==id}
end

