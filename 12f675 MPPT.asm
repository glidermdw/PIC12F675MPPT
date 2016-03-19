
_Interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;12f675 MPPT.mpas,58 :: 		begin
;12f675 MPPT.mpas,59 :: 		if T0IF_bit=1 then begin
	BTFSS      T0IF_bit+0, BitPos(T0IF_bit+0)
	GOTO       L__Interrupt2
;12f675 MPPT.mpas,60 :: 		if PWM_FLAG=1 then begin
	BTFSS      _PWM_FLAG+0, BitPos(_PWM_FLAG+0)
	GOTO       L__Interrupt5
;12f675 MPPT.mpas,61 :: 		ON_PWM:=VOL_PWM;
	MOVF       _VOL_PWM+0, 0
	MOVWF      _ON_PWM+0
;12f675 MPPT.mpas,63 :: 		TMR0:=255-ON_PWM;
	MOVF       _VOL_PWM+0, 0
	SUBLW      255
	MOVWF      TMR0+0
;12f675 MPPT.mpas,64 :: 		PWM_SIG:=0;
	BCF        GP0_bit+0, BitPos(GP0_bit+0)
;12f675 MPPT.mpas,65 :: 		PWM_FLAG:=0;
	BCF        _PWM_FLAG+0, BitPos(_PWM_FLAG+0)
;12f675 MPPT.mpas,66 :: 		end else begin
	GOTO       L__Interrupt6
L__Interrupt5:
;12f675 MPPT.mpas,68 :: 		TMR0:=255-PWM_MAX+ON_PWM;
	MOVF       _ON_PWM+0, 0
	MOVWF      TMR0+0
;12f675 MPPT.mpas,69 :: 		PWM_SIG:=1;
	BSF        GP0_bit+0, BitPos(GP0_bit+0)
;12f675 MPPT.mpas,70 :: 		PWM_FLAG:=1;
	BSF        _PWM_FLAG+0, BitPos(_PWM_FLAG+0)
;12f675 MPPT.mpas,71 :: 		end;
L__Interrupt6:
;12f675 MPPT.mpas,72 :: 		T0IF_bit:=0;
	BCF        T0IF_bit+0, BitPos(T0IF_bit+0)
;12f675 MPPT.mpas,73 :: 		end;
L__Interrupt2:
;12f675 MPPT.mpas,74 :: 		end;
L_end_Interrupt:
L__Interrupt64:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _Interrupt

_main:

;12f675 MPPT.mpas,76 :: 		begin
;12f675 MPPT.mpas,77 :: 		CMCON:=7;
	MOVLW      7
	MOVWF      CMCON+0
;12f675 MPPT.mpas,78 :: 		ANSEL:=%00111100;       // ADC conversion clock = fRC, AN3, AN2;
	MOVLW      60
	MOVWF      ANSEL+0
;12f675 MPPT.mpas,80 :: 		TRISIO0_bit:=0;      // PWM
	BCF        TRISIO0_bit+0, BitPos(TRISIO0_bit+0)
;12f675 MPPT.mpas,81 :: 		TRISIO1_bit:=1;      // not Connected
	BSF        TRISIO1_bit+0, BitPos(TRISIO1_bit+0)
;12f675 MPPT.mpas,82 :: 		TRISIO2_bit:=1;      // AN2
	BSF        TRISIO2_bit+0, BitPos(TRISIO2_bit+0)
;12f675 MPPT.mpas,83 :: 		TRISIO4_bit:=1;      // AN3
	BSF        TRISIO4_bit+0, BitPos(TRISIO4_bit+0)
;12f675 MPPT.mpas,84 :: 		TRISIO5_bit:=0;      // LED
	BCF        TRISIO5_bit+0, BitPos(TRISIO5_bit+0)
;12f675 MPPT.mpas,86 :: 		LED1:=0;
	BCF        GP5_bit+0, BitPos(GP5_bit+0)
