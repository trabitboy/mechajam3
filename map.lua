
--check if you can move 1 step without going out of map
function checkMoveBoundaries(px,py)
  if px==0 or py ==0 or px==curLvl.mw+1
    or py== curLvl.mh+1 then
    return false
  end
  
  return true
end 

--check if walkable (floor tile)
function walkability(tx,ty)
--  getGo(tx,ty)
  tnum=curLvl.map[ty*curLvl.mw+tx]
  addMsg("walkability "..tnum)
  if tnum==1 then
      return true
  else 
    return false
  end
  
end