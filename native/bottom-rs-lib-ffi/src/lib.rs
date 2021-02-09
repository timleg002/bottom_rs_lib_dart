mod qffi;

extern crate libc;

mod lib {
    use crate::qffi::*;
    use bottom_rs_lib::bottom;
    use libc::c_char;

    #[no_mangle]
    pub extern "C" fn encode_byte(value: u8) -> *const c_char {
        bottom::encode_byte(value).to_c_char()
    }

    #[no_mangle]
    pub extern "C" fn decode_byte(input: *const c_char) -> u8 {
        bottom::decode_byte(&input.to_str()).expect("translation not w-working🥺")
    }

    #[no_mangle]
    pub extern "C" fn encode_string(input: *const c_char) -> *const c_char {
        bottom::encode_string(&input.to_str()).to_c_char()
    }

    #[no_mangle]
    pub extern "C" fn decode_string(input: *const c_char) -> *const c_char {
        bottom::decode_string(&input.to_str())
            .expect("translation not w-working🥺")
            .to_c_char()
    }
}