;12f675 MPPT.mpas,87 :: 		PWM_SIG:=1;
	BSF        GP0_bit+0, BitPos(GP0_bit+0)
;12f675 MPPT.mpas,88 :: 		PWM_FLAG:=1;
	BSF        _PWM_FLAG+0, BitPos(_PWM_FLAG+0)
;12f675 MPPT.mpas,89 :: 		LED1_tm:=250;
	MOVLW      250
	MOVWF      _LED1_tm+0
;12f675 MPPT.mpas,90 :: 		ON_PWM:=0;
	CLRF       _ON_PWM+0
;12f675 MPPT.mpas,91 :: 		VOL_PWM:=0;
	CLRF       _VOL_PWM+0
;12f675 MPPT.mpas,92 :: 		TICK_1000:=0;
	CLRF       _TICK_1000+0
;12f675 MPPT.mpas,93 :: 		VCFG_bit:=1;
	BSF        VCFG_bit+0, BitPos(VCFG_bit+0)
;12f675 MPPT.mpas,94 :: 		CHS1_bit:=1;
	BSF        CHS1_bit+0, BitPos(CHS1_bit+0)
;12f675 MPPT.mpas,95 :: 		ADFM_bit:=1;
	BSF        ADFM_bit+0, BitPos(ADFM_bit+0)
;12f675 MPPT.mpas,97 :: 		OPTION_REG:=%01011111;        // ~4KHz @ 4MHz
	MOVLW      95
	MOVWF      OPTION_REG+0
;12f675 MPPT.mpas,98 :: 		TMR0IE_bit:=1;
	BSF        TMR0IE_bit+0, BitPos(TMR0IE_bit+0)
;12f675 MPPT.mpas,100 :: 		LM358_diff:=cLM358_diff;
	MOVLW      4
	MOVWF      _LM358_diff+0
;12f675 MPPT.mpas,110 :: 		Delay_100ms;
	CALL       _Delay_100ms+0
;12f675 MPPT.mpas,111 :: 		LM358_diff:=EEPROM_Read(0);
	CLRF       FARG_EEPROM_Read_address+0
	CALL       _EEPROM_Read+0
	MOVF       R0+0, 0
	MOVWF      _LM358_diff+0
;12f675 MPPT.mpas,114 :: 		T1CKPS0_bit:=1;               // timer prescaler 1:2
	BSF        T1CKPS0_bit+0, BitPos(T1CKPS0_bit+0)
;12f675 MPPT.mpas,115 :: 		TMR1CS_bit:=0;
	BCF        TMR1CS_bit+0, BitPos(TMR1CS_bit+0)
;12f675 MPPT.mpas,116 :: 		TMR1L:=TMR1L_LOAD;
	MOVLW      23
	MOVWF      TMR1L+0
;12f675 MPPT.mpas,117 :: 		TMR1H:=TMR1H_LOAD;
	MOVLW      252
	MOVWF      TMR1H+0
;12f675 MPPT.mpas,119 :: 		adc_vol:=0;
	CLRF       _adc_vol+0
	CLRF       _adc_vol+1
;12f675 MPPT.mpas,120 :: 		adc_cur:=0;
	CLRF       _adc_cur+0
	CLRF       _adc_cur+1
;12f675 MPPT.mpas,121 :: 		power_curr:=0;
	CLRF       _power_curr+0
	CLRF       _power_curr+1
	CLRF       _power_curr+2
	CLRF       _power_curr+3
;12f675 MPPT.mpas,122 :: 		vol1:=0;
	CLRF       _vol1+0
;12f675 MPPT.mpas,123 :: 		vol2:=0;
	CLRF       _vol2+0
;12f675 MPPT.mpas,125 :: 		GIE_bit:=1;                   // enable Interrupt
	BSF        GIE_bit+0, BitPos(GIE_bit+0)
;12f675 MPPT.mpas,127 :: 		TMR1ON_bit:=1;
	BSF        TMR1ON_bit+0, BitPos(TMR1ON_bit+0)
