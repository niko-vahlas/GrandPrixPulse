import * as THREE from 'three';
import { GLTFLoader } from 'three/addons/loaders/GLTFLoader.js';
import { OrbitControls } from 'three/addons/controls/OrbitControls.js';

const scene = new THREE.Scene();
const camera = new THREE.PerspectiveCamera( 75, window.innerWidth / window.innerHeight, 0.1, 1000 );

const renderer = new THREE.WebGLRenderer();
renderer.setSize( window.innerWidth, window.innerHeight );
document.body.appendChild( renderer.domElement );

// const geometry = new THREE.BoxGeometry( 1, 1, 1 );
// const material = new THREE.MeshBasicMaterial( { color: 0x00ff00 } );
// const cube = new THREE.Mesh( geometry, material );
// scene.add( cube );

const loader = new GLTFLoader();

const controls = new OrbitControls( camera, renderer.domElement );

loader.load( './assets/model/source/mp44.gltf', function ( gltf ) {

	scene.add( gltf.scene );

}, undefined, function ( error ) {

	console.error( error );

} );

let ambientLight = new THREE.AmbientLight( 0xffffff , .2);
scene.add( ambientLight );

camera.position.z = 5;

renderer.shadowMap.enabled = true;
renderer.shadowMap.type = THREE.PCFSoftShadowMap; // 

let directionalLight_top = new THREE.DirectionalLight( 0xffffff, 3 );
directionalLight_top.castShadow = true;
directionalLight_top.position.x = 2;
directionalLight_top.position.y = 5;
directionalLight_top.position.z = 0;

directionalLight_top.shadow.bias = -0.0001;
directionalLight_top.shadow.mapSize.width = 256;
directionalLight_top.shadow.mapSize.height = 256;
directionalLight_top.shadow.camera.near = 0.1;
directionalLight_top.shadow.camera.far = 100.0;
directionalLight_top.shadow.camera.left = 100;
directionalLight_top.shadow.camera.right = -100;
directionalLight_top.shadow.camera.top = 100;
directionalLight_top.shadow.camera.bottom = -100;
scene.add(directionalLight_top);

function animate() {
	requestAnimationFrame( animate );

	// cube.rotation.x += 0.01;
	// cube.rotation.y += 0.01;

	renderer.render( scene, camera );
}

animate();