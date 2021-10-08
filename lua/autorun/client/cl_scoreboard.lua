hook.Add("ScoreboardShow","ScoreBoardOpen", function ()
scoreboard = vgui.Create("DFrame")

scoreboard:SetSize(900,800)
scoreboard:Center()
scoreboard:SetTitle("")
scoreboard:SetVisible(true)
scoreboard:ShowCloseButton(false)
scoreboard:SetDraggable(false)
gui.EnableScreenClicker(true)


function scoreboard:Paint(w, h)
return false

draw.RoundedBox(9,0,0,w,h,Color(0,0,0, 200) )

end

local PanelList = vgui.Create("DPanelList", scoreboard)
    PanelList:SetTall( 900 )
    PanelList:SetWide( 800 )
    PanelList:SetPos(55, 25)

for k, v in pairs(player.GetAll()) do
	
local ListPlayer = vgui.Create("DPanelList")
	ListPlayer:SetTall(80)
	ListPlayer:SetWide(975)
	ListPlayer:SetPos(0,25)
	ListPlayer:SetSpacing( 50 )
	function ListPlayer:Paint()
		draw.RoundedBox(0,0,0, ListPlayer:GetWide(), ListPlayer:GetTall()-7, Color(0,0,0, 210))
	end

	local Name = vgui.Create("DLabel", ListPlayer)

	Name:SetPos(10, 20)
	Name:SetText( v:Name() )
	Name:SizeToContents()




	PanelList:AddItem( ListPlayer )


end

end )

hook.Add("ScoreboardHide","ScoreboardClose", function()
gui.EnableScreenClicker(false)

if IsValid(scoreboard) then scoreboard:Remove() end

end )