;12f675 MPPT.mpas,129 :: 		VOL_PWM:=PWM_LOW;
	MOVLW      1
	MOVWF      _VOL_PWM+0
;12f675 MPPT.mpas,130 :: 		flag_inc:=True;
	MOVLW      255
	MOVWF      _flag_inc+0
;12f675 MPPT.mpas,131 :: 		adc_prev:=0;
	CLRF       _adc_prev+0
	CLRF       _adc_prev+1
;12f675 MPPT.mpas,133 :: 		while True do begin
L__main9:
;12f675 MPPT.mpas,135 :: 		if T1IF_bit=1 then begin
	BTFSS      T1IF_bit+0, BitPos(T1IF_bit+0)
	GOTO       L__main14
;12f675 MPPT.mpas,136 :: 		TMR1H:=TMR1H_LOAD;
	MOVLW      252
	MOVWF      TMR1H+0
;12f675 MPPT.mpas,137 :: 		TMR1L:=TMR1L_LOAD;
	MOVLW      23
	MOVWF      TMR1L+0
;12f675 MPPT.mpas,138 :: 		T1IF_bit:=0;
	BCF        T1IF_bit+0, BitPos(T1IF_bit+0)
;12f675 MPPT.mpas,139 :: 		Inc(TICK_1000);
	INCF       _TICK_1000+0, 1
;12f675 MPPT.mpas,140 :: 		if TICK_1000>=LED1_tm then begin
	MOVF       _LED1_tm+0, 0
	SUBWF      _TICK_1000+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L__main17
;12f675 MPPT.mpas,141 :: 		LED1:=not LED1;
	MOVLW
	XORWF      GP5_bit+0, 1
;12f675 MPPT.mpas,142 :: 		TICK_1000:=0;
	CLRF       _TICK_1000+0
;12f675 MPPT.mpas,143 :: 		end;
L__main17:
;12f675 MPPT.mpas,144 :: 		end;
L__main14:
;12f675 MPPT.mpas,145 :: 		if (VOL_PWM>=(PWM_MAX-1)) then
	MOVLW      254
	SUBWF      _VOL_PWM+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L__main20
;12f675 MPPT.mpas,146 :: 		LED1_tm:=64
	MOVLW      64
	MOVWF      _LED1_tm+0
	GOTO       L__main21
;12f675 MPPT.mpas,147 :: 		else if (VOL_PWM=PWM_LOW) then
L__main20:
	MOVF       _VOL_PWM+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L__main23
;12f675 MPPT.mpas,148 :: 		LED1_tm:=90
	MOVLW      90
	MOVWF      _LED1_tm+0
	GOTO       L__main24
;12f675 MPPT.mpas,149 :: 		else
L__main23:
;12f675 MPPT.mpas,150 :: 		LED1_tm:=120;
	MOVLW      120
	MOVWF      _LED1_tm+0
L__main24:
L__main21:
;12f675 MPPT.mpas,152 :: 		power_prev:=power_curr;
	MOVF       _power_curr+0, 0
	MOVWF      _power_prev+0
	MOVF       _power_curr+1, 0
	MOVWF      _power_prev+1
	MOVF       _power_curr+2, 0
	MOVWF      _power_prev+2
	MOVF       _power_curr+3, 0
	MOVWF      _power_prev+3
;12f675 MPPT.mpas,153 :: 		adc_prev:=adc_cur;
	MOVF       _adc_cur+0, 0
	MOVWF      _adc_prev+0
	MOVF       _adc_cur+1, 0
	MOVWF      _adc_prev+1
;12f675 MPPT.mpas,155 :: 		adc_vol:=0;
	CLRF       _adc_vol+0
	CLRF       _adc_vol+1
;12f675 MPPT.mpas,156 :: 		adc_cur:=0;
	CLRF       _adc_cur+0
	CLRF       _adc_cur+1
