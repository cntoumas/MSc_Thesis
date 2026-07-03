// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2023.2 (64-bit)
// Tool Version Limit: 2023.10
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
#ifndef XFFT_SERIAL_H
#define XFFT_SERIAL_H

#ifdef __cplusplus
extern "C" {
#endif

/***************************** Include Files *********************************/
#ifndef __linux__
#include "xil_types.h"
#include "xil_assert.h"
#include "xstatus.h"
#include "xil_io.h"
#else
#include <stdint.h>
#include <assert.h>
#include <dirent.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
#include <unistd.h>
#include <stddef.h>
#endif
#include "xfft_serial_hw.h"

/**************************** Type Definitions ******************************/
#ifdef __linux__
typedef uint8_t u8;
typedef uint16_t u16;
typedef uint32_t u32;
typedef uint64_t u64;
#else
typedef struct {
#ifdef SDT
    char *Name;
#else
    u16 DeviceId;
#endif
    u64 Control_BaseAddress;
} XFft_serial_Config;
#endif

typedef struct {
    u64 Control_BaseAddress;
    u32 IsReady;
} XFft_serial;

typedef u32 word_type;

/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define XFft_serial_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define XFft_serial_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define XFft_serial_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define XFft_serial_ReadReg(BaseAddress, RegOffset) \
    *(volatile u32*)((BaseAddress) + (RegOffset))

#define Xil_AssertVoid(expr)    assert(expr)
#define Xil_AssertNonvoid(expr) assert(expr)

#define XST_SUCCESS             0
#define XST_DEVICE_NOT_FOUND    2
#define XST_OPEN_DEVICE_FAILED  3
#define XIL_COMPONENT_IS_READY  1
#endif

/************************** Function Prototypes *****************************/
#ifndef __linux__
#ifdef SDT
int XFft_serial_Initialize(XFft_serial *InstancePtr, UINTPTR BaseAddress);
XFft_serial_Config* XFft_serial_LookupConfig(UINTPTR BaseAddress);
#else
int XFft_serial_Initialize(XFft_serial *InstancePtr, u16 DeviceId);
XFft_serial_Config* XFft_serial_LookupConfig(u16 DeviceId);
#endif
int XFft_serial_CfgInitialize(XFft_serial *InstancePtr, XFft_serial_Config *ConfigPtr);
#else
int XFft_serial_Initialize(XFft_serial *InstancePtr, const char* InstanceName);
int XFft_serial_Release(XFft_serial *InstancePtr);
#endif

void XFft_serial_Start(XFft_serial *InstancePtr);
u32 XFft_serial_IsDone(XFft_serial *InstancePtr);
u32 XFft_serial_IsIdle(XFft_serial *InstancePtr);
u32 XFft_serial_IsReady(XFft_serial *InstancePtr);
void XFft_serial_EnableAutoRestart(XFft_serial *InstancePtr);
void XFft_serial_DisableAutoRestart(XFft_serial *InstancePtr);

void XFft_serial_Set_in_re(XFft_serial *InstancePtr, u64 Data);
u64 XFft_serial_Get_in_re(XFft_serial *InstancePtr);
void XFft_serial_Set_in_im(XFft_serial *InstancePtr, u64 Data);
u64 XFft_serial_Get_in_im(XFft_serial *InstancePtr);
void XFft_serial_Set_out_re(XFft_serial *InstancePtr, u64 Data);
u64 XFft_serial_Get_out_re(XFft_serial *InstancePtr);
void XFft_serial_Set_out_im(XFft_serial *InstancePtr, u64 Data);
u64 XFft_serial_Get_out_im(XFft_serial *InstancePtr);
u32 XFft_serial_Get_blk_exp(XFft_serial *InstancePtr);
u32 XFft_serial_Get_blk_exp_vld(XFft_serial *InstancePtr);

void XFft_serial_InterruptGlobalEnable(XFft_serial *InstancePtr);
void XFft_serial_InterruptGlobalDisable(XFft_serial *InstancePtr);
void XFft_serial_InterruptEnable(XFft_serial *InstancePtr, u32 Mask);
void XFft_serial_InterruptDisable(XFft_serial *InstancePtr, u32 Mask);
void XFft_serial_InterruptClear(XFft_serial *InstancePtr, u32 Mask);
u32 XFft_serial_InterruptGetEnabled(XFft_serial *InstancePtr);
u32 XFft_serial_InterruptGetStatus(XFft_serial *InstancePtr);

#ifdef __cplusplus
}
#endif

#endif
