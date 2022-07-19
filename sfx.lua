sdStep=love.sound.newSoundData("wav/mechastep.wav")


function playSD(sd)
  love.audio.play(love.audio.newSource(sd))
end