#ifndef __MCP3202_H__
#define __MCP3202_H__

#include "chip.h"

uint32_t MCP3202_Read_Reg(uint32_t addr);
void MCP3202_Config_Request(void);

#endif // __MCP3202_H__
