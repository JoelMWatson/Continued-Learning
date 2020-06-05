const fs = require('fs');
const chalk = require('chalk');

const getNotes = () => {
    return "Your Notes...";
};

const addNotes = (title, body) => {
    const notes = loadNotes();
    const dupeNote = notes.find((note) => note.title === title);

    // debugger;

    // No dupes found
    if (!dupeNote) {
        notes.push({
            title: title,
            body: body
        });
        saveNotes(notes);
        console.log(chalk.green("Note successfully added."));
    } else {
        console.log(chalk.red(`Note title: (${title}) already in use.`))
    }
};


const removeNote = (title) => {
    const notes = loadNotes();
    const newNotes = notes.filter((note) => note.title !== title);

    // was removed
    if (newNotes.length < notes.length) {
        console.log(chalk.green("Note successfully removed."));
        saveNotes(newNotes);
    } else {
        console.log(chalk.red(`Note title: (${title}) was not found.`));
    }
};

const listNotes = () => {
    const notes = loadNotes();
    console.log(chalk.blue("Your Notes"));
    notes.forEach((note) => {
        console.log(`${chalk.magenta(note.title)} : ${note.body}`);
    });
};

const readNote = (title) =>  {
    const notes = loadNotes();
    const foundNote = notes.find((note) => note.title === title);

    if (foundNote) {
        console.log(`${chalk.magenta(foundNote.title)} : ${foundNote.body}`);
    } else {
        console.log(chalk.red(`Note title: (${title}) was not found.`));
    }
};

const saveNotes = (notes) => {
    fs.writeFileSync("notes.json", JSON.stringify(notes));
};

const loadNotes = function() {
    try {
        const dataBuffer = fs.readFileSync('notes.json');
        const dataJSON = dataBuffer.toString();
        return JSON.parse(dataJSON);
    } catch (error) {
        return [];
    }
};


module.exports = {
    getNotes: getNotes,
    addNotes: addNotes,
    removeNote: removeNote,
    listNotes: listNotes,
    readNote: readNote
};