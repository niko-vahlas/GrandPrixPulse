import * as THREE from 'three';
import { GLTFLoader } from 'three/addons/loaders/GLTFLoader.js';
import { OrbitControls } from 'three/addons/controls/OrbitControls.js';

const scene = new THREE.Scene();
const camera = new THREE.PerspectiveCamera( 75, window.innerWidth / window.innerHeight, 0.1, 1000 );

const canvas = document.getElementById("render-canvas");
const renderer = new THREE.WebGLRenderer({ canvas: canvas, antialias: true, alpha: true});
renderer.setSize( window.innerWidth, window.innerHeight );

const loader = new GLTFLoader();

const controls = new OrbitControls( camera, renderer.domElement );

loader.load( './assets/model/source/mp44.gltf', function ( gltf ) {

	scene.add( gltf.scene );

}, undefined, function ( error ) {

	console.error( error );

} );

let ambientLight = new THREE.AmbientLight( 0xffffff , .2);
scene.add( ambientLight );

renderer.shadowMap.enabled = true;
renderer.shadowMap.type = THREE.PCFSoftShadowMap; // 

let light1 = new THREE.DirectionalLight( 0xffffff, 1.5 );
light1.castShadow = true;
light1.position.x = 3;
light1.position.y = 5;
light1.position.z = 3;
light1.shadow.bias = -0.0001;
light1.shadow.mapSize.width = 256;
light1.shadow.mapSize.height = 256;
light1.shadow.camera.near = 0.1;
light1.shadow.camera.far = 100.0;
light1.shadow.camera.left = 100;
light1.shadow.camera.right = -100;
light1.shadow.camera.top = 100;
light1.shadow.camera.bottom = -100;
scene.add(light1);

let light2 = new THREE.DirectionalLight( 0xffffff, 1.5 );
light2.castShadow = true;
light2.position.x = -3;
light2.position.y = 5;
light2.position.z = -3;
light2.shadow.bias = -0.0001;
light2.shadow.mapSize.width = 256;
light2.shadow.mapSize.height = 256;
light2.shadow.camera.near = 0.1;
light2.shadow.camera.far = 100.0;
light2.shadow.camera.left = 100;
light2.shadow.camera.right = -100;
light2.shadow.camera.top = 100;
light2.shadow.camera.bottom = -100;
scene.add(light2);


camera.position.x = -13.651946679824615;
camera.position.y = 3;
camera.position.z = -17.5920718905439;

var period = 20;
var clock = new THREE.Clock();
var matrix = new THREE.Matrix4();


function animate() {
	requestAnimationFrame( animate );

	matrix.makeRotationY(clock.getDelta() * 2 * Math.PI / period);

	camera.position.applyMatrix4(matrix);

	camera.lookAt(-0.5017274538153408, 5.006441410947539, 1.4507785714245471);

	renderer.render( scene, camera );
}

animate();