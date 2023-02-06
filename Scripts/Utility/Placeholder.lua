local context = reaper.ImGui_CreateContext('ReaImGui Demo', reaper.ImGui_ConfigFlags_None())
local mainViewport = reaper.ImGui_GetMainViewport(context)
local workPosition = {reaper.ImGui_Viewport_GetWorkPos(mainViewport)}
reaper.ImGui_SetNextWindowPos(context, workPosition[1] + 20, workPosition[2] + 20, reaper.ImGui_Cond_FirstUseEver())
reaper.ImGui_SetNextWindowSize(context, 550, 680, reaper.ImGui_Cond_FirstUseEver())
local shouldBeOpen = true

function Main()
    if shouldBeOpen == true then
        if reaper.ImGui_Begin(context, 'Test', shouldBeOpen) then
            reaper.ImGui_End(context)
        end
    else
        reaper.defer(Main)
    end

    reaper.defer(Main)
end

reaper.defer(Main)