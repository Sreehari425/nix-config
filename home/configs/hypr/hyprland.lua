-- Port of the current hyprland.conf to Hyprland Lua config.

local terminal = "kitty"
local fileManager = "thunar"
local menu = "rofi -show drun"
local powermenu = "zsh ~/.config/rofi/powermenu.sh"
local screenshot = "flameshot gui"
local hyprlock = "hyprlock"
local killpanel = "pkill waybar"
local startpanel = "waybar"
local emoji = "rofi -modi emoji -show emoji"
local mainMod = "SUPER"
local floatToggleLua = os.getenv("HOME") .. "/.config/hypr/float-toggle.lua"

hl.monitor({
    output = "eDP-1",
    mode = "1920x1200@60",
    position = "0x0",
    scale = 1,
})

hl.on("hyprland.start", function()
    hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
    hl.exec_cmd("gnome-keyring-daemon --start --components=secrets")
    hl.exec_cmd("~/.config/hypr/scripts/battery_notify.sh")

    hl.exec_cmd("fcitx5 -d")
    hl.exec_cmd("swaync")
    hl.exec_cmd("systemctl --user start hyprpolkitagent")
    hl.exec_cmd("hypridle")

    hl.exec_cmd("wl-paste --type text --watch cliphist store")
    hl.exec_cmd("wl-paste --type image --watch cliphist store")

    hl.exec_cmd("waybar")
    hl.exec_cmd("awww-daemon")
    hl.exec_cmd("awww img ~/.config/hypr/wallpaper.jpg")

    hl.exec_cmd([[sh -lc 'gsettings set org.gnome.desktop.interface cursor-theme hypr-dots-black >/dev/null 2>&1']])
    hl.exec_cmd("hyprctl setcursor hypr-dots-black 1")
end)

hl.env("QT_IM_MODULE", "fcitx")
hl.env("XMODIFIERS", "@im=fcitx")
hl.env("SDL_IM_MODULE", "fcitx")
hl.env("GLFW_IM_MODULE", "local")
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "wayland")

hl.config({
    general = {
        gaps_in = 10,
        gaps_out = 40,
        border_size = 3,
        col = {
            active_border = { colors = { "rgba(cfcfcfff)", "rgba(cfcfcfff)" }, angle = 45 },
            inactive_border = "rgba(00000000)",
        },
        resize_on_border = false,
        allow_tearing = false,
        layout = "dwindle",
    },

    decoration = {
        rounding = 10,
        active_opacity = 0.9,
        inactive_opacity = 0.3,
        shadow = {
            enabled = true,
            range = 25,
            render_power = 1000,
            color = "rgba(cfcfcfff)",
            color_inactive = "rgba(00000000)",
        },
        blur = {
            enabled = true,
            size = 1,
            passes = 5,
            vibrancy = 0.1696,
        },
    },

    animations = {
        enabled = true,
    },

    dwindle = {
        preserve_split = true,
    },

    master = {
        new_status = "master",
    },

    misc = {
        force_default_wallpaper = -1,
        disable_hyprland_logo = false,
    },

    input = {
        kb_layout = "us",
        kb_variant = "",
        kb_model = "",
        kb_options = "",
        kb_rules = "",
        accel_profile = "flat",
        follow_mouse = 1,
        sensitivity = 0.8,
        repeat_rate = 50,
        repeat_delay = 200,
        touchpad = {
            natural_scroll = true,
        },
    },
})

hl.curve("winIn", { type = "bezier", points = { { 0.1, 1.0 }, { 0.1, 1.0 } } })
hl.curve("winOut", { type = "bezier", points = { { 0.1, 1.0 }, { 0.1, 1.0 } } })
hl.curve("smoothOut", { type = "bezier", points = { { 0.5, 0 }, { 0.99, 0.99 } } })
hl.curve("layerOut", { type = "bezier", points = { { 0.23, 1 }, { 0.32, 1 } } })

