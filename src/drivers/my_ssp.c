#include <my_ssp.h>
#include "chip.h"
#include <ssp_11xx_asm.h>


void SSP_IRQHandler(void)
{
  uint32_t regValue;

  regValue = LPC_SSP0->MIS;

  // Overrun?
  if (regValue & SSP_RORMIS){
    LPC_SSP0->ICR = SSP_RORIC; // Clear
  }
  // Timeout?
  if ( regValue & SSP_RTMIS ){
    LPC_SSP0->ICR = SSP_RTIC; // Clear
  }
  // Tx FIFO Half Empty?
  if ( regValue & SSP_TXMIS ){
    // none
	LPC_SSP0->ICR = SSP_TXMIS; // Clear
  }
  // Rx FIFO not FULL?
  if ( regValue & SSP_RXMIS ){
    // none
		LPC_SSP0->ICR = SSP_RXMIS; // Clear
    //uint32_t dummy;
    //while (SPI_RxData(&dummy) == 0); //dummy read
  }
}
/*
static uint32_t SSP0_SendRcvData_Request(uint32_t txdata)
{
  uint32_t rxdata;

  // Tx
  while ((LPC_SSP0->SR & (SSP_STAT_TNF|SSP_STAT_BSY)) != SSP_STAT_TNF);
  // Send a byte
  LPC_SSP0->DR = txdata;
  // Wait until the Busy bit is cleared
  while ( LPC_SSP0->SR & SSP_STAT_BSY );

  // Rx
  while ((LPC_SSP0->SR & SSP_STAT_RNE) != SSP_STAT_RNE);
  rxdata = LPC_SSP0->DR;

  return rxdata;
}

void SSP0_TxData_Request(uint32_t txdata)
{
	SSP0_SendRcvData_Request(txdata);
}

uint32_t SSP0_RxData_Request(void)
{
  uint32_t rxdata;

  rxdata = SSP0_SendRcvData_Request(0xff);
  return rxdata;
}

void SSP0_Send_Request(uint8_t dat)
{
  SSP0_Tx_Data_Request(dat);
}

void SSP0_Send_Request16(uint16_t dat)
{
  SSP0_Send_Request((uint8_t)(dat>>8));
  SSP0_Send_Request((uint8_t)dat);
}
*/
