workspace "CookieDough"
    configurations { "Debug", "Release" }
    location "build"
    
project "CookieDough"
    kind "SharedLib"
    language "C++"
    files {
        "CookieDough/src/**",
        "CookieDough/include/**",
    }
    links {
        "GLFW",
        "GLAD"
    }
    includedirs {
        "CookieDough/libs/glfw/include",
        "CookieDough/libs/glad/include"
    }

project "Sandbox"
    kind "ConsoleApp"
    language "C++"
    files {
        "Sandbox/src/**"
    }
    links {
        "CookieDough"
    }
    includedirs {
        "CookieDough/include"
    }

include "CookieDough/libs/glfw.lua"
include "CookieDOugh/libs/glad.lua"