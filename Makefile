CFLAGS_trace.o := -I$(src)

obj-m     += dwc3.o
dwc3-y    += core.o
dwc3-y    += drd.o
dwc3-y    += ulpi.o
dwc3-y    += host.o
dwc3-y    += trace.o
dwc3-y    += gadget.o ep0.o
dwc3-y    += debugfs.o

obj-m     += dwc3-pci.o
obj-m     += dwc3-haps.o

ccflags-y := -std=gnu99 -Wno-declaration-after-statement -D__CHECK_ENDIAN__ -DCONFIG_TRACING=1 -DCONFIG_USB_DWC3=1 -DCONFIG_USB_DWC3_ULPI=1 -DCONFIG_USB_DWC3_DUAL_ROLE=1 -DCONFIG_USB_DWC3_GADGET=1 -DCONFIG_USB_DWC3_PCI=1 -DCONFIG_USB_DWC3_HAPS=1 -DCONFIG_DEBUG_FS=1 -DCONFIG_USB_DWC3_HOST=0
KERNEL_SOURCE_DIR := /lib/modules/$(shell uname -r)/build

all:
	make -C "$(KERNEL_SOURCE_DIR)" M="$(PWD)" modules

clean:
	make -C "$(KERNEL_SOURCE_DIR)" M="$(PWD)" clean
