-- -- We specify a default position/size in case there's no data in the .ini file.
--   -- We only do it to make the demo applications a little more welcoming, but typically this isn't required.
--   local main_viewport = r.ImGui_GetMainViewport(ctx)
--   local work_pos = {r.ImGui_Viewport_GetWorkPos(main_viewport)}
--   r.ImGui_SetNextWindowPos(ctx, work_pos[1] + 20, work_pos[2] + 20, r.ImGui_Cond_FirstUseEver())
--   r.ImGui_SetNextWindowSize(ctx, 550, 680, r.ImGui_Cond_FirstUseEver())

--   if demo.set_dock_id then
--     r.ImGui_SetNextWindowDockID(ctx, demo.set_dock_id)
--     demo.set_dock_id = nil
--   end

--   -- Main body of the Demo window starts here.
--   rv,open = r.ImGui_Begin(ctx, 'Dear ImGui Demo', open, window_flags)
--   -- Early out if the window is collapsed
--   if not rv then return open end

--   -- Most "big" widgets share a common width settings by default. See 'Demo->Layout->Widgets Width' for details.

--   -- e.g. Use 2/3 of the space for widgets and 1/3 for labels (right align)
--   --r.ImGui_PushItemWidth(ctx, -r.ImGui_GetWindowWidth(ctx) * 0.35)

--   -- e.g. Leave a fixed amount of width for labels (by passing a negative value), the rest goes to widgets.
-- --   r.ImGui_PushItemWidth(ctx, r.ImGui_GetFontSize(ctx) * -12)
-- local demo = dofile(reaper.GetResourcePath() .. '/Scripts/ReaTeam Extensions/API/ReaImGui_Demo.lua')

-- local context = reaper.ImGui_CreateContext('ReaImGui Demo', reaper.ImGui_ConfigFlags_None())
-- local mainViewport = reaper.ImGui_GetMainViewport(context)
-- local workPosition = {reaper.ImGui_Viewport_GetWorkPos(mainViewport)}
-- reaper.ImGui_SetNextWindowPos(context, workPosition[1] + 20, workPosition[2] + 20, reaper.ImGui_Cond_FirstUseEver())
-- reaper.ImGui_SetNextWindowSize(context, 550, 680, reaper.ImGui_Cond_FirstUseEver())
-- local open = true

-- local function loop()
--   if reaper.ImGui_Begin(context, 'Test', reaper.ImGui_WindowFlags_None()) then
--     reaper.ImGui_End(context)
--   end
--   reaper.defer(loop)
-- end
-- reaper.defer(loop)