;12f675 MPPT.mpas,157 :: 		for i:=0 to adc_max_loop-1 do begin
	CLRF       _i+0
L__main26:
;12f675 MPPT.mpas,158 :: 		adc_cur:=adc_cur+ADC_Read(2);
	MOVLW      2
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	ADDWF      _adc_cur+0, 1
	MOVF       R0+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      _adc_cur+1, 1
;12f675 MPPT.mpas,159 :: 		adc_vol:=adc_vol+ADC_Read(3);
	MOVLW      3
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	ADDWF      _adc_vol+0, 1
	MOVF       R0+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      _adc_vol+1, 1
;12f675 MPPT.mpas,160 :: 		end;
	MOVF       _i+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L__main29
	INCF       _i+0, 1
	GOTO       L__main26
L__main29:
;12f675 MPPT.mpas,161 :: 		adc_vol:=adc_vol div adc_max_loop;
;12f675 MPPT.mpas,162 :: 		adc_cur:=adc_cur div adc_max_loop;
;12f675 MPPT.mpas,164 :: 		if adc_cur>LM358_diff then
	MOVF       _adc_cur+1, 0
	SUBLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__main66
	MOVF       _adc_cur+0, 0
	SUBWF      _LM358_diff+0, 0
L__main66:
	BTFSC      STATUS+0, 0
	GOTO       L__main31
;12f675 MPPT.mpas,165 :: 		adc_cur:=adc_cur-LM358_diff
	MOVF       _LM358_diff+0, 0
	SUBWF      _adc_cur+0, 1
	BTFSS      STATUS+0, 0
	DECF       _adc_cur+1, 1
	GOTO       L__main32
;12f675 MPPT.mpas,166 :: 		else
L__main31:
;12f675 MPPT.mpas,167 :: 		adc_cur:=0;
	CLRF       _adc_cur+0
	CLRF       _adc_cur+1
L__main32:
;12f675 MPPT.mpas,169 :: 		if adc_cur>0 then begin
	MOVF       _adc_cur+1, 0
	SUBLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__main67
	MOVF       _adc_cur+0, 0
	SUBLW      0
L__main67:
	BTFSC      STATUS+0, 0
	GOTO       L__main34
;12f675 MPPT.mpas,170 :: 		power_curr:= adc_cur * adc_vol;
	MOVF       _adc_cur+0, 0
	MOVWF      R0+0
	MOVF       _adc_cur+1, 0
	MOVWF      R0+1
	CLRF       R0+2
	CLRF       R0+3
	MOVF       _adc_vol+0, 0
	MOVWF      R4+0
	MOVF       _adc_vol+1, 0
	MOVWF      R4+1
	CLRF       R4+2
	CLRF       R4+3
	CALL       _Mul_32x32_U+0
	MOVF       R0+0, 0
	MOVWF      _power_curr+0
	MOVF       R0+1, 0
	MOVWF      _power_curr+1
	MOVF       R0+2, 0
	MOVWF      _power_curr+2
	MOVF       R0+3, 0
	MOVWF      _power_curr+3
;12f675 MPPT.mpas,171 :: 		if power_curr=power_prev then begin
	MOVF       R0+3, 0
	XORWF      _power_prev+3, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main68
	MOVF       R0+2, 0
	XORWF      _power_prev+2, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main68
	MOVF       R0+1, 0
	XORWF      _power_prev+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main68
	MOVF       R0+0, 0
	XORWF      _power_prev+0, 0
L__main68:
	BTFSS      STATUS+0, 2
	GOTO       L__main37
;12f675 MPPT.mpas,176 :: 		if adc_cur>adc_prev then begin
	MOVF       _adc_cur+1, 0
	SUBWF      _adc_prev+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main69
	MOVF       _adc_cur+0, 0
	SUBWF      _adc_prev+0, 0
L__main69:
	BTFSC      STATUS+0, 0
	GOTO       L__main40
