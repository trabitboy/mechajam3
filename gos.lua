
-- inits crates and aliens for one level
-- is in levels.lua 
--function initGos()
--    gos={}
  
--end


--is there an object I can pickup at this position?
function canPickup(mx,my)
  for i,go in ipairs(gos)
  do
    if go.x==mx and go.y==my and go.liftable==true then
      return true
    end
  end
  return false
end

function getGo(mx,my)
  for i,go in ipairs(gos)
  do
    if go.x==mx and go.y==my then
      return go
    end
  end
  return nil
end



-- ennemies and crates logic
function updateGos()
  for i,go in ipairs(gos)
  do 
    go:bhv()
  end
end

--rdr gos (will it be ok with z order ?)
function renderGos()
--  addMsg('rdr gos '..tbllngth(gos))
  for n,v in ipairs(gos)
  do
--    addMsg('rdr go')
    v:rdr()
    
  end
end

