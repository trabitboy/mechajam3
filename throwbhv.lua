

function initThrow(go)
        go.x=ply.x
        go.y=ply.y
        go.vx=ply.lx 
        go.vy=ply.ly
        go.dx=ply.x+ply.lx
        go.dy=ply.y+ply.ly
        go.bhv=throwBhv
        go.trackMe=nil
        --TODO silly 
      return true
end

throwInc=0.05

function throwBhv(s)
  s.x=s.x+s.vx*throwInc
  s.y=s.y+s.vy*throwInc
  
--  if we collide on map element or go on next move, we stop> act collision on receiver
  if between(s.x,s.dx-throwInc,s.dx+throwInc) 
    and between(s.y,s.dy-throwInc,s.dy+throwInc) then
    
    s.x=s.dx
    s.y=s.dy
    --TODO here test about next tile to move to
    tx=s.x+s.vx
    ty=s.y+s.vy
    if checkMoveBoundaries(tx,ty) 
      and walkability(tx,ty)==true 
      and getGo(tx,ty)==nil 
      and curLvl.map[(s.y-1)*curLvl.mw+s.x]~=3 --because if the case we are on dropzone, we stop
      then
      
      s.dx=s.x+s.vx
      s.dy=s.y+s.vy
      addMsg(' walkable,going for '..s.dx..' '..s.dy)
    else
      s.rx=0
      s.ry=0
      s.z=4
      addMsg('dbg > dest reached')
  --    s.trackMe=nil
      s.bhv=bhvCrate
    end
  end
  
  s.rx=s.rx+0.1
  s.ry=s.ry+0.1
end