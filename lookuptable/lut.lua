--returns a lut centered on middle of image vert
-- {1,12.....0}
-- by reading an image
-- first non transparent pixel on y axis gives value,
-- but 0 value is middle of pic vertically 
-- x gives indexes

createRelativeLut=function(fnap)
  
  tmpID=love.image.newImageData(fnap)
  
  ret={}
  w=tmpID:getWidth()
  h=tmpID:getHeight()
  
  zero=math.floor(h/2)
  
  for i=0,w-1
  do
    --for each column, we iterate until we find a non transparent pixel
    v=zero
    
    for j=0,h-1
    do
      r,g,b,a=tmpID:getPixel(i,j)
      if a>0 then 
        --non transparent, we store index in the lut
        v=j+1 -zero
        break
      end
    end
    table.insert(ret,v)
  end
  return ret
end




--returns a lut
-- {1,12.....0}
-- by reading an image
-- first non transparent pixel on y axis gives value,
-- x gives indexes

createXLut=function(fnap)
  
  tmpID=love.image.newImageData(fnap)
  
  ret={}
  w=tmpID:getWidth()
  h=tmpID:getHeight()
  for i=0,w-1
  do
    --for each column, we iterate until we find a non transparent pixel
    v=0
    
    for j=0,h-1
    do
      r,g,b,a=tmpID:getPixel(i,j)
      if a>0 then 
        --non transparent, we store index in the lut
        v=j+1
        break
      end
    end
    table.insert(ret,v)
  end
  return ret
end

--to test for foot vertical movement
createMirrorXLut=function(fnap)
  
  tmpID=love.image.newImageData(fnap)
  
  ret={}
  w=tmpID:getWidth()
  h=tmpID:getHeight()
  for i=0,w-1
  do
    --for each column, we iterate until we find a non transparent pixel
    v=0
    
    for j=h-1,0,-1
    do
      r,g,b,a=tmpID:getPixel(i,j)
      if a>0 then 
        --non transparent, we store index in the lut
        v=h-1-j
        break
      end
    end
    table.insert(ret,v)
  end
  return ret
end

calcLutTot=function(lut)
  local lutTotal=0
    for i=1,#lut 
    do
      lutTotal=lutTotal+lut[i]
    end
  return lutTotal

end

--scale the lut so that the total of the offsets in the lut is equal to target
fscaleLut = function(lut,tgt)
  local ret={}
  
  local lutTotal=calcLutTot(lut)
  print("init lut total " .. lutTotal )
  ratio=lutTotal/tgt
  
  print("ratio to tgt: "..ratio ) 
  
  --scale each value with ratio
  for i=1,#lut 
  do
    ret[i]=lut[i]/ratio
  end
  
  scLutTotal=calcLutTot(ret)
  print("scaled total "..scLutTotal ) 
  return ret
end

printLut = function(lut)
  
  tp=""
  for i=1,#lut
  do
    tp=tp..lut[i]..","
  end
  print(tp)
  
end