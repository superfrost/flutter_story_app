const e = require('express');
const express = require('express');
const app = express();
const PORT = 5000;


const story = [
    { // 0
        text: "You are hunting in the jungle, trying to find tiger. Suddenly you hearing crunch of branches right behind of you...",
        answer1: "Turn around quickly and shoot not aiming. Boom... Boom...",
        next1: 1,
        answer2: "Stop holding your breath and prepare to react quickly...",
        next2: 2,
    },
    { // 1
        text: "Moment later you hear loud scream of a man. Seems he injured very badly...",
        answer1: "Try to help him...",
        next1: 5,
        answer2: "Turn around and run out here... Your hunt is over...",
        next2: 4,
    },
    { // 2
        text: "You hear quiet voice of two men. They almost near you, but don't see you. They have a guns.",
        answer1: "Don't move... Wait until they walk away...",
        next1: 3,
        answer2: "Try to scare them shooting near them...",
        next2: 8,
    },
    { // 3
        text: "They slowly go away... Seems they hunting too... But now you can hear someones deep breath near your head...",
        answer1: "Try to shoot behind you as quickly as possible.",
        next1: 7,
        answer2: "Try to scream as loud as possible.",
        next2: 7,
    },
    { // 4
        text: "You return to the town... Seems everybody now what you did... You are murderer...",
        answer1: "Go to the police...",
        next1: 0,
        answer2: "Go to the church...",
        next2: 999,
    },
    { // 5
        text: "You see that you can't help him... There a lot of blood around...",
        answer1: "I'm a murderer...",
        next1: 4,
        answer2: "Try to scream and call some one to help you...",
        next2: 6,
    },
    { // 6
        text: "Your сry is heard by the tiger... He attacked you... Now there two killed men.",
        answer1: "You hear your bones crunch when the tiger eats you.",
        next1: 0,
        answer2: "What an unenviable end to your life...",
        next2: 0,
    },
    { // 7
        text: "Tiger killed you very quickly... Now nobody can help you...",
        answer1: "You hear your bones crunch when the tiger eats you.",
        next1: 0,
        answer2: "What an unenviable end to your life...",
        next2: 0,
    },
    { // 8
        text: "After unlucky shoot you injured man and a firefight began... Nobody let you get out here...",
        answer1: "Try to kill them all...",
        next1: 9,
        answer2: "Try to run out to save your life...",
        next2: 9,
    },
    { // 9
        text: "You get shoot in the jungle... One more dead man... Nobody care...",
        answer1: "So sorry this is the end.",
        next1: 0,
        answer2: "What an unenviable end to your life...",
        next2: 0,
    },
]
app.enable('trust proxy');
app.get('/', (req, res) => {
    console.log(Date.now(), req.ip, req.url);
    res.status(200).json(story);
})

app.listen(PORT, () => {
    console.log(`Server starts at http://localhost:${PORT}`)
})