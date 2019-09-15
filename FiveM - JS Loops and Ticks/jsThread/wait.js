// same as `Citizen.Wait()` with await and async
Wait = (ms) => new Promise(resolve =>  setTimeout(resolve, ms))

