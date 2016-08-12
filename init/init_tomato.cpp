/*
   Copyright (c) 2015, The CyanogenMod Project

   Redistribution and use in source and binary forms, with or without
   modification, are permitted provided that the following conditions are
   met:
    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above
      copyright notice, this list of conditions and the following
      disclaimer in the documentation and/or other materials provided
      with the distribution.
    * Neither the name of The Linux Foundation nor the names of its
      contributors may be used to endorse or promote products derived
      from this software without specific prior written permission.

   THIS SOFTWARE IS PROVIDED "AS IS" AND ANY EXPRESS OR IMPLIED
   WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
   MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT
   ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS
   BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
   CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
   SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR
   BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
   WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
   OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN
   IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

#include <stdlib.h>
#include <stdio.h>
#include <strings.h>

#include "vendor_init.h"
#include "property_service.h"
#include "log.h"
#include "util.h"

#include "init_msm.h"

static int display_density = 320;
static char platform_version[PROP_VALUE_MAX];
static char build_id[PROP_VALUE_MAX];
static char target_build_variant[PROP_VALUE_MAX];
static char description[PROP_VALUE_MAX];
static char fingerprint[PROP_VALUE_MAX];

static void import_cmdline(char *name, int for_emulator)
{
    char *value = strchr(name, '=');
    int name_len = strlen(name);

    if (value == 0) return;
    *value++ = 0;
    if (name_len == 0) return;

    if (!strcmp(name,"panel.xres") && !strcmp(value,"1080")) {
        display_density = 480;
    }
}

static void set_description(const char* product)
{
    sprintf(description, "%s-%s %s %s MMXMR1 release-keys", product, target_build_variant, platform_version, build_id);
    property_set("ro.build.description", description);
}

static void set_fingerprint(const char* product)
{
    sprintf(fingerprint, "YU/%s/%s:%s/%s/MMXMR1:%s/release-keys", product, product, platform_version, build_id, target_build_variant);
    property_set("ro.build.fingerprint", fingerprint);
}

void init_msm_properties(unsigned long msm_id, unsigned long msm_ver, char *board_type)
{
    char device[PROP_VALUE_MAX];
    int rc;

    UNUSED(msm_id);
    UNUSED(msm_ver);
    UNUSED(board_type);

    rc = property_get("ro.yu.device", device);
    if (!rc || !ISMATCH(device, "tomato"))
        return;

    // Get product details
    property_get("ro.build.version.release", platform_version);
    property_get("ro.build.id", build_id);
    property_get("ro.build.type", target_build_variant);

    char density[5];
    import_kernel_cmdline(0, import_cmdline);
    snprintf(density, sizeof(density), "%d", display_density);
    property_set(PROP_LCDDENSITY, density);
    if (display_density == 480) {
        property_set("ro.product.device", "YUREKA");
        property_set("ro.build.product", "YUREKA");
        set_description("YUREKA");
        set_fingerprint("YUREKA");
        property_set("ro.product.model", "YU5510");
        property_set("ro.bt.name", "YU5510");
        property_set("ro.hotspot.name", "YUREKA-YU5510");
        property_set("ro.direct.name", "YUREKA");
    } else {
        property_set("ro.product.device", "YUREKAPLUS");
        property_set("ro.build.product", "YUREKAPLUS");
        set_description("YUREKAPLUS");
        set_fingerprint("YUREKAPLUS");
        property_set("ro.product.model", "AO5510");
        property_set("ro.bt.name", "AO5510");
        property_set("ro.hotspot.name", "YUREKA-AO5510");
        property_set("ro.direct.name", "YUREKAPLUS");
    }
}

