//
// Created by patrick on 04.07.25.
//

#include "AddonRenderer.h"

namespace Renderer {
    void PreRender()
    {
        // NO OP
    }
    void Render()
    {
        ImGui::Begin("CLion Template Addon");
        ImGui::Text("This is a sample addon to get you started with CLion and the Nexus API.");
        ImGui::Text("You can add your own render code here.");
        ImGui::Text("You can also use ImGui to create your own UI elements.");
        ImGui::Text("For example, you can use ImGui::Button, ImGui::InputText, etc.");
        ImGui::Text("You can also use ImGui::BeginChild, ImGui::EndChild, ImGui::SetNextWindowSize, etc.");
        ImGui::Text("This is a simple example of how to use ImGui with the Nexus API.");

        if (auto texture = APIDefs->Textures.GetOrCreateFromResource("raidcore_logo", IMG_RAIDCORE, hSelf)){
            ImGui::Image((ImTextureID)texture->Resource, ImVec2(64, 64));
        }

        ImGui::End();
    }
    void PostRender()
    {
        // NO OP
    }
    void RenderOptions()
    {
        // Omit the ImGui::Begin/End calls here, we are getting called from the Nexus Render Function inside a frame
        ImGui::Text("This is a sample addon to get you started with CLion and the Nexus API.");
        ImGui::Text("You can add your own options here.");
    }

} // Renderer