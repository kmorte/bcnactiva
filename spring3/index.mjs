import * as fs from 'fs';
import {deflate, unzip} from 'zlib';
import { exec, spawn } from 'child_process';
import path from 'path';
/*
*   NIVELL 1
*/
// Exercici 1
setTimeout( () => setInterval( () => console.log('Kevin Morte'), 1000), 6000)

// Exercici 2
const newFile = fs.createWriteStream('filename.txt', 'utf-8')
newFile.write('El meu nom es Kevin Morte')

// Exercici 3
setTimeout(() => {
    
    const readFile = fs.readFileSync('filename.txt', 'utf-8')
    console.log(readFile);

}, 8000)

/*
*   NIVELL 2
*/
// Exercici 1
setTimeout( () => {
    // console.log(newFile2);
    deflate('filename.txt', (err, buffer) => {
        if(err) console.log('Hi ha hagut algun tipus d\'error');
        if(!err) {

            const compress = buffer.toString('base64')
            console.log(buffer.toString('base64'));
        }
    })

}, 4000)

/*
*   NIVELL 3
*/
// Exercici 1

setTimeout( () => {
    
    const __dirname = path.resolve();
    fs.readdir(__dirname, (err, files) => {
        files.map( file => console.log(file))
    })

}, 6000)