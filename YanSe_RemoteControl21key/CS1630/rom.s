	list c=on
	extern _get_rolling_code_0
	extern _get_rolling_code_1
	extern _get_rolling_code_2
	extern _get_rolling_code_3

	org 0x07B0
_get_rolling_code_0:
		retia	0x00		; address = 0x0e

_get_rolling_code_1:
		retia	0x00		; address = 0x0f

_get_rolling_code_2:
		retia	0x00		; address = 0x10

_get_rolling_code_3:
		retia	0x00		; address = 0x11

	end
