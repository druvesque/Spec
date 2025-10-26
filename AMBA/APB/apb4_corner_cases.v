// Case 1: 
//     Q. During a write transfer in APB, let's say, the data is 4 bytes (32
//     bits), and while transferring the PSTRB signal, one of the byte lanes
//     indicate that the data is invalid. Let's assume PSTRB signal is 1011.
//
//     a) Does the write operation still happen?
//     b) If it does happen, what happens in the memory location where the
//     strobe signal was 0? (The provided data on the byte lane is not
//     written, that much is clear, do rest of byte lanes are written in the
//     memory or are they abandoned too? Or at that byte lane, the previous
//     data stays as it is, and the rest of the byte lanes with 1 at their 
//     STRB position is updated? If this is the case, how is the next read
//     operation at the same position carried out, wouldn't it be
//     corrupted? 
//
//     c) What response is sent on the PSLVERR? (Does it give an error or
//     does it show a successful transaction?)
//
//     d) Again, what happens when we perform subsequent read operation on
//     the same memory? (Corrupted data? Unupdated data? {How will the user
//     know this?})
//
//     In my opinion: As soon as 0 is encountered on any of the byte lanes in
//     the PSTRB signal, the transaction should be aborted. 
