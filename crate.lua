

  --TODO debug asset for now
crateModel=  g3d.newModel(
        "assets/xcube.obj"
        ,"assets/debugtex.png"
  , {0,0,0},
  nil,
  {8,8,8}
  )


rdrCrate=function(s)
  crateModel:setTranslation(s.x*8,s.y*8,s.z)
  crateModel:setRotation(s.rx,s.ry,0)
  crateModel:draw()
--  addMsg("rdr crate")
--  skyscraper:setTranslation(s.x*8,s.y*8,8)
----          tarmac:setTranslation(i*8,j*8,tz)
--  skyscraper:draw()

  
end

bhvCrate=function(s)
  if s.trackMe~=nil then
    s.x=s.trackMe.x
    s.y=s.trackMe.y
  end
end

--simple crate you can lift and put on a target area
createCrate=function(x,y)
    local ret={}
    ret.x=x
    ret.y=y
    ret.z=4
    ret.rx=0
    ret.ry=0
    ret.food=true
    ret.rdr=rdrCrate
    ret.bhv=bhvCrate
    ret.liftable=true
    return ret
end




