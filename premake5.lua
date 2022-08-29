function includeGLFW()
    includedirs "Libraries/GLFW/include"
end

function linkGLFW()
    libdirs "Libraries/GLFW/lib"

    filter "kind:not StaticLib"
		links "glfw3"
	filter {}
end

function includeGlad()
    includedirs "Libraries/glad/include"
end

function useCookieDough()
    includedirs "projects/CoockieDough/"

    links "CookieDough"

    linkGLFW()
end

function includeCatch()
	-- Catch is header-only, we need just the Catch.hpp header
	includedirs "Libraries/Catch/include"

	-- We can also configure Catch through defines
	defines "CATCH_CPP11_OR_GREATER"
end


workspace "CookieDough"
    location "Generated"

    language "C++"

    architecture "x64"

    configurations {"Debug", "Release"}

    filter { "configurations:Debug" }
        symbols "On"

    filter {"configurations:Release"}
        optimize "On"

    filter { }

    targetdir ("Build/Bin/%{prj.name}/%{cfg.longname}")
	objdir ("Build/Obj/%{prj.name}/%{cfg.longname}")

    project "CookieDough"
        -- kind is used to indicate the type of this project.
        kind "StaticLib"

        files "projects/CookieDough/**"

        -- We need GLFW, so we include it
        includeGLFW()
        includeGlad()

    project "App"
        kind "ConsoleApp"
        files "projects/App/**"

        includedirs "projects/CookieDough"

        useCookieDough()

        filter { "system:windows" }
            links { "OpenGL32" }

        filter { "system:not windows" }
            links { "GL" }

    project "UnitTests"
	-- Catch prints information to the console
        kind "ConsoleApp"

        files "Projects/UnitTests/**"

        includeCatch()
        useCookieDough()