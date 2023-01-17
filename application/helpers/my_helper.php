<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

if ( ! function_exists('random')){
function random(){
$number = rand(1111,9999);
return $number;
}
}

if ( ! function_exists('current_utc_date_time')){
function current_utc_date_time(){
$dateTime = gmdate("Y-m-d\TH:i:s\Z");;
return $dateTime;
}
}  

if ( ! function_exists('get_current_shift')){
function get_current_shift(){
	date_default_timezone_set('Asia/Karachi');
	$hour = date('H');
	if($hour >= 8 && $hour < 14) {
	$c_shift = 'Morning';
	} else if($hour >= 14 && $hour < 20) {
	$c_shift = 'Evening';
	} else if($hour >= 20 && $hour < 24) {
	$c_shift = 'Night';
	} else if($hour >= 0 && $hour < 8) {
	$c_shift = 'Night';
	}
return $c_shift;
}
} 

if ( ! function_exists('check_shift')){
function check_shift($shift){
	date_default_timezone_set('Asia/Karachi');
	$hour = date('H');
	if($hour >= 8 && $hour < 14) {
	$c_shift = 'Morning';
	} else if($hour >= 14 && $hour < 20) {
	$c_shift = 'Evening';
	} else if($hour >= 20 && $hour < 24) {
	$c_shift = 'Night';
	} else if($hour >= 0 && $hour < 8) {
	$c_shift = 'Night';
	}
	
	if($c_shift == $shift)
	return true;
	else
	return false;
}
} 