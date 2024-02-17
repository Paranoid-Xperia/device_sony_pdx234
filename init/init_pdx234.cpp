/*
 * Copyright (C) 2023 Paranoid Android
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include <android-base/properties.h>
#include <sys/sysinfo.h>

#include <cstdlib>
#include <cstring>
#include <vector>
#define _REALLY_INCLUDE_SYS__SYSTEM_PROPERTIES_H_
#include <sys/_system_properties.h>

#include "property_service.h"
#include "vendor_init.h"

using android::base::GetProperty;

// list of partitions to override props
std::vector<std::string> ro_props_default_source_order = {
    "", "odm.", "odm_dlkm.", "product.", "system.", "system_ext.", "vendor.", "vendor_dlkm.",
};

void property_override(char const prop[], char const value[], bool add = true) {
    auto pi = (prop_info *)__system_property_find(prop);

    if (pi != nullptr) {
        __system_property_update(pi, value, strlen(value));
    } else if (add) {
        __system_property_add(prop, strlen(prop), value, strlen(value));
    }
}

void set_ro_build_prop(const std::string &source, const std::string &prop,
                       const std::string &value, bool product = false) {
    std::string prop_name;

    if (product) {
        prop_name = "ro.product." + source + prop;
    } else {
        prop_name = "ro." + source + "build." + prop;
    }

    property_override(prop_name.c_str(), value.c_str(), true);
}

void set_device_props(const std::string fingerprint, const std::string description) {
    for (const auto &source : ro_props_default_source_order) {
        set_ro_build_prop(source, "fingerprint", fingerprint);
    }

    property_override("ro.build.fingerprint", fingerprint.c_str());
    property_override("ro.build.description", description.c_str());
}

void vendor_load_properties() {
        set_device_props(
            "Sony/XQ-DQ72/XQ-DQ72:14/67.1.A.2.182/067001A002018200521143226:user/release-keys",
            "XQ-DQ72-user 14 67.1.A.2.182 067001A002018200521143226 release-keys");
    }