;12f675 MPPT.mpas,177 :: 		flag_inc:=False;
	CLRF       _flag_inc+0
;12f675 MPPT.mpas,178 :: 		Inc_pwm:=1;
	MOVLW      1
	MOVWF      _Inc_pwm+0
;12f675 MPPT.mpas,179 :: 		end else
	GOTO       L__main41
L__main40:
;12f675 MPPT.mpas,180 :: 		if adc_cur<adc_prev then begin
	MOVF       _adc_prev+1, 0
	SUBWF      _adc_cur+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main70
	MOVF       _adc_prev+0, 0
	SUBWF      _adc_cur+0, 0
L__main70:
	BTFSC      STATUS+0, 0
	GOTO       L__main43
;12f675 MPPT.mpas,181 :: 		flag_inc:=True;
	MOVLW      255
	MOVWF      _flag_inc+0
;12f675 MPPT.mpas,182 :: 		Inc_pwm:=1;
	MOVLW      1
	MOVWF      _Inc_pwm+0
;12f675 MPPT.mpas,183 :: 		end else begin
	GOTO       L__main44
L__main43:
;12f675 MPPT.mpas,184 :: 		Inc_pwm:=0;
	CLRF       _Inc_pwm+0
;12f675 MPPT.mpas,185 :: 		LED1_tm:=240;
	MOVLW      240
	MOVWF      _LED1_tm+0
;12f675 MPPT.mpas,186 :: 		flag_inc:=not flag_inc;
	COMF       _flag_inc+0, 1
;12f675 MPPT.mpas,187 :: 		end;
L__main44:
L__main41:
;12f675 MPPT.mpas,188 :: 		end else begin
	GOTO       L__main38
L__main37:
;12f675 MPPT.mpas,189 :: 		if Inc_pwm<Inc_Pwm_Max then
	MOVLW      14
	SUBWF      _Inc_pwm+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L__main46
;12f675 MPPT.mpas,190 :: 		Inc(Inc_pwm);
	INCF       _Inc_pwm+0, 1
L__main46:
;12f675 MPPT.mpas,191 :: 		if power_curr<power_prev then begin
	MOVF       _power_prev+3, 0
	SUBWF      _power_curr+3, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main71
	MOVF       _power_prev+2, 0
	SUBWF      _power_curr+2, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main71
	MOVF       _power_prev+1, 0
	SUBWF      _power_curr+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main71
	MOVF       _power_prev+0, 0
	SUBWF      _power_curr+0, 0
L__main71:
	BTFSC      STATUS+0, 0
	GOTO       L__main49
;12f675 MPPT.mpas,196 :: 		vol1:=vol2;
	MOVF       _vol2+0, 0
	MOVWF      _vol1+0
;12f675 MPPT.mpas,197 :: 		vol2:=VOL_PWM;
	MOVF       _VOL_PWM+0, 0
	MOVWF      _vol2+0
;12f675 MPPT.mpas,198 :: 		flag_inc:=not flag_inc;
	COMF       _flag_inc+0, 1
;12f675 MPPT.mpas,200 :: 		if (vol1<>0) and (vol2<>0) then begin
	MOVF       _vol1+0, 0
	XORLW      0
	MOVLW      255
	BTFSC      STATUS+0, 2
	MOVLW      0
	MOVWF      R1+0
	MOVF       _VOL_PWM+0, 0
	XORLW      0
	MOVLW      255
	BTFSC      STATUS+0, 2
	MOVLW      0
	MOVWF      R0+0
	MOVF       R1+0, 0
	ANDWF      R0+0, 1
	BTFSC      STATUS+0, 2
	GOTO       L__main52
;12f675 MPPT.mpas,201 :: 		Inc_pwm:=0;
	CLRF       _Inc_pwm+0
