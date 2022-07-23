--mtdt
walkableTiles={
    1, --ground
    3, --dropzone for crates
}

function createTestLvlGos()
  addMsg("tst lvl gos fac")
  ret={}
  tc=createCrate(11,11)
--  pprint(tc)
  table.insert(ret,createCrate(11,11))
  tc2=createCrate(12,12)
--  pprint(tc2)
  table.insert(ret,tc2)
  table.insert(ret,createCrate(8,7))
  table.insert(ret,createCrate(7,8))
  table.insert(ret,createCrate(6,7))
  table.insert(ret,createCrate(7,6))
  table.insert(ret,createBaddie(9,9,1,0))
  table.insert(ret,createBaddie(10,8,-1,0))
  table.insert(ret,createBaddie(10,10,0,1))
  
  addMsg("ret table "..tbllngth(ret))
  pprint(ret)
  return ret;
end

testLvlForest=
  {
    px=8,
    py=8,
    lx=0., -- we keep track with
    ly=1., -- lx ly of where the player
    gosFac=createTestLvlGos
    ,
    mw=16,
    mh=16,
--    skybox=starfieldbg,
    skybox=blueskybg,
--    ground=tarmac,
    ground=bgrass,
--    wall=skyscraper,
    wall=tree,
    map={
          2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,
          1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
          1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,
          1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
          1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
          1,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,
          1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
          1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
          1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
          1,1,1,1,1,1,3,3,3,1,1,1,1,1,1,1,
          1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
          1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
          1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
          1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
          1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
          1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
          
        }
  }    
      
testLvlFuture=
  {
    px=8,
    py=8,
    lx=0., -- we keep track with
    ly=1., -- lx ly of where the player
    gosFac=createTestLvlGos
    ,
    mw=16,
    mh=16,
    skybox=starfieldbg,
--    skybox=blueskybg,
    ground=tarmac,
--    ground=bgrass,
    wall=skyscraper,
--    wall=tree,
    map={
          2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,
          1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
          1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,
          1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
          1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
          1,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,
          1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
          1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
          1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
          1,1,1,1,1,1,3,3,3,1,1,1,1,1,1,1,
          1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
          1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
          1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
          1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
          1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
          1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
          
        }
  }    
      
      
function createLvl1Gos()
  addMsg("lvl1 gos fac")
  ret={}
  table.insert(ret,createCrate(8,7))
  table.insert(ret,createCrate(7,8))
  table.insert(ret,createCrate(6,7))
  table.insert(ret,createCrate(7,6))
--  table.insert(ret,createBaddie(9,9,1,0))
--  table.insert(ret,createBaddie(10,8,-1,0))
--  table.insert(ret,createBaddie(10,10,0,1))
  
--  addMsg("ret table "..tbllngth(ret))
--  pprint(ret)
  return ret;
end
lvl1=
  {
    px=8,
    py=8,
    lx=0., -- we keep track with
    ly=1., -- lx ly of where the player
    
    gosFac=createLvl1Gos
    ,
    mw=16,
    mh=16,
    skybox=starfieldbg,
--    skybox=blueskybg,
    ground=tarmac,
--    ground=bgrass,
    wall=skyscraper,
--    wall=tree,
    map={
          2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,
          2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,
          2,1,1,2,1,2,1,2,1,2,1,2,1,2,1,2,
          2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,
          2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,
          2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,2,
          2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,
          2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,
          2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,
          2,1,1,1,1,1,3,3,3,1,1,1,1,1,1,2,
          2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,
          2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,
          2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,
          2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,
          2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,
          2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,
          
        }
  }    
      
function createLvl2Gos()
  addMsg("lvl2 gos fac")
  ret={}
  table.insert(ret,createCrate(2,4))
  table.insert(ret,createCrate(2,5))
  table.insert(ret,createCrate(3,4))
  table.insert(ret,createCrate(3,5))
--  table.insert(ret,createBaddie(9,9,1,0))
--  table.insert(ret,createBaddie(10,8,-1,0))
--  table.insert(ret,createBaddie(10,10,0,1))
  
--  addMsg("ret table "..tbllngth(ret))
--  pprint(ret)
  return ret;
end

