--full screen fxs

fsfx=nil
--{
--    pic=screenDamage,
--timer=20
--}


function FSDMG()
  
  fsfx={
    pic=screenDamage,
    timer=15
    }
  
end

function updFSFX()
  if fsfx~=nil then
    fsfx.timer=fsfx.timer-1
    if fsfx.timer<=0 then
      fsfx=nil
    end
  end
end

function rdrFSFX()
  if fsfx~=nil then
    
    love.graphics.draw(fsfx.pic,0,0,0,5,5)
  end
  
end

