//
// Created by patrick on 04.07.25.
//

#ifndef GLOBALS_H
#define GLOBALS_H

#include "Constants.h"
#include "../modules/imgui/imgui.h"
#include "../modules/nexus/Nexus.h"
#include "../modules/mumble/Mumble.h"

#include "../resources/resources.h"

#include <filesystem>

extern HMODULE hSelf;

extern AddonDefinition AddonDef;
extern AddonAPI* APIDefs;
extern Mumble::Data* MumbleLink;
extern NexusLinkData* NexusLink;

extern std::filesystem::path AddonPath;

#endif //GLOBALS_H