hl.animation({ leaf = "windowsIn", enabled = true, speed = 7, bezier = "winIn", style = "slide" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 3, bezier = "smoothOut", style = "slide" })
hl.animation({ leaf = "windowsMove", enabled = true, speed = 7, bezier = "winIn", style = "slide" })
hl.animation({ leaf = "workspacesIn", enabled = true, speed = 8, bezier = "winIn", style = "slide" })
hl.animation({ leaf = "workspacesOut", enabled = true, speed = 8, bezier = "winOut", style = "slide" })
hl.animation({ leaf = "layersIn", enabled = true, speed = 10, bezier = "winIn", style = "slide" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 3, bezier = "layerOut", style = "popin 50%" })

hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "workspace",
})

pcall(dofile, floatToggleLua)

for i = 1, 10 do
    hl.workspace_rule({
        workspace = tostring(i),
        monitor = "eDP-1",
    })
end

hl.bind(mainMod .. " + V", hl.dsp.exec_cmd("cliphist list | rofi -dmenu | cliphist decode | wl-copy"))
hl.bind("switch:Lid Switch", hl.dsp.exec_cmd(hyprlock), { locked = true })
hl.bind(mainMod .. " + return", hl.dsp.exec_cmd(terminal))
-- hl.bind("ALT + Q", hl.dsp.window.kill()) <--- this kills the window 
 hl.bind("ALT + Q", hl.dsp.window.close()) -- <--- this closes the window

hl.bind(mainMod .. " + M", hl.dsp.exec_cmd("hyprctl dispatch 'hl.dsp.exit()'"))
hl.bind(mainMod .. " + PERIOD", hl.dsp.exec_cmd(emoji))
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({ action = "toggle" }))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind("ALT + F", hl.dsp.window.float({ action = "toggle" }))
hl.bind("ALT + R", hl.dsp.exec_cmd(menu))
hl.bind("ALT + Z", hl.dsp.exec_cmd(powermenu))
hl.bind("ALT + S", hl.dsp.layout("togglesplit"))
hl.bind(mainMod .. " + F1", hl.dsp.exec_cmd("~/.config/hypr/scripts/toggle_floating.sh"))
hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "down" }))
hl.bind("ALT + F1", hl.dsp.exec_cmd(screenshot))
hl.bind(mainMod .. " + P", hl.dsp.exec_cmd(hyprlock))
hl.bind(mainMod .. " + I", hl.dsp.exec_cmd(killpanel))
hl.bind(mainMod .. " + O", hl.dsp.exec_cmd(startpanel))

for i = 1, 5 do
    hl.bind("ALT + " .. i, hl.dsp.focus({ workspace = i }))
    hl.bind("CTRL + " .. i, hl.dsp.focus({ workspace = i + 5 }))
    hl.bind(mainMod .. " + " .. i, hl.dsp.window.move({ workspace = i }))
    hl.bind("CTRL + SHIFT + " .. i, hl.dsp.window.move({ workspace = i + 5 }))
end

hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), { locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { locked = true, repeating = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl s 10%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl s 10%-"), { locked = true, repeating = true })
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

hl.bind("XF86Favorites", hl.dsp.exec_cmd("playerctl next"))
hl.bind("XF86SelectiveScreenshot", hl.dsp.exec_cmd("playerctl previous"))
hl.bind("code:455", hl.dsp.exec_cmd("playerctl play-pause"))



hl.bind("SUPER + F12", hl.dsp.submap("clean"))
hl.define_submap("clean", function()

    hl.bind("SUPER + ESCAPE", hl.dsp.submap("reset"))
    
end)

hl.window_rule({
    name = "xwayland-bridge",
    match = { class = "^(xwaylandvideobridge)$" },
    opacity = "0.0 override",
    no_anim = true,
    no_initial_focus = true,
    max_size = "1 1",
    no_blur = true,
})

hl.window_rule({
    name = "suppress-maximize-events",
    match = { class = ".*" },
    suppress_event = "maximize",
})

hl.window_rule({
    name = "xwayland-ghost-fix",
    match = {
        class = "^$",
        title = "^$",
        xwayland = true,
        float = true,
        fullscreen = false,
        pin = false,
    },
    no_focus = true,
})
