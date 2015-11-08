//Declare variables for getting the controls
var control_happiness;
var output_happiness;

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

	if(control_happiness.value <= 5){
		output_happiness.innerHTML = "Desperately Unhappy";
	}
	else if(control_happiness.value <= 15){
		output_happiness.innerHTML = "Very Unhappy";
	}
	else if(control_happiness.value <= 25){
		output_happiness.innerHTML = "Unhappy";
	}
	else if(control_happiness.value <= 35){
		output_happiness.innerHTML = "Passable";
	}
	else if(control_happiness.value <= 45){
		output_happiness.innerHTML = "Quite OK";
	}
	else if(control_happiness.value <= 55){
		output_happiness.innerHTML = "OK";
	}
	else if(control_happiness.value <= 65){
		output_happiness.innerHTML = "Content";
	}
	else if(control_happiness.value <= 75){
		output_happiness.innerHTML = "Cheerful";
	}
	else if(control_happiness.value <= 85){
		output_happiness.innerHTML = "Happy";
	}
	else if(control_happiness.value <= 95){
		output_happiness.innerHTML = "Delighted";
	}
	else if(control_happiness.value == 100){
		output_happiness.innerHTML = "Blissful";
	}
}

//Register the window on load callback
window.onload = initialize;