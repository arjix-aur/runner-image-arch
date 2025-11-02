#!/bin/env node

import { readFileSync, writeFileSync } from "node:fs";

let hasPackager = false;

let config = readFileSync("/etc/makepkg.conf", { encoding: "utf-8" })
    .split("\n")
    .map(line => {
        if (line.startsWith("BUILDENV=")) return "BUILDENV=(!distcc !color ccache check !sign)"
        if (line.startsWith("OPTIONS=")) return "OPTIONS=(!strip docs libtool staticlibs emptydirs !zipman !debug)"
        if (line.startsWith("PACKAGER=")) {
            hasPackager = true;
            return "PACKAGER='ArjixWasTaken <me@arjix.dev>'";
        }
        return line;
    })
    .join("\n");

if (!hasPackager) {
    config += "\nPACKAGER='ArjixWasTaken <me@arjix.dev>'\n"
}

writeFileSync("/etc/makepkg.conf", config, { encoding: "utf-8" })