;12f675 MPPT.mpas,202 :: 		VOL_PWM:=(vol1+vol2) div 2;
	MOVF       _vol2+0, 0
	ADDWF      _vol1+0, 0
	MOVWF      _VOL_PWM+0
	RRF        _VOL_PWM+0, 1
	BCF        _VOL_PWM+0, 7
;12f675 MPPT.mpas,203 :: 		vol2:=0;
	CLRF       _vol2+0
;12f675 MPPT.mpas,204 :: 		continue;
	GOTO       L__main9
;12f675 MPPT.mpas,205 :: 		end;
L__main52:
;12f675 MPPT.mpas,206 :: 		end else
	GOTO       L__main50
L__main49:
;12f675 MPPT.mpas,207 :: 		vol2:=0;
	CLRF       _vol2+0
L__main50:
;12f675 MPPT.mpas,208 :: 		end;
L__main38:
;12f675 MPPT.mpas,209 :: 		end else begin
	GOTO       L__main35
L__main34:
;12f675 MPPT.mpas,211 :: 		power_curr:=0;
	CLRF       _power_curr+0
	CLRF       _power_curr+1
	CLRF       _power_curr+2
	CLRF       _power_curr+3
;12f675 MPPT.mpas,212 :: 		Inc_pwm:=Inc_Pwm_Max;
	MOVLW      14
	MOVWF      _Inc_pwm+0
;12f675 MPPT.mpas,213 :: 		flag_inc:=True;
	MOVLW      255
	MOVWF      _flag_inc+0
;12f675 MPPT.mpas,214 :: 		vol2:=0;
	CLRF       _vol2+0
;12f675 MPPT.mpas,215 :: 		end;
L__main35:
;12f675 MPPT.mpas,217 :: 		if flag_inc then begin
	MOVF       _flag_inc+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L__main55
;12f675 MPPT.mpas,218 :: 		if VOL_PWM<(PWM_MAX-Inc_pwm) then begin
	MOVF       _Inc_pwm+0, 0
	SUBLW      255
	MOVWF      R1+0
	MOVF       R1+0, 0
	SUBWF      _VOL_PWM+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L__main58
;12f675 MPPT.mpas,219 :: 		VOL_PWM:=VOL_PWM+Inc_pwm;
	MOVF       _Inc_pwm+0, 0
	ADDWF      _VOL_PWM+0, 1
;12f675 MPPT.mpas,220 :: 		end else
	GOTO       L__main59
L__main58:
;12f675 MPPT.mpas,221 :: 		VOL_PWM:=PWM_MAX;
	MOVLW      255
	MOVWF      _VOL_PWM+0
L__main59:
;12f675 MPPT.mpas,222 :: 		end else begin
	GOTO       L__main56
L__main55:
;12f675 MPPT.mpas,223 :: 		if VOL_PWM>(PWM_LOW+(Inc_Pwm_Max+1-Inc_pwm)) then begin
	MOVF       _Inc_pwm+0, 0
	SUBLW      15
	MOVWF      R0+0
	INCF       R0+0, 0
	MOVWF      R1+0
	MOVF       _VOL_PWM+0, 0
	SUBWF      R1+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L__main61
;12f675 MPPT.mpas,224 :: 		VOL_PWM:=VOL_PWM-(Inc_Pwm_Max+1-Inc_pwm);
	MOVF       _Inc_pwm+0, 0
	SUBLW      15
	MOVWF      R0+0
	MOVF       R0+0, 0
	SUBWF      _VOL_PWM+0, 1
;12f675 MPPT.mpas,225 :: 		end else
	GOTO       L__main62
L__main61:
;12f675 MPPT.mpas,226 :: 		VOL_PWM:=PWM_LOW;
	MOVLW      1
	MOVWF      _VOL_PWM+0
L__main62:
;12f675 MPPT.mpas,227 :: 		end;
L__main56:
;12f675 MPPT.mpas,228 :: 		end;
	GOTO       L__main9
;12f675 MPPT.mpas,229 :: 		end.
L_end_main:
	GOTO       $+0
; end of _main
