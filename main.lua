
lvlNum=1


--DONE
-- position target after camera move
--square movement
-- render from game coordinate, not just updating camera pos
--suspicion of left and right inversed
--put big north south east west billboards for debug
--(cinematic advance)
--cinematic moves (cinematic turn)
--crate display
--crate mechanic
--    move from square to square and check collision
--    stop on object or boundary of playfield 
--screen capture of process picocad > blender > g3d (including patch)
--mecha lifting object above head ( you see a bit of the object bottom)
--bonus chocolate: compile to browser (davidobot lovejs)
--drop zone
--giggling aliens blocked by crates
--up down step when moving
--cockpit display
--walk sound
-- wait when baddie is thinking
--ennemy move (needs to turn back)
--ennemy turning >done


--WIP
--BUG preseting lx ly on init lvl doesnt work >>> workaruond
--BUG after damage, crash on ply move
--BUG when ennemy turning, goes through ply
--ply damage when touching ennemy
--thunder pixel effect
-- bounce when baddie is moving
-- smoke collision effect?

--TODO
-- target asset billboard included
--billboard ennemy
--ennemy display >bill board side front
--giant rats
--jump in the air briefly to better see level?
--jumping flash style?
--third person view, really far camera
--try super small render to tex (200, 200) (300,300) for full pico 8 effect
-- level complete: nice iso camera view so you see the robot cheering 
-- and the crates launched in the sky
--roasted chicken 
--gift crate (like xmas gift) different colors?
-- stunned baddie collectable?
--alien/rats throwable when stun?

--ability to jump on certain obstacles? (later levels)


disableRepeat=false
pprint=require('pprint')

g3d = require "g3d"


require('lookuptable.lut')
require('sfx')
require('models')
require('fsfx')
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


      playSD(sdStep)

--love.window.setMode(800,600)

cvs=love.graphics.newCanvas(
  800,600
--  600,600
  )

ww,wh=love.graphics.getDimensions()
addMsg(" window "..ww.." "..wh)

tstBillRot=0
--BillRotTable={0,0,tstBillRot}

initLvl(lvlNum)

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




--earth = g3d.newModel("assets/sphere.obj", "assets/earth.png", {4,0,0})
--moon = g3d.newModel("assets/sphere.obj", "assets/moon.png", {4,5,0}, nil, 0.5)
--starfieldbg = g3d.newModel("assets/sphere.obj", "assets/starfield.png", nil, nil, 500)
--blueskybg= g3d.newModel("assets/sphere.obj", "assets/bluebluesky.png", nil, nil, 500)
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
--    moon:setTranslation(math.cos(timer)*5 + 4, math.sin(timer)*5, 0)
--    moon:setRotation(0, 0, timer - math.pi/2)
--    g3d.camera.firstPersonMovement(dt)
    if love.keyboard.isDown "escape" then
        love.event.push "quit"
    end
  
    updFSFX()
  
    --is this used?
    damageFx()
    if checkVictory()==true then
      addMsg('you won \\(^o^)/')
    elseif gameOver==true then
      addMsg('you lose (O_o??)')
    else
     movePlayerFromInput()
     updateGos()
    end
end

function love.draw()
    
    love.graphics.setCanvas({cvs,depth=true})
    love.graphics.clear(.8,.8,1.)
  
     grnd=curLvl.ground
     wll=curLvl.wall
  
--   tx=5
    ty=1
--    tz=0
    for j=1,curLvl.mh
    do
      for i=1,curLvl.mw
      do
--        tnum=curLvl[8*j+i]
        --TODO map is 16 wide, display incorrect

        tnum=curLvl.map[curLvl.mw*(j-1)+i]
        if tnum==1 then
          grnd:setTranslation(i*8,j*8,ty)
          grnd:draw()
        elseif tnum==2 then
          grnd:setTranslation(i*8,j*8,ty)
          grnd:draw()
          wll:setTranslation(i*8,j*8,ty+2)
          wll:draw()
        elseif tnum==3 then
          dropzone:setTranslation(i*8,j*8,ty)
          dropzone:draw()
          tgtbill:setTranslation(i*8,j*8,10)
          tgtbill:draw()
          
        end
      
        
      end
    end  
  
    renderGos()
  
--    earth:draw()
--    moon:draw()
--    tarmac:draw()
--    skyscraper:draw()
--    testMech:draw()
    
--    drawAxis()
    
--    curLvl.skybox:draw()
    
--    love.graphics.print("test")
    tstBillRot=tstBillRot+0.1
--    rot=billboardtest:setRotation(0,0,tstBillRot)
    tgtbill:setRotation(math.pi,0,tstBillRot)
--    billboardtest:draw()
--    tgtbill:draw()
    
    love.graphics.draw(cockpit,0,0,0,5,5)
    
    rdrFSFX()
    
    --BAD EXPENSIVE SHOULD BE FLAG ^^
    if checkVictory()==true then
        love.graphics.rectangle('fill',200,200,400,200)
        love.graphics.setColor(0.,0.,0.)
        love.graphics.print('WON',270,250,0,10,10)
        love.graphics.setColor(1.,1.,1.)
        
        if love.keyboard.isDown('space') then
          if lvlNum<tbllngth(levels) then
            lvlNum=lvlNum+1
            initLvl(lvlNum)
          end
        end
    elseif gameOver==true then
        love.graphics.setColor(1.,0.,0.)      
        love.graphics.rectangle('fill',100,200,600,200)
        love.graphics.setColor(0.,0.,0.)
        love.graphics.print('RETRY',200,250,0,10,10)
        love.graphics.setColor(1.,1.,1.)      
        if love.keyboard.isDown('space') then
          initLvl(lvlNum)
        end
    end
    
    msgToCvs()
    
    --end rtotex
    love.graphics.setCanvas()
    love.graphics.draw(cvs)
    
    
    
end

function love.mousemoved(x,y, dx,dy)
    g3d.camera.firstPersonLook(dx,dy)
end
