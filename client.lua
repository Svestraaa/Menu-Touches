ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


-- Menu --
local open = false
local main = RageUI.CreateMenu("Menu Touches", "Intéractions disponibles")


main.Display.Header = true
main.Closed = function()
    open = false
end

function OpenMenuTouche() 
    if open then 
        open = false
        RageUI.Visible(main, false)
        return
    else
        open = true
        RageUI.Visible(main, true)
        CreateThread(function()
            while open do 
                RageUI.IsVisible(main, function()

                    RageUI.Checkbox("Ouvrir / Fermer", false, Config.open, {}, {
                        onChecked = function()
                            ouvert = true
                        end, 
                        onUnChecked = function()
                            ouvert = false
                        end,

                    onSelected = function(Index)
                        Config.open = Index
                    end
                    })

                    if ouvert then
                    for k,v in pairs(Config.Touche) do 
                        RageUI.Button(v.label,v.svestraa, {RightLabel = v.right},true, {
                        })
                    end
                    end
                end)
            Wait(0)
            end
        end)
    end
end



Keys.Register('F11','F11', 'Menu Touche', function()

    OpenMenuTouche()

end, false)