// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2023.2 (64-bit)
// Tool Version Limit: 2023.10
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
#ifndef __linux__

#include "xstatus.h"
#ifdef SDT
#include "xparameters.h"
#endif
#include "xfft_serial.h"

extern XFft_serial_Config XFft_serial_ConfigTable[];

#ifdef SDT
XFft_serial_Config *XFft_serial_LookupConfig(UINTPTR BaseAddress) {
	XFft_serial_Config *ConfigPtr = NULL;

	int Index;

	for (Index = (u32)0x0; XFft_serial_ConfigTable[Index].Name != NULL; Index++) {
		if (!BaseAddress || XFft_serial_ConfigTable[Index].Control_BaseAddress == BaseAddress) {
			ConfigPtr = &XFft_serial_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XFft_serial_Initialize(XFft_serial *InstancePtr, UINTPTR BaseAddress) {
	XFft_serial_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XFft_serial_LookupConfig(BaseAddress);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XFft_serial_CfgInitialize(InstancePtr, ConfigPtr);
}
#else
XFft_serial_Config *XFft_serial_LookupConfig(u16 DeviceId) {
	XFft_serial_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XFFT_SERIAL_NUM_INSTANCES; Index++) {
		if (XFft_serial_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XFft_serial_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XFft_serial_Initialize(XFft_serial *InstancePtr, u16 DeviceId) {
	XFft_serial_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XFft_serial_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XFft_serial_CfgInitialize(InstancePtr, ConfigPtr);
}
#endif

#endif

