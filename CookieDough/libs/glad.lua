project "GLAD"
    kind "StaticLib"
    language "C"

    targetdir "build/bin/%{prj.name}"
    objdir "build/obj/%{prj.name}"
    
    includedirs { "glad/include" }
    files { "glad/src/**", "glad/include/**" }

    filter "configurations:Debug"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		runtime "Release"
		optimize "on"