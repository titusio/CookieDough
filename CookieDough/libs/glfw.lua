project "GLFW"
    kind "StaticLib"
    language "C"

    targetdir "build/bin/%{prj.name}"
    objdir "build/obj/%{prj.name}"
    
    includedirs { "glfw/include" }
    files { "glfw/src/**", "glfw/include/**" }

    filter "configurations:Debug"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		runtime "Release"
		optimize "on"