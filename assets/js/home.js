//Declare variables for getting the controls
var control_happiness;
var output_happiness;

//declare the colors
var red = 255;
var green = 255;

function initialize() {
	//Get the hapiness control and its output by id
	control_happiness = document.getElementById('control_happiness');
	output_happiness = document.getElementById('output_happiness');
	
	//Call the function to update the happiness now, just in case the page is cached
	update_happiness();
}

//Declare a function to update hapiness
function update_happiness(){
	
	output_happiness.innerHTML = control_happiness.value;

	if(control_happiness.value == 0){
		output_happiness.innerHTML = "Depressed";
	}
	else if(control_happiness.value <= 20){
		output_happiness.innerHTML = "Very Sad";
	}
	else if(control_happiness.value <= 40){
		output_happiness.innerHTML = "Sad";
	}
	else if(control_happiness.value <= 60){
		output_happiness.innerHTML = "OK";
	}
	else if(control_happiness.value <= 80){
		output_happiness.innerHTML = "Happy";
	}
	else if(control_happiness.value <= 99){
		output_happiness.innerHTML = "Very Happy";
	}
	else{
		output_happiness.innerHTML = "Delighted";
	}
	
	output_happiness.innerHTML += ": " + control_happiness.value + "%";
	
	if(control_happiness.value >=50){
		green = 255;
		red = lerp(255, 0, control_happiness.value/50) + 255;
	}  
	else{
		green = lerp(0, 255, control_happiness.value/50);
		red = 255;
	}
	
	output_happiness.style.color = "rgb(" + red + "," + green + ", 0)";
	
}

//This function was retrieved from the Linear Interpolation Wikipedia entry
function lerp(v0, v1, t) {
  return (1-t)*v0 + t*v1;
}


//Register the window on load callback
window.onload = initialize;

/*
Exception: SyntaxError: expected expression, got '='
@Scratchpad/1:26
*/