lvl2=
  {
    px=2,
    py=2,
    lx=0., -- we keep track with
    ly=1., -- lx ly of where the player
    gosFac=createLvl2Gos
    ,
    mw=16,
    mh=16,
    skybox=starfieldbg,
--    skybox=blueskybg,
--    ground=tarmac,
    ground=bgrass,
--    wall=skyscraper,
    wall=tree,
    map={
          2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,
          2,1,1,1,1,1,2,1,1,1,1,2,1,1,1,2,
          2,1,1,1,1,1,2,1,1,1,1,2,1,1,1,2,
          2,1,1,1,1,1,2,1,1,1,1,2,1,1,1,2,
          2,1,1,1,2,1,2,2,2,2,2,2,1,1,1,2,
          2,1,1,1,2,1,1,1,1,1,1,1,1,1,3,2,
          2,1,1,1,2,2,2,2,2,2,2,2,1,1,3,2,
          2,1,1,1,2,1,1,1,1,1,1,2,1,1,3,2,
          2,2,1,2,2,1,1,1,1,1,1,2,1,1,3,2,
          2,1,1,2,1,1,1,1,1,1,1,2,1,1,1,2,
          2,2,1,2,1,1,1,1,1,1,1,2,1,1,1,2,
          2,2,1,2,2,2,2,2,2,2,2,2,1,1,1,2,
          2,2,1,1,1,1,1,1,1,1,1,1,1,1,1,2,
          2,2,2,2,2,2,2,2,2,2,2,2,1,1,1,2,
          2,1,1,1,1,1,1,1,1,1,1,2,1,1,1,2,
          2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,
          
        }
  }    
      
function createLvl3Gos()
  addMsg("lvl3 gos fac")
  ret={}
  table.insert(ret,createCrate(5,2))
  table.insert(ret,createCrate(4,3))
  table.insert(ret,createCrate(3,4))
  
  table.insert(ret,createCrate(12,2))
  table.insert(ret,createCrate(13,3))  
  table.insert(ret,createCrate(14,4))
  
  
  table.insert(ret,createBaddie(12,5,-1,0))
  table.insert(ret,createBaddie(6,7,1,0))
  table.insert(ret,createBaddie(12,9,-1,0))
  
--  addMsg("ret table "..tbllngth(ret))
--  pprint(ret)
  return ret;
end

lvl3=
  {
    px=8,
    py=2,
    lx=0., -- we keep track with
    ly=1., -- lx ly of where the player
    gosFac=createLvl3Gos
    ,
    mw=16,
    mh=16,
    skybox=starfieldbg,
--    skybox=blueskybg,
    ground=tarmac,
--    ground=bgrass,
    wall=skyscraper,
--    wall=tree,
    map={
          2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,
          2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,
          2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,
          2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,
          2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,
          2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,
          2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,
          2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,
          2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,
          2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,
          2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,
          2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,
          2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,
          2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,
          2,1,1,1,1,3,3,3,3,3,3,1,1,1,1,2,
          2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,
          
        }
  }    
      
function createLvl4Gos()
  addMsg("lvl4 gos fac")
  ret={}
  table.insert(ret,createCrate(9,2))
--  table.insert(ret,createCrate(2,5))
--  table.insert(ret,createCrate(3,4))
--  table.insert(ret,createCrate(3,5))
  table.insert(ret,createBaddie(2,6,1,0))
  table.insert(ret,createBaddie(14,8,-1,0))
--  table.insert(ret,createBaddie(10,10,0,1))
  
--  addMsg("ret table "..tbllngth(ret))
--  pprint(ret)
  return ret;
end

lvl4=
  {
    px=8,
    py=2,
    lx=0., -- we keep track with
    ly=1., -- lx ly of where the player
    gosFac=createLvl4Gos
    ,
    mw=16,
    mh=16,
--    skybox=starfieldbg,
    skybox=blueskybg,
--    ground=tarmac,
    ground=bgrass,
--    wall=skyscraper,
    wall=tree,
    map={
          2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,
          2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,
          2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,
          2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,
          2,2,2,2,2,2,2,2,2,2,1,2,2,2,2,2,
          2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,
          2,2,2,2,1,2,2,2,2,2,2,2,2,2,2,2,
          2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,
          2,2,2,2,2,2,2,2,2,2,2,2,1,2,2,2,
          2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,
          2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,
          2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,
          2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,
          2,1,1,1,1,1,1,3,1,1,1,1,1,1,1,2,
          2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,
          2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,
          
        }
  }    
      
      
function createLvl5Gos()
  addMsg("lvl5 gos fac")
  ret={}
  table.insert(ret,createCrate(6,8))
--  table.insert(ret,createCrate(2,5))
  table.insert(ret,createCrate(12,8))
--  table.insert(ret,createCrate(3,5))
  table.insert(ret,createBaddie(5,8,-1,0))
  table.insert(ret,createBaddie(13,8,1,0))
--  table.insert(ret,createBaddie(10,10,0,1))
  
--  addMsg("ret table "..tbllngth(ret))
--  pprint(ret)
  return ret;
end

lvl5=
  {
    px=8,
    py=2,
    lx=0., -- we keep track with
    ly=1., -- lx ly of where the player
    gosFac=createLvl5Gos
    ,
    mw=16,
    mh=16,
--    skybox=starfieldbg,
    skybox=blueskybg,
--    ground=tarmac,
    ground=bgrass,
--    wall=skyscraper,
    wall=tree,
    map={
          2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,
          2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,
          2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,
          2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,
          2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,
          2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,
          2,2,2,2,2,2,1,1,1,1,1,2,2,2,2,2,
          2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,
          2,2,2,2,2,2,1,1,1,1,1,2,2,2,2,2,
          2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,
          2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,
          2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,
          2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,
          2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,
          2,1,1,1,1,1,3,1,1,3,1,1,1,1,1,2,
          2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,
          
        }
  }    
      
      
      
function createLvl6Gos()
  addMsg("lvl6 gos fac")
  ret={}
  table.insert(ret,createCrate(7,14))
  table.insert(ret,createCrate(8,14))
  table.insert(ret,createCrate(7,13))
  table.insert(ret,createCrate(8,13))
  
  table.insert(ret,createCrate(9,14))
  table.insert(ret,createCrate(10,14))
  table.insert(ret,createCrate(9,13))
  table.insert(ret,createCrate(10,13))

  table.insert(ret,createBaddie(6,13,0,-1))
  table.insert(ret,createBaddie(6,11,0,-1))
  table.insert(ret,createBaddie(6,9,0,-1))
  table.insert(ret,createBaddie(6,7,0,-1))
  table.insert(ret,createBaddie(6,5,0,-1))

  
  table.insert(ret,createBaddie(11,13,0,1))
  table.insert(ret,createBaddie(11,11,0,1))
  table.insert(ret,createBaddie(11,9,0,1))
  table.insert(ret,createBaddie(11,7,0,1))
  table.insert(ret,createBaddie(11,5,0,1))
--  table.insert(ret,createBaddie(10,10,0,1))
  
--  addMsg("ret table "..tbllngth(ret))
--  pprint(ret)
  return ret;
end

lvl6=
  {
    px=8,
    py=10,
    lx=0., -- we keep track with
    ly=1., -- lx ly of where the player
    gosFac=createLvl6Gos
    ,
    mw=16,
    mh=16,
    skybox=starfieldbg,
--    skybox=blueskybg,
    ground=tarmac,
--    ground=bgrass,
    wall=skyscraper,
--    wall=tree,
    map={
          2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,
          2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,
          2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,
          2,1,1,3,3,1,1,1,1,1,1,3,3,1,1,2,
          2,1,1,3,3,1,1,1,1,1,1,3,3,1,1,2,
          2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,
          2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,
          2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,
          2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,
          2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,
          2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,
          2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,
          2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,
          2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,
          2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,
          2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,
          
        }
  }    
      
dbgLevels={testLvlForest,testLvlFuture}
levels={
  lvl1,
  lvl2,
  lvl3,
  lvl4,
  lvl5,
  lvl6
  }
--curLvl=levels[1]

function initLvl(num)
  gameOver=false
  curLvl=levels[num]
  ply.x=curLvl.px
  ply.y=curLvl.py
  ply.lx=curLvl.lx 
  ply.ly=curLvl.ly
  gos=curLvl.gosFac()
  pprint(gos)
  positionPlayerAndCameraTarget()
end
