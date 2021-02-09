use std::ffi::{CStr, CString};
use std::os::raw::c_char;

pub trait StrFFI {
    fn to_c_char(&self) -> *const c_char;
}

pub trait CCharFFI {
    fn to_str(&self) -> &'static str;
}

impl StrFFI for str {
    fn to_c_char(&self) -> *const c_char {
        CString::new(self.as_bytes())
            .expect("qffi::to not w-working🥺")
            .to_owned()
            .as_ptr()
    }
}

impl CCharFFI for *const c_char {
    fn to_str(&self) -> &'static str {
        unsafe {
            &CStr::from_ptr(*self)
                .to_str()
                .expect("qffi::from not w-working🥺")
        }
    }
}
