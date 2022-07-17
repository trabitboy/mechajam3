
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
  baddie:draw()
end  

bhvBad=function(b)
  --twitch, 2 frames animation
end  

--tracks player to stun and damage his mech,
--cant go through crate and walls
createBaddie= function(x,y)
  b={}
  b.x=x
  b.y=y
  b.bhv=bhvBad
  b.rdr=rdrBad
  return b
end