

function initThrow(go)
        go.vx=ply.lx 
        go.vy=ply.ly
        go.dx=ply.x+ply.lx
        go.dy=ply.y+ply.ly
        go.bhv=throwBhv

end

throwInc=0.01

function throwBhv(s)
  --TODO stupid non grid impl
  s.x=s.x+s.vx*throwInc
  s.y=s.y+s.vy*throwInc
  
--  if we collide on map element or go on next move, we stop> act collision on receiver
  if between(s.x,s.dx-throwInc,s.dx+throwInc) 
    and between(s.y,s.dy-throwInc,s.dy+throwInc) then
    --WIP we never get there
    --TODO here test about next tile to move to
    s.rx=0
    s.ry=0
    s.x=s.dx
    s.y=s.dy
    s.z=4
    addMsg('dbg > dest reached')
    s.bhv=bhvCrate
  end
  
  s.rx=s.rx+0.1
  s.ry=s.ry+0.1
end