// Temp of Kelvin
const kelvin = 10;
//Celsius = K - 273
const celsius = kelvin - 273;
//Formula to convert C to F
let fahrenheit = celsius *(9/5) + 32; 
//Rounds F to whole #
fahrenheit = Math.floor(fahrenheit);
//Logs temp in F
console.log(`The temperature is ${fahrenheit} degrees Fahrenheit.`);

newton = celsius * (33/100);
newton = Math.floor(newton);
console.log(`The temperatuer is ${newton} degrees newton`);