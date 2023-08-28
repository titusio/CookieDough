workspace "CookieDough"
    configurations { "Debug", "Release" }
    location "build"

project "CookieDough"
    kind "StaticLib"
    language "C++"
    files {
        "CookieDough/src/**",
        "CookieDough/include/**"
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