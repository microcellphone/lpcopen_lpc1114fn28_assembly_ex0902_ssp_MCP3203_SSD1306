#include "mcp3202.h"
#include "my_ssp.h"

extern void SSP0_Config_Request(uint32_t bitlen, uint32_t speed, uint32_t spitype);

// PORT number that /CS pin assigned on
#define CS_PORT_NUM		0
// PIN number that  /CS pin assigned on
#define CS_PIN_NUM		2

uint8_t sspreadbuf[2];

void CS_Init(void)
{
	LPC_GPIO[CS_PORT_NUM].DIR |= (1 << CS_PIN_NUM);
	LPC_GPIO[CS_PORT_NUM].DATA[(1 << CS_PIN_NUM)] |= (1 << CS_PIN_NUM);
}

void CS_Force(int32_t state)
{
  if (state){
	LPC_GPIO[CS_PORT_NUM].DATA[(1 << CS_PIN_NUM)] |= (1 << CS_PIN_NUM);
  }else{
	LPC_GPIO[CS_PORT_NUM].DATA[(1 << CS_PIN_NUM)] &= ~(1 << CS_PIN_NUM);
  }
}

uint32_t MCP3202_Read_Reg(uint32_t addr)
{
  uint8_t tx_data[2];
  uint8_t chanBits;

  if (addr == 0) {
    chanBits = 0b11010000 ;
  } else {
    chanBits = 0b11110000 ;
  }

  tx_data [0] = chanBits;
  tx_data [1] = 0;

  CS_Force(0);
  SSP0_TxRxData_Request(tx_data, 2, sspreadbuf, 2);
  CS_Force(1);

  return ((sspreadbuf [0] << 7) | (sspreadbuf [1] >> 1)) & 0xFFF ;
}

void MCP3202_Config_Request(void)
{
	SSP0_Config_Request(8, SPI_SLOW, SPI_CS_GPIO);
}
