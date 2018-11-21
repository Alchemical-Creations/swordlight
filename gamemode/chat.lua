
--local roleplay_enabled = GetConVar( "sl_enable_roleplay" )

hook.Add("PlayerSay", "debugcommands", chat_modify)

function chat_modify(ply, message)
  if string.match(message, '!health%s[(%d)+]') then
    local newhealth = string.sub(message, 9)
    ply:ChatPrint("Setting player's health to " .. newhealth .. "!") 
    ply:SetHealth(newhealth)
  elseif string.match(message, '!spawn') then
    ply:ChatPrint("Spawning test dummy")
    local pos = ply:EyePos() + (ply:GetAimVector() * 700)
    local dummy = ents.Create('npc_zombie')
    if not IsValid(dummy) then ply:ChatPrint("Not valid entity") end
    dummy:SetHealth(19208 * 19208)
    dummy:SetPos(pos)
    dummy:Spawn()
    dummy:DropToFloor()
    dummy:AddEntityRelationship(ply, D_LI, 99)
  end
  
end