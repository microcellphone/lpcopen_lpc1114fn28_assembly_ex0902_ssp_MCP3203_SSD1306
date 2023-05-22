/*
Here are some common GCC directives for ARM Cortex-M0 assembly:

.align: Specifies the byte alignment of the following instruction or data item.
.ascii: Specifies a string of characters to be included in the output file.
.asciz: Specifies a zero-terminated string of characters to be included in the output file.
.byte: Specifies one or more bytes of data to be included in the output file.
.data: Marks the start of a data section.
.global: Marks a symbol as visible outside of the current file.
.section: Specifies the section of memory where the following instructions or data items should be placed.
.space: Reserves a block of memory with a specified size.
.thumb: Instructs the assembler to generate Thumb code.
.thumb_func: Marks a function as using the Thumb instruction set.
.word: Specifies one or more words of data to be included in the output file.

Note that this is not an exhaustive list, and different versions of GCC may support additional or different directives.
*/

#include "my_ssp.h"
#include "ssp_11xx_asm.h"
#include "iocon_11xx_asm.h"
#include "sysctl_11xx_asm.h"
#include "gpio_11xx_2_asm.h"

    .syntax unified



	.cpu cortex-m0
	.text
	.section	.text.NVIC_EnableIRQ,"ax",%progbits
	.align	1
	.arch armv6s-m
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	NVIC_EnableIRQ, %function
NVIC_EnableIRQ:
	push	{r7, lr}
	sub	sp, sp, #8
	add	r7, sp, #0
	movs	r2, r0
	adds	r3, r7, #7
	strb	r2, [r3]
	adds	r3, r7, #7
	ldrb	r3, [r3]
	movs	r2, r3
	movs	r3, #31
	ands	r3, r2
	movs	r2, #1
	lsls	r2, r2, r3
	ldr	r3, .L2
	str	r2, [r3]
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L3:
	.align	2
.L2:
	.word	-536813312
.LFE24:
	.size	NVIC_EnableIRQ, .-NVIC_EnableIRQ


	.section	.text.NVIC_SetPriority,"ax",%progbits
	.align	1
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	NVIC_SetPriority, %function
NVIC_SetPriority:
	push	{r4, r7, lr}
	sub	sp, sp, #12
	add	r7, sp, #0
	movs	r2, r0
	str	r1, [r7]
	adds	r3, r7, #7
	strb	r2, [r3]
	adds	r3, r7, #7
	ldrb	r3, [r3]
	cmp	r3, #127
	bls	.L5
	ldr	r2, .L8
	adds	r3, r7, #7
	ldrb	r3, [r3]
	movs	r1, r3
	movs	r3, #15
	ands	r3, r1
	subs	r3, r3, #8
	lsrs	r3, r3, #2
	adds	r3, r3, #6
	lsls	r3, r3, #2
	adds	r3, r2, r3
	adds	r3, r3, #4
	ldr	r3, [r3]
	adds	r2, r7, #7
	ldrb	r2, [r2]
	movs	r1, r2
	movs	r2, #3
	ands	r2, r1
	lsls	r2, r2, #3
	movs	r1, #255
	lsls	r1, r1, r2
	movs	r2, r1
	mvns	r2, r2
	ands	r2, r3
	movs	r1, r2
	ldr	r3, [r7]
	lsls	r3, r3, #6
	movs	r2, #255
	ands	r2, r3
	adds	r3, r7, #7
	ldrb	r3, [r3]
	movs	r0, r3
	movs	r3, #3
	ands	r3, r0
	lsls	r3, r3, #3
	lsls	r2, r2, r3
	ldr	r0, .L8
	adds	r3, r7, #7
	ldrb	r3, [r3]
	movs	r4, r3
	movs	r3, #15
	ands	r3, r4
	subs	r3, r3, #8
	lsrs	r3, r3, #2
	orrs	r2, r1
	adds	r3, r3, #6
	lsls	r3, r3, #2
	adds	r3, r0, r3
	adds	r3, r3, #4
	str	r2, [r3]
	b	.L7
.L5:
	ldr	r2, .L8+4
	adds	r3, r7, #7
	ldrb	r3, [r3]
	sxtb	r3, r3
	lsrs	r3, r3, #2
	adds	r3, r3, #192
	lsls	r3, r3, #2
	ldr	r3, [r3, r2]
	adds	r2, r7, #7
	ldrb	r2, [r2]
	movs	r1, r2
	movs	r2, #3
	ands	r2, r1
	lsls	r2, r2, #3
	movs	r1, #255
	lsls	r1, r1, r2
	movs	r2, r1
	mvns	r2, r2
	ands	r2, r3
	movs	r1, r2
	ldr	r3, [r7]
	lsls	r3, r3, #6
	movs	r2, #255
	ands	r2, r3
	adds	r3, r7, #7
	ldrb	r3, [r3]
	movs	r0, r3
	movs	r3, #3
	ands	r3, r0
	lsls	r3, r3, #3
	lsls	r2, r2, r3
	ldr	r0, .L8+4
	adds	r3, r7, #7
	ldrb	r3, [r3]
	sxtb	r3, r3
	lsrs	r3, r3, #2
	orrs	r2, r1
	adds	r3, r3, #192
	lsls	r3, r3, #2
	str	r2, [r3, r0]
.L7:
	nop
	mov	sp, r7
	add	sp, sp, #12
	pop	{r4, r7, pc}
.L9:
	.align	2
.L8:
	.word	-536810240
	.word	-536813312
.LFE29:
	.size	NVIC_SetPriority, .-NVIC_SetPriority


	.section	.text.SSP0_Config_Request,"ax",%progbits
	.align	1
	.global	SSP0_Config_Request
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	SSP0_Config_Request, %function
//void SSP0_Config_Request(uint32_t bitlen, uint32_t speed, uint32_t spitype)
SSP0_Config_Request:
	push	{r7, lr}
	sub	sp, sp, #24
	add	r7, sp, #0
	str	r0, [r7, #12]		// bitlen
	str	r1, [r7, #8]		// speed
	str	r2, [r7, #4]		// spitype
	ldr	r3, [r7, #4]
////////////////////////////////////////  if (spitype == SPI_CS_NORMAL){
	cmp	r3, #SPI_CS_NORMAL
	bne	CS_GPIO
/////////////////////////////////////////////    LPC_IOCON->REG[IOCON_PIO0_2]  = 0x00000001; // SCK, disable pu/pd mos
	ldr	r3, =LPC_IOCON_BASE
	movs	r2, #1
	str	r2, [r3, #IOCON_OFFSET_PIO0_2]
	b	SSP_SETUP
CS_GPIO:
///////////////////////////////////////////////////	LPC_GPIO[0].DIR |= (1 << 2);
	ldr	r2, =LPC_GPIO_PORT1_BASE
	ldr	r3, =GPIO_OFFSET_DIR
	ldr	r3, [r2, r3]
//////////////////////////////////////////////////	LPC_GPIO[0].DATA[(1 << 2)] |= (1 << 2);
	ldr	r2, =LPC_GPIO_PORT1_BASE
	movs	r1, #(1 << 2)
	orrs	r1, r3
	ldr	r3, =GPIO_OFFSET_DIR
	str	r1, [r2, r3]
	ldr	r3, =LPC_GPIO_PORT1_BASE
	ldr	r2, [r3, #16]
	ldr	r3, =LPC_GPIO_PORT1_BASE
	movs	r1, #(1 << 2)
	orrs	r2, r1
	str	r2, [r3, #16]
SSP_SETUP:
////////////////////////////////////////////////  LPC_IOCON->REG[IOCON_PIO0_6]  = 0x00000002; // SCK, disable pu/pd mos
	ldr	r3, =LPC_IOCON_BASE
	movs	r2, #(IOCON_FUNC2|IOCON_MODE_PULLUP)
	str	r2, [r3, #IOCON_OFFSET_PIO0_6]
////////////////////////////////////////////////  LPC_IOCON->REG[IOCON_PIO0_9]  = 0x00000001; // MOSI, disable pu/pd mos
	ldr	r3, =LPC_IOCON_BASE
	movs	r2, #(IOCON_FUNC1|IOCON_MODE_PULLUP)
	str	r2, [r3, #IOCON_OFFSET_PIO0_9]
////////////////////////////////////////////////  LPC_IOCON->REG[IOCON_PIO0_8]  = 0x00000011; // MISO, enable pu/pd mos
	ldr	r3, =LPC_IOCON_BASE
	movs	r2, #(IOCON_FUNC1|IOCON_MODE_PULLUP)
	str	r2, [r3, #IOCON_OFFSET_PIO0_8]
////////////////////////////////////////////////  LPC_SYSCTL->PRESETCTRL    |= (0x1<<0);
	ldr	r3, =LPC_SYSCTL_BASE
	ldr	r2, [r3, #SYSCTL_OFFSET_PRESETCTRL]
	ldr	r3, =LPC_SYSCTL_BASE
	movs	r1, #1
	orrs	r2, r1
	str	r2, [r3, #SYSCTL_OFFSET_PRESETCTRL]
////////////////////////////////////////////////  LPC_SYSCTL->SYSAHBCLKCTRL |= (1<<11);
	ldr	r2, =LPC_SYSCTL_BASE
	movs	r3, #SYSCTL_OFFSET_SYSAHBCLKCTRL
	ldr	r3, [r2, r3]
	ldr	r1, =LPC_SYSCTL_BASE
	ldr	r2, =(1<<11)
	orrs	r3, r2
	movs	r2, #SYSCTL_OFFSET_SYSAHBCLKCTRL
	str	r3, [r1, r2]
///////////////////////////////////////////////  LPC_SYSCTL->SSP0CLKDIV     = 0x01; // Divided by 1
	ldr	r2, =LPC_SYSCTL_BASE
	movs	r3, #SYSCTL_OFFSET_SSP0CLKDIV
	movs	r1, #1
	str	r1, [r2, r3]
///////////////////////////////////////////////  if (speed == SPI_FAST){
	ldr	r3, [r7, #8]			// speed
	cmp	r3, #SPI_FAST
	bne	JUMP_SPI_SLOW
//////////////////////////////////////////////////    LPC_SSP0->CR0 = 0x0000 + (bitlen - 1);
	ldr	r3, =LPC_SSP0_BASE
	ldr	r2, [r7, #12]			// bitlen
	subs	r2, r2, #1
	str	r2, [r3, #SSP_OFFSET_CR0]
//////////////////////////////////////////////////    LPC_SSP0->CPSR = 2;
	ldr	r3, =LPC_SSP0_BASE
	movs	r2, #2
	str	r2, [r3, #SSP_OFFSET_CPSR]
	b	DUMMY_READ
JUMP_SPI_SLOW:
//////////////////////////////////////////////////    LPC_SSP0->CR0 = 0x0300 + (bitlen - 1);
	ldr	r3, =LPC_SSP0_BASE
	ldr	r2, [r7, #12]			// bitlen
	ldr	r1, =767
	mov	ip, r1
	add	r2, r2, ip
	str	r2, [r3, SSP_OFFSET_CR0]
//////////////////////////////////////////////////    LPC_SSP0->CPSR = 30;
	ldr	r3, =LPC_SSP0_BASE
	movs	r2, #30
	str	r2, [r3, #SSP_OFFSET_CPSR]
DUMMY_READ:
	movs	r3, #0
	str	r3, [r7, #20]
	b	DUMMY_READ_START
////////////////////////////////////////////////  for ( i = 0; i < SSP_FIFOSIZE; i++ ) Dummy = LPC_SSP0->DR;
DUMMY_READ_LOOP:
	ldr	r3, =LPC_SSP0_BASE
	ldr	r3, [r3, #SSP_OFFSET_DR]
	str	r3, [r7, #16]			// Dummy
	ldr	r3, [r7, #20]			// i
	adds	r3, r3, #1			// i++
	str	r3, [r7, #20]
DUMMY_READ_START:
	ldr	r3, [r7, #20]			// r3 = i
	cmp	r3, #(SSP_FIFOSIZE-1)
	bls	DUMMY_READ_LOOP
///////////////////////////////////////////////  NVIC_EnableIRQ(SSP0_IRQn);
	movs	r0, #20
	bl	NVIC_EnableIRQ
///////////////////////////////////////////////  NVIC_SetPriority(SSP0_IRQn, 3);
	movs	r1, #3
	movs	r0, #20
	bl	NVIC_SetPriority
///////////////////////////////////////////////  LPC_SSP0->CR1 = SSP_CR1_SSP_EN;
	ldr	r3, =LPC_SSP0_BASE
	movs	r2, #SSP_CR1_SSP_EN
	str	r2, [r3, #SSP_OFFSET_CR1]
	bl	CS_Init
RETURN_SSP_CONFIG:
	nop
	mov	sp, r7
	add	sp, sp, #24
	pop	{r7, pc}
	.size	SSP0_Config_Request, .-SSP0_Config_Request



    .text
    .global  SSP0_Tx_Data_Request
	.thumb
	.thumb_func
    .type	SSP0_Tx_Data_Request, %function
SSP0_Tx_Data_Request:
	push	{r7, lr}
	sub	sp, sp, #8
	add	r7, sp, #0
	str	r0, [r7, #4]
	nop
TX_EMPTY_WAIT:
	ldr	r3, =LPC_SSP0_BASE
	ldr	r3, [r3, #SSP_OFFSET_SR]
	movs	r2, #(SSP_STAT_TNF|SSP_STAT_BSY)
	ands	r3, r2
	cmp	r3, #2
	bne	TX_EMPTY_WAIT
	ldr	r3, =LPC_SSP0_BASE
	ldr	r2, [r7, #4]
	str	r2, [r3, #SSP_OFFSET_DR]
	nop
TX_COMP_WAIT:
	ldr	r3, =LPC_SSP0_BASE
	ldr	r3, [r3, #SSP_OFFSET_SR]
	movs	r2, #16
	ands	r3, r2
	bne	TX_COMP_WAIT
	nop
	nop
	mov	sp, r7
	add	sp, sp, #8
	pop	{r7, pc}
	.size	SSP0_Tx_Data_Request, .-SSP0_Tx_Data_Request



	.section	.text.SSP0_TxRxData_Request,"ax",%progbits
	.align	1
	.global	SSP0_TxRxData_Request
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	SSP0_TxRxData_Request, %function
SSP0_TxRxData_Request:
	push	{r7, lr}
	sub	sp, sp, #24
	add	r7, sp, #0
	str	r0, [r7, #12]	// uint8_t *txdata
	movs	r0, r1
	str	r2, [r7, #4]	// uint8_t tx_length
	movs	r1, r3		// r1 = uint8_t rx_length
	movs	r3, #11
	adds	r3, r7, r3
	adds	r2, r0, #0		//
	strb	r2, [r3]
	movs	r3, #10
	adds	r3, r7, r3
	adds	r2, r1, #0
	strb	r2, [r3]
	movs	r3, #23
	adds	r3, r7, r3
	movs	r2, #0
	strb	r2, [r3]	// tx_cnt = 0
	b	TX_START
TX_CNT_LOOP:
//  for(tx_cnt = 0;tx_cnt<tx_length;tx_cnt++){
	nop
TX_WAIT_LOOP:
//    while ((LPC_SSP0->SR & (SSP_STAT_TNF|SSP_STAT_BSY)) != SSP_STAT_TNF);
	ldr	r3, =LPC_SSP0_BASE
	ldr	r3, [r3, #SSP_OFFSET_SR]
	movs	r2, #(SSP_STAT_TNF|SSP_STAT_BSY)
	ands	r3, r2
	cmp	r3, #SSP_STAT_TNF
	bne	TX_WAIT_LOOP
//    LPC_SSP0->DR = txdata[tx_cnt];
	movs	r3, #23
	adds	r3, r7, r3
	ldrb	r3, [r3]
	ldr	r2, [r7, #12]		// uint8_t *txdata
	adds	r3, r2, r3
	ldrb	r2, [r3]
	ldr	r3, =LPC_SSP0_BASE
	str	r2, [r3, #SSP_OFFSET_DR]
	nop
WAIT_BSY_CLR_LOOP:
	ldr	r3, =LPC_SSP0_BASE
	ldr	r3, [r3, #SSP_OFFSET_SR]
	movs	r2, #SSP_STAT_BSY
	ands	r3, r2
	bne	WAIT_BSY_CLR_LOOP
	movs	r1, #23
	adds	r3, r7, r1
	ldrb	r2, [r3]
	adds	r3, r7, r1
	adds	r2, r2, #1
	strb	r2, [r3]
TX_START:
	movs	r3, #23
	adds	r2, r7, r3
	movs	r3, #11
	adds	r3, r7, r3
	ldrb	r2, [r2]
	ldrb	r3, [r3]
	cmp	r2, r3
	bcc	TX_CNT_LOOP
	movs	r3, #22
	adds	r3, r7, r3
	movs	r2, #0
	strb	r2, [r3]	// rx_cnt = 0
	b	RX_START
RX_CNT_LOOP:
//  for(rx_cnt = 0;rx_cnt<tx_length;rx_cnt++){
	nop
RX_WAIT_LOOP:
//    while ((LPC_SSP0->SR & SSP_STAT_RNE) != SSP_STAT_RNE);
	ldr	r3, =LPC_SSP0_BASE
	ldr	r3, [r3, #SSP_OFFSET_SR]
	movs	r2, #SSP_STAT_RNE
	ands	r3, r2
	cmp	r3, #SSP_STAT_RNE
	bne	RX_WAIT_LOOP
//    rxdata[rx_cnt] = LPC_SSP0->DR;
	ldr	r3, =LPC_SSP0_BASE
	ldr	r1, [r3, #SSP_OFFSET_DR]
	movs	r0, #22
	adds	r3, r7, r0
	ldrb	r3, [r3]
	ldr	r2, [r7, #4]	// uint8_t tx_length
	adds	r3, r2, r3
	uxtb	r2, r1
	strb	r2, [r3]
	adds	r3, r7, r0
	ldrb	r2, [r3]
	adds	r3, r7, r0
	adds	r2, r2, #1
	strb	r2, [r3]
RX_START:
	movs	r3, #22
	adds	r2, r7, r3
	movs	r3, #11
	adds	r3, r7, r3
	ldrb	r2, [r2]
	ldrb	r3, [r3]
	cmp	r2, r3
	bcc	RX_CNT_LOOP
RETURN_TX_RX:
	nop
	mov	sp, r7
	add	sp, sp, #24
	pop	{r7, pc}
	.size	SSP0_TxRxData_Request, .-SSP0_TxRxData_Request
