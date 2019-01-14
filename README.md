# FRC Deep Space hatch-cargo-select
A custom HTML Element to track the Deep Space Hatch/Cargo hold events.

## Dependencies

 - [RiotJS](https://riot.js.org/) for creating the HTMLElement
 - [MaterializeCSS](https://materializecss.com/) for styling 

## Status Codes
the result status code is in the form of
**"identifier"-"hatch status"-"cargo status"**

|Hatch/Cargo Status| Description |
|--|--|
| H | normal hatch mounted  |
| SSH | hatch mounted during sandstorm
|PREH| Null Hatch loaded during staging|
| C|normal play cargo loaded|
|SSC|cargo load during sandstorm|
|PRES|cargo loaded during staging|

example:
**RLF2-SSH-C** 
position RLF2  has a hatch loaded during sandstorm and cargo loaded during  normal play

**RLF3-PREH-SSC** 
position RLF3  has a null hatch loaded staging and cargo loaded during sandstorm

## Basic Usage

    <head>
	    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
	    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
	    <script src="/material-hatch-select.tag" type="riot/tag"></script>
	    <script src="https://cdnjs.cloudflare.com/ajax/libs/riot/3.13.2/riot+compiler.min.js"></script>
	</head> 
	<body>   
	
	    <hatch-cargo-select position="RLF2"></hatch-cargo-select>
	
     <script>
         // load the RiotJS elements
	     riot.mount('hatch-cargo-select');
     </script>
</body>

the result element will have an input with class "hatch_cargo"

you can get all the input values using the following code:

    var elementsArray = document.querySelectorAll('input.hatch_cargo');
    elementsArray.forEach(function(input) {
       console.log(input.value);
    });


## Demo
A sample page layout with multiple cargo inputs be found [here](https://steelhawks.github.io/deep-space-cargo-select-input/)
