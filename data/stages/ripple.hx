import funkin.backend.shaders.FunkinShader;
import flixel.FlxCamera;
import flixel.FlxCameraFollowStyle;
import openfl.filters.ShaderFilter;

var rippleShader;
var bgCam:FlxCamera;

function postCreate()
{
	rippleShader = new CustomShader("ripple");
	rippleShader.iTime = 0;
	rippleShader.speed = 4.0;
	rippleShader.distortionAmount = 0.0125;
	rippleShader.distortionIntensity = 6.0;
	
	bgCam = new FlxCamera(0, 0, FlxG.width, FlxG.height);
	bgCam.bgColor = FlxColor.BLACK;
	camGame.bgColor = FlxColor.TRANSPARENT;
	FlxG.cameras.insert(bgCam, 0, false);

	remove(bg);
	bg.cameras = [bgCam];
	add(bg);
	bgCam.addShader((rippleShader));
}

var tot:Float = 0;

function update(e)
{
	bgCam.zoom = FlxG.camera.zoom;
	bgCam.scroll = FlxG.camera.scroll;

	tot += e;
	rippleShader.iTime = tot;
}