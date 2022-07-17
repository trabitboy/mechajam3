
stepinc=0.1

ply={
    
    x=8.,
    y=8.,
    --FOR LOGIC MOVE NOT DISPLAY
    --(playability is by square)
    lx=0., -- we keep track with
    ly=1., -- lx ly of where the player
    -- is looking logic wise 
    --angle is for DISPLAY of cinematic moves
    angle=math.pi/2,
    --target angle will be put in angle once rotation has reached target point
    tangle=-1,
    --if turn in progress, this keeps track of speed and direction
    tinc=0,
    dx=-1, --dungeon crawler,
    dy=-1,  --if moving through tiles
          --we store source and dest
    command=nil,-- buffered keypress command to exec,
    state='COMMAND_READY',
    holding=nil --reference to the go being held (crates)
  }
  
--just for player so far  
love.keypressed=function(k,s,r)
  --TODO seems repeat is off by default
  if(r==true and disableRepeat==true)then 
    --square by square movement
    return
  end
  if k=='up' then
    ply.command='FW'
  end
  if k=='left' then
    ply.command='TLEFT'
  end
  if k=='right' then
    ply.command='TRIGHT'
  end
  if k=='space' then
    ply.command='ACTION'
  end
  
end
  
  --player is the camera, and he looks
  --in a direction, which is determined by
  --angle
positionPlayerAndCameraTarget=function()
    
  g3d.camera.position={ply.x*8,ply.y*8,2}
--  g3d.camera.target={ply.x*8+ply.lx*8,ply.y*8+ply.ly*8,2}
  g3d.camera.target={ply.x*8+math.cos(ply.angle)*8,ply.y*8+math.sin(ply.angle),2}
  g3d.camera.updateViewMatrix()
  addMsg("ply x "..ply.x.." y "..ply.y)
end


--states are
-- COMMAND_READY
-- WAIT_TURNING
-- WAIT_STEP
movePlayerFromInput=function()
  
  if ply.state=='COMMAND_READY' then
    
    if ply.command=='ACTION' then
      --if ply has a crate in arms, throw it
      if ply.holding~=nil then
        addMsg("holding something ")
        --throw in straight line
        success=initThrow(ply.holding,ply.lx,ply.ly)
--        ply.holding.bhv=throwBhv
        if success==true then
          ply.holding=nil
          addMsg('thrown, holding set to nil')
        else
          addMsg('cant throw')
        end
      --if ply has crate in front, lift it
      elseif canPickup(ply.x+ply.lx,ply.y+ply.ly) then
        addMsg("not holding something, picking up")

      --TODO pickup , adjust coords also when ply moves
        addMsg("pickupable")
        ply.holding=getGo(ply.x+ply.lx,ply.y+ply.ly)
        ply.holding.x=ply.x
        ply.holding.y=ply.y
        ply.holding.z=8
        
        ply.holding.trackMe=ply
      end
      ply.command='NONE'
    elseif ply.command=='FW' then
      tx=ply.x+ply.lx
      ty=ply.y+ply.ly
      success=checkMoveBoundaries(tx,ty) and walkability(tx,ty) 
      --TODO doesnt work and crashes near border
      if success==true then
        ply.dx=ply.x+ply.lx 
        ply.dy=ply.y+ply.ly
        
        ply.state='WAIT_STEP'
      else
        addMsg("out of bound")
      end
      ply.command='NONE'
    elseif ply.command=='TRIGHT' then
      if ply.ly==1 then 
        ply.lx=1
        ply.ly=0
  --      ply.angle=0
        ply.tangle=0
      elseif ply.lx==1 then
        ply.lx=0
        ply.ly=-1
  --      ply.angle=-math.pi/2
        ply.tangle=3*math.pi/2
      elseif ply.ly==-1 then
        ply.lx=-1
        ply.ly=0
  --      ply.angle=math.pi
        ply.tangle=math.pi
      elseif ply.lx==-1 then
        ply.lx=0
        ply.ly=1
  --      ply.angle=math.pi/2
        ply.tangle=math.pi/2
      end
      
  --    positionPlayerAndCameraTarget()
      ply.tinc=-0.1
      ply.state='WAIT_TURNING'  
      ply.command='NONE'
    elseif ply.command=='TLEFT' then
      if ply.ly==1 then 
        ply.lx=-1
        ply.ly=0
--        ply.angle=math.pi
        ply.tangle=math.pi
        
      elseif ply.lx==1 then
        ply.lx=0
        ply.ly=1
--        ply.angle=math.pi/2
        ply.tangle=math.pi/2
      elseif ply.ly==-1 then
        ply.lx=1
        ply.ly=0
--        ply.angle=0
        ply.tangle=0
      elseif ply.lx==-1 then
        ply.lx=0
        ply.ly=-1
--        ply.angle=3*math.pi/2
        ply.tangle=3*math.pi/2
      end
      
--      positionPlayerAndCameraTarget()
--      ply.command='NONE'  
      ply.tinc=0.1
      ply.state='WAIT_TURNING'  
      ply.command='NONE'
    end
  
  
  elseif ply.state=='WAIT_TURNING' then
    --we add ply.lx a number of time until oversteped or equal to have a fluid move
    --normally new command is not read until finished
    
    ply.angle=ply.angle+ply.tinc
    --let's keep between 0 and 2*pi
    ply.angle=ply.angle%(2*math.pi)
    
--    addMsg('angle '..ply.angle)
    --TODO problem on +pi -pi ^^
    
    if ((ply.tangle-ply.tinc<=ply.angle ) and (ply.tangle+ply.tinc>=ply.angle ))
        or --doubled because tinc pos or geg
        ((ply.tangle-ply.tinc>=ply.angle ) and (ply.tangle+ply.tinc<=ply.angle ))
      then
      ply.angle=ply.tangle
--      addMsg('exiting wait turn')
      ply.state='COMMAND_READY'
    end
    positionPlayerAndCameraTarget()
  
  
  elseif ply.state=='WAIT_STEP' then
    --we add ply.lx a number of time until oversteped or equal to have a fluid move
    --normally new command is not read until finished
    ply.x=ply.x+ply.lx*stepinc 
    ply.y=ply.y+ply.ly*stepinc
    if (ply.x<=ply.dx+stepinc 
      and ply.dx-stepinc<= ply.x)
      and
    (ply.y<=ply.dy+stepinc 
      and ply.dy-stepinc<= ply.y) then
      ply.x=ply.dx
      ply.y=ply.dy
      ply.state='COMMAND_READY'
    end
    positionPlayerAndCameraTarget()
  
  
  end
  
end
