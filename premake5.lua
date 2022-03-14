include "PremakeDependencies.lua"

project "ImGui"
    kind "StaticLib"
    language "C++"
    cppdialect "C++17"
    staticruntime "Off"

    targetdir ("bin/" .. ConfigOutputPath)
    objdir ("bin-obj/" .. ConfigOutputPath)

    configmap {
      ["Debug"] = "DebugStatic",
      ["Release"] = "ReleaseStatic"
    }

    includedirs {
        "$(ProjectDir)"
    }

    files {
        "misc/cpp/imgui_stdlib.h",
        "misc/cpp/imgui_stdlib.cpp",
        "imconfig.h",
        "imgui.h",
        "imgui.cpp",
        "imgui_demo.cpp",
        "imgui_draw.cpp",
        "imgui_internal.h",
        "imgui_tables.cpp",
        "imgui_widgets.cpp",
        "imstb_rectpack.h",
        "imstb_textedit.h",
        "imstb_truetype.h"
    }

    filter "platforms:x64"
        system "Windows"

    filter "configurations:Debug*"
        runtime "Debug"
        symbols "On"

    filter "configurations:Release*"
        runtime "Release"
        optimize "Speed"
