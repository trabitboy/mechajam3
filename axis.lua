



axiszbase=5
axisxbase=60
axisybase=60



xaxis={10+axisxbase,axisybase,axiszbase}
yaxis={axisxbase,10+axisybase,axiszbase}
zaxis={axisxbase,axisybase,10+axiszbase}

  xcube=  g3d.newModel(
            "assets/xcube.obj"
            ,"assets/debugtex.png"
      , xaxis,
      nil,
      {2,2,2}
      )
  
  zerocube=  g3d.newModel(
            "assets/tri0cube.obj"
            ,"assets/debugtex.png"
      , {axisxbase,axisybase,axiszbase},
      nil,
      {2,2,2}
      )
  
  ycube= g3d.newModel(
            "assets/triycube.obj"
            ,"assets/debugtex.png"
      , yaxis,
      nil,
      {2,2,2}
      )
  
   zcube=g3d.newModel(
            "assets/trizcube.obj"
            ,"assets/debugtex.png"
      , zaxis,
      nil,
      {2,2,2}
      )

drawAxis=function()
    --xcube 
    xcube:draw()
    ycube:draw()
    zcube:draw()
    --0cube
    zerocube:draw()
    
end
