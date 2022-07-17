


--DONE
-- position target after camera move
--square movement
-- render from game coordinate, not just updating camera pos
--suspicion of left and right inversed
--put big north south east west billboards for debug
--(cinematic advance)
--cinematic moves (cinematic turn)
--crate display

--WIP
--crate mechanic
--    move from square to square and check collision
--    stop on object or boundary of playfield 
--BUG object dx dy step not working
--BUGwalkability check doesnt work
--SUSP render of map uses factor of 8 to jump row? should be mw=16?

--TODO
--drop zone
--ennemy display >bill board side front
--ennemy move
--roasted chicken 
--gift crate (like xmas gift) different colors?
--giggling aliens blocked by crates
-- smoke collision effect?
-- stunned baddie collectable?
--giant rats
--mecha lifting object above head ( you see a bit of the object bottom)
--alien/rats throwable when stun?
--bonus chocolate: compile to browser (davidobot lovejs)

--ability to jump on certain obstacles? (later levels)

g3d = require "g3d"


require('map')
require('between')
require('tlbutil')
require('levels')
require('gamemodel')
require('axis')
require('msg')
require('baddie')
require('crate')
require('throwbhv')
require('gos')
pprint=require('pprint')


initLvl(1)

function setCameraLeft()
    g3d.camera.target={g3d.camera.position[1]+1.,g3d.camera.position[2],g3d.camera.position[3]}
end

function setCameraRight()
    g3d.camera.target={g3d.camera.position[1]-1.,g3d.camera.position[2],g3d.camera.position[3]}
end


function moveCamera(dx,dy,dz)
    g3d.camera.position={g3d.camera.position[1]+dx,g3d.camera.position[2]+dy,g3d.camera.position[3]+dz}
end

function moveCameraAndTarget(dx,dy,dz)
    g3d.camera.position={g3d.camera.position[1]+dx,g3d.camera.position[2]+dy,g3d.camera.position[3]+dz}
    g3d.camera.target={g3d.camera.target[1]+dx,g3d.camera.target[2]+dy,g3d.camera.target[3]+dz}
end

tarmac= g3d.newModel(
            "assets/tarmac/tritarmac1.obj"
            ,"assets/tarmac/tarmac1_tex.png"
      , {5,5,0}, {math.pi/2,0,0}, {4,4,4})
    
skyscraper=g3d.newModel(
      "assets/skyscraper/trisstex1.obj"
    , "assets/skyscraper/sstex1_tex.png"
      , {0,0,0}, {math.pi/2,0,0}, {8,8,8})
    --not working
--    tile = g3d.newModel(
--            "assets/floortile.obj"
--            ,"assets/floortile_tex.png"
--      , {5,5,0}, {100,0,0}, {0.5,0.5,0.5})

  testMech=g3d.newModel(
      "assets/votoms/trimechatex2.obj"
    , "assets/votoms/mymecha_tex.png"
      , {0,0,5}, 
      nil,
      --{0,0,math.pi}, rot, model doesnt have correct orientation 
      {3,3,3})




local earth = g3d.newModel("assets/sphere.obj", "assets/earth.png", {4,0,0})
local moon = g3d.newModel("assets/sphere.obj", "assets/moon.png", {4,5,0}, nil, 0.5)
local background = g3d.newModel("assets/sphere.obj", "assets/starfield.png", nil, nil, 500)
local timer = 0

--moveCamera(
--  0,
--  0,
--  10 --z is height
--  )
--  moveCameraAndTarget(0,0,5)
positionPlayerAndCameraTarget()

-- TODO change to move target around player -+angle touching left or right
-- puts camera behind player, from fix vector, with angle
cameraBehindPlayer=function()
--  camerayheight
  tcx=xmech+math.cos(targetangle+math.pi)*camerazdist
  tcz=zmech+math.sin(targetangle+math.pi)*camerazdist
  
--  camerazdist
  g3d.camera.position={tcx,camerayheight,tcz}
  
end



function love.update(dt)
    timer = timer + dt
    moon:setTranslation(math.cos(timer)*5 + 4, math.sin(timer)*5, 0)
    moon:setRotation(0, 0, timer - math.pi/2)
--    g3d.camera.firstPersonMovement(dt)
    if love.keyboard.isDown "escape" then
        love.event.push "quit"
    end
    
     movePlayerFromInput()
    updateGos()
end

function love.draw()
  
   tx=5
    ty=1
    tz=0
    for j=1,curLvl.mh
    do
      for i=1,curLvl.mw
      do
--        tnum=curLvl[8*j+i]
        --TODO map is 16 wide, display incorrect

        tnum=curLvl.map[8*j+i]
        if tnum==1 then
          tarmac:setTranslation(i*8,j*8,ty)
--          tarmac:setTranslation(i*8,j*8,tz)
          tarmac:draw()
        elseif tnum==2 then
          skyscraper:setTranslation(i*8,j*8,ty)
--          tarmac:setTranslation(i*8,j*8,tz)
          skyscraper:draw()
          
  --        -- test render in go
  ----        modelRep[buildingId]:setTranslation(i*8,ty-4,j*8)
  ----        --rot should not be there
  ----        modelRep[buildingId]:setRotation(math.pi,0,0)
  ----        modelRep[buildingId]:draw()        
        end
      
        
      end
    end  
  
    renderGos()
  
    earth:draw()
    moon:draw()
    tarmac:draw()
    skyscraper:draw()
    testMech:draw()
    
    drawAxis()
    
    background:draw()
    
--    love.graphics.print("test")
    msgToCvs()
end

function love.mousemoved(x,y, dx,dy)
    g3d.camera.firstPersonLook(dx,dy)
end
