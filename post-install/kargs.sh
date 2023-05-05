#!/usr/bin/sh

rpm-ostree kargs --append=mitigations=off --append=intel_iommu=on --append=iommu=pt --append=acpi_enforce_resources=lax
