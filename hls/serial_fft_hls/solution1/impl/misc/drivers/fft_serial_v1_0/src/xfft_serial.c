// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2023.2 (64-bit)
// Tool Version Limit: 2023.10
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
/***************************** Include Files *********************************/
#include "xfft_serial.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XFft_serial_CfgInitialize(XFft_serial *InstancePtr, XFft_serial_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Control_BaseAddress = ConfigPtr->Control_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XFft_serial_Start(XFft_serial *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XFft_serial_ReadReg(InstancePtr->Control_BaseAddress, XFFT_SERIAL_CONTROL_ADDR_AP_CTRL) & 0x80;
    XFft_serial_WriteReg(InstancePtr->Control_BaseAddress, XFFT_SERIAL_CONTROL_ADDR_AP_CTRL, Data | 0x01);
}

u32 XFft_serial_IsDone(XFft_serial *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XFft_serial_ReadReg(InstancePtr->Control_BaseAddress, XFFT_SERIAL_CONTROL_ADDR_AP_CTRL);
    return (Data >> 1) & 0x1;
}

u32 XFft_serial_IsIdle(XFft_serial *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XFft_serial_ReadReg(InstancePtr->Control_BaseAddress, XFFT_SERIAL_CONTROL_ADDR_AP_CTRL);
    return (Data >> 2) & 0x1;
}

u32 XFft_serial_IsReady(XFft_serial *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XFft_serial_ReadReg(InstancePtr->Control_BaseAddress, XFFT_SERIAL_CONTROL_ADDR_AP_CTRL);
    // check ap_start to see if the pcore is ready for next input
    return !(Data & 0x1);
}

void XFft_serial_EnableAutoRestart(XFft_serial *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XFft_serial_WriteReg(InstancePtr->Control_BaseAddress, XFFT_SERIAL_CONTROL_ADDR_AP_CTRL, 0x80);
}

void XFft_serial_DisableAutoRestart(XFft_serial *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XFft_serial_WriteReg(InstancePtr->Control_BaseAddress, XFFT_SERIAL_CONTROL_ADDR_AP_CTRL, 0);
}

void XFft_serial_Set_in_re(XFft_serial *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XFft_serial_WriteReg(InstancePtr->Control_BaseAddress, XFFT_SERIAL_CONTROL_ADDR_IN_RE_DATA, (u32)(Data));
    XFft_serial_WriteReg(InstancePtr->Control_BaseAddress, XFFT_SERIAL_CONTROL_ADDR_IN_RE_DATA + 4, (u32)(Data >> 32));
}

u64 XFft_serial_Get_in_re(XFft_serial *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XFft_serial_ReadReg(InstancePtr->Control_BaseAddress, XFFT_SERIAL_CONTROL_ADDR_IN_RE_DATA);
    Data += (u64)XFft_serial_ReadReg(InstancePtr->Control_BaseAddress, XFFT_SERIAL_CONTROL_ADDR_IN_RE_DATA + 4) << 32;
    return Data;
}

void XFft_serial_Set_in_im(XFft_serial *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XFft_serial_WriteReg(InstancePtr->Control_BaseAddress, XFFT_SERIAL_CONTROL_ADDR_IN_IM_DATA, (u32)(Data));
    XFft_serial_WriteReg(InstancePtr->Control_BaseAddress, XFFT_SERIAL_CONTROL_ADDR_IN_IM_DATA + 4, (u32)(Data >> 32));
}

u64 XFft_serial_Get_in_im(XFft_serial *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XFft_serial_ReadReg(InstancePtr->Control_BaseAddress, XFFT_SERIAL_CONTROL_ADDR_IN_IM_DATA);
    Data += (u64)XFft_serial_ReadReg(InstancePtr->Control_BaseAddress, XFFT_SERIAL_CONTROL_ADDR_IN_IM_DATA + 4) << 32;
    return Data;
}

void XFft_serial_Set_out_re(XFft_serial *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XFft_serial_WriteReg(InstancePtr->Control_BaseAddress, XFFT_SERIAL_CONTROL_ADDR_OUT_RE_DATA, (u32)(Data));
    XFft_serial_WriteReg(InstancePtr->Control_BaseAddress, XFFT_SERIAL_CONTROL_ADDR_OUT_RE_DATA + 4, (u32)(Data >> 32));
}

u64 XFft_serial_Get_out_re(XFft_serial *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XFft_serial_ReadReg(InstancePtr->Control_BaseAddress, XFFT_SERIAL_CONTROL_ADDR_OUT_RE_DATA);
    Data += (u64)XFft_serial_ReadReg(InstancePtr->Control_BaseAddress, XFFT_SERIAL_CONTROL_ADDR_OUT_RE_DATA + 4) << 32;
    return Data;
}

void XFft_serial_Set_out_im(XFft_serial *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XFft_serial_WriteReg(InstancePtr->Control_BaseAddress, XFFT_SERIAL_CONTROL_ADDR_OUT_IM_DATA, (u32)(Data));
    XFft_serial_WriteReg(InstancePtr->Control_BaseAddress, XFFT_SERIAL_CONTROL_ADDR_OUT_IM_DATA + 4, (u32)(Data >> 32));
}

u64 XFft_serial_Get_out_im(XFft_serial *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XFft_serial_ReadReg(InstancePtr->Control_BaseAddress, XFFT_SERIAL_CONTROL_ADDR_OUT_IM_DATA);
    Data += (u64)XFft_serial_ReadReg(InstancePtr->Control_BaseAddress, XFFT_SERIAL_CONTROL_ADDR_OUT_IM_DATA + 4) << 32;
    return Data;
}

u32 XFft_serial_Get_blk_exp(XFft_serial *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XFft_serial_ReadReg(InstancePtr->Control_BaseAddress, XFFT_SERIAL_CONTROL_ADDR_BLK_EXP_DATA);
    return Data;
}

u32 XFft_serial_Get_blk_exp_vld(XFft_serial *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XFft_serial_ReadReg(InstancePtr->Control_BaseAddress, XFFT_SERIAL_CONTROL_ADDR_BLK_EXP_CTRL);
    return Data & 0x1;
}

void XFft_serial_InterruptGlobalEnable(XFft_serial *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XFft_serial_WriteReg(InstancePtr->Control_BaseAddress, XFFT_SERIAL_CONTROL_ADDR_GIE, 1);
}

void XFft_serial_InterruptGlobalDisable(XFft_serial *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XFft_serial_WriteReg(InstancePtr->Control_BaseAddress, XFFT_SERIAL_CONTROL_ADDR_GIE, 0);
}

void XFft_serial_InterruptEnable(XFft_serial *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XFft_serial_ReadReg(InstancePtr->Control_BaseAddress, XFFT_SERIAL_CONTROL_ADDR_IER);
    XFft_serial_WriteReg(InstancePtr->Control_BaseAddress, XFFT_SERIAL_CONTROL_ADDR_IER, Register | Mask);
}

void XFft_serial_InterruptDisable(XFft_serial *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XFft_serial_ReadReg(InstancePtr->Control_BaseAddress, XFFT_SERIAL_CONTROL_ADDR_IER);
    XFft_serial_WriteReg(InstancePtr->Control_BaseAddress, XFFT_SERIAL_CONTROL_ADDR_IER, Register & (~Mask));
}

void XFft_serial_InterruptClear(XFft_serial *InstancePtr, u32 Mask) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XFft_serial_WriteReg(InstancePtr->Control_BaseAddress, XFFT_SERIAL_CONTROL_ADDR_ISR, Mask);
}

u32 XFft_serial_InterruptGetEnabled(XFft_serial *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XFft_serial_ReadReg(InstancePtr->Control_BaseAddress, XFFT_SERIAL_CONTROL_ADDR_IER);
}

u32 XFft_serial_InterruptGetStatus(XFft_serial *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XFft_serial_ReadReg(InstancePtr->Control_BaseAddress, XFFT_SERIAL_CONTROL_ADDR_ISR);
}

