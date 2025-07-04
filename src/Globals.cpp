#include "Globals.h"

HMODULE hSelf = nullptr; // self handle, used for GetAddonDef
AddonDefinition AddonDef;

Mumble::Data* MumbleLink = nullptr;
NexusLinkData* NexusLink = nullptr;
AddonAPI* APIDefs = nullptr;