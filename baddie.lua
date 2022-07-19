
  baddie=g3d.newModel(
--       "assets/xcube.obj"
--        ,"assets/debugtex.png"
--  , {0,0,0},
--  nil,
--  {8,8,8}
--  )
    
      "assets/votoms/trimechatex2.obj"
    , "assets/votoms/mymecha_tex.png"
      , {0,0,5}, 
--      nil,
      {math.pi/2,0,math.pi}, 
--      rot, model doesnt have correct orientation 
      {1,1,1})


rdrBad=function(b)
  --TODO place holder
--  addMsg('rdr bad')
  baddie:setTranslation(b.x*8,b.y*8,2)
  if b.vx==1 then 
    baddie:setRotation(math.pi/2,0,-math.pi/2)
  elseif b.vx==-1 then 
    baddie:setRotation(math.pi/2,0,math.pi/2)
  elseif b.vy==1 then 
    baddie:setRotation(math.pi/2,0,0)
  elseif b.vy==-1 then 
    baddie:setRotation(math.pi/2,0,math.pi)
  
  end
  baddie:draw()
end  

bspeed=0.05

bhvBad=function(b)
  --twitch, 2 frames animation
  
  --basic baddie does back and forth
  if b.state=='WAITING' then
    b.wait=b.wait+1
    if b.wait > 60 then
      b.wait =0
      b.state='THINKING'
    end
  elseif b.state=='THINKING' then
    tx=b.x+b.vx
    ty=b.y+b.vy
    if checkMoveBoundaries(tx,ty) and walkability(tx,ty)==true and getGo(tx,ty)==nil then
      --we can go there !
--      addMsg('moving to '..tx..' '..ty)
      b.dx=tx
      b.dy=ty
      b.state='MOVING'
      return
    else
--      addMsg('cant move this way')
      b.vx=-b.vx 
      b.vy=-b.vy
    end
  elseif b.state=='MOVING' then
    b.x=b.x+b.vx*bspeed
    b.y=b.y+b.vy*bspeed
--    addMsg('bd MOVING '..b.x..' '..b.y)
    if between(b.x,b.dx-bspeed,b.dx+bspeed) 
      and between(b.y,b.dy-bspeed,b.dy+bspeed) then
      b.x=b.dx
      b.y=b.dy
      b.state='WAITING'
    end
  end
end  

--tracks player to stun and damage his mech,
--cant go through crate and walls
createBaddie= function(x,y,vx,vy)
  b={}
  b.x=x
  b.y=y
  b.vx=vx
  b.vy=vy
  b.bhv=bhvBad
  b.rdr=rdrBad
  b.state='THINKING'
  b.wait=0
  return b
end