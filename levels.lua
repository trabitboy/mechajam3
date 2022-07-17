
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
  table.insert(ret,createBaddie(9,9))
  
  addMsg("ret table "..tbllngth(ret))
  pprint(ret)
  return ret;
end

testLvl=
  {
    gosFac=createTestLvlGos
    ,  
    mw=16,
    mh=16,
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
          1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
          1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
          1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
          1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
          1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
          1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
          1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
          
        }
  }    
      
levels={testLvl}
--curLvl=levels[1]

function initLvl(num)
  curLvl=levels[num]
  gos=curLvl.gosFac()
  pprint(gos)
  
end
