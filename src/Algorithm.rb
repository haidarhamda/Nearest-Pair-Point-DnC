class EuclidCounter
  @@count=0
  def initialize
    @@count+=1
  end
  def getCount
    return @@count
  end
  def setToZero
    @@count=0
  end
end

def calculateDistance(p1,p2)
  i=0
  temp=[]
  while i<p1.length()
    temp.append((p1[i]-p2[i])**2)
    i+=1
  end
  p=EuclidCounter.new()
  return Math.sqrt(temp.sum)
end

def getPointInside(midPoint,points,delta)
  pointsInside = []
  i=0
  while i<points.length()
    if points[i][0][0]<midPoint+delta && points[i][0][0]>midPoint-delta
      pointsInside.append(points[i])
    end
    i+=1
  end
  return pointsInside
end

def getPointById(points,id)
  i=0
  while i<points.length()
    if points[i][1]==id
      return points[i]
    end
    i+=1
  end
end

def bruteForce(points)
  min=[9999999,-1,-1]
  i =0
  while i<points.length()
    j=i+1
    while j<points.length()
      d=calculateDistance(points[i][0],points[j][0])
      if d<min[0]
        min=[d,points[i][1],points[j][1]]
      end
      j+=1
    end
    i+=1
  end
  return min
end

def divideNConquer(points)
  if points.length()<=3
    return bruteForce(points)
  else
    rightPoints=points.slice(0,points.length/2)
    leftPoints=points.slice(points.length/2,points.length())
    rightPairs=divideNConquer(rightPoints)
    leftPairs=divideNConquer(leftPoints)
    if leftPairs[0]<rightPairs[0]
      closest=leftPairs
    else
      closest=rightPairs
    end
    pointsInside=getPointInside(points[points.length/2][0][0],points,closest[0])
    if !pointsInside.empty?
      insidePairs=bruteForce(pointsInside)
      if insidePairs[0]<closest[0]
        return insidePairs
      else
        return closest
      end
    else
      return closest
    end
  end
end

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