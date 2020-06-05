// core modules

// npm packages
const fs = require('fs');
const yargs = require('yargs');

// my files
const notes = require('./notes.js');

// ADD
yargs.command({
    command: 'add',
    describe: 'Adds a note to the list',
    builder: {
        title: {
            describe: 'Note title',
            demandOption: true,
            type: 'string'
        },
        body: {
            describe: 'Note body',
            demandOption: true,
            type: 'string'
        }
    },
    handler(argv) {
        notes.addNotes(argv.title, argv.body);
    }
});

// REMOVE
yargs.command({
    command: 'remove',
    describe: 'Removes a note from the list',
    builder: {
        title: {
            describe: 'Note title',
            demandOption: true,
            type: 'string'
        }
    },
    handler(argv) {
        notes.removeNote(argv.title);
    }
});

// READ
yargs.command({
    command: 'read',
    describe: 'Reads all notes in the list',
    builder: {
        title: {
            describe: 'Note title',
            demandOption: true,
            type: 'string'
        }
    },
    handler(argv) {
        notes.readNote(argv.title);
    }
});

// LIST
yargs.command({
    command: 'list',
    describe: 'Displays all notes in the list',
    handler: () => {
        notes.listNotes();
    }
});

// Need or yargs wont actually run
yargs.parse();