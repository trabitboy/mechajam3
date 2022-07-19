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
  table.insert(ret,createBaddie(10,10,0,1))
  
  addMsg("ret table "..tbllngth(ret))
  pprint(ret)
  return ret;
end

testLvlForest=
  {
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
      
      
      
      
levels={testLvlForest,testLvlFuture}
--curLvl=levels[1]

function initLvl(num)
  curLvl=levels[num]
  gos=curLvl.gosFac()
  pprint(gos)
  
end
