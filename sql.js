/**
 * Created by egors on 20.05.2016.
 */
var mysql      = require('mysql');

function getWeekDay(date) {
    var days = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'];
    return days[date.getDay()];
}

function createSelect() {
    //Получение названия дня недели
    var date = new Date(); //текущая дата
    var nameDay = getWeekDay(date);
    //Опознание четности
    var parity;
    var year = new Date().getFullYear();
    var month = new Date().getMonth();
    var today = new Date(year, month, 0).getTime();
    var now = new Date().getTime();
    var week = Math.round((now - today) / (1000 * 60 * 60 * 24 * 7));
    if (week % 2) {
        parity = 0;
    } else {
        parity = 1;
    }
    var select = 'SELECT * FROM schedule WHERE ' +
        '( Room = (SELECT codeHall FROM map.room WHERE room.numberHall=?)' +
        ' AND Weekday = (SELECT dayCode FROM map.weekday WHERE weekday.dayName ' +
        '= "' +  nameDay +
        '" AND weekday.parity = ' + parity + '))';
    return select;
}
function createID(id) {
    var roomId;
    if((id.indexOf('_1') + 1))
        roomId = id.substr(0, 4) + '.1';
    else if((id.indexOf('_2') + 1))
        roomId = id.substr(0, 4) + '.2';
    else
        roomId = id.substr(0, 4) + '.0';
    return roomId;
}
var selectToRoom = createSelect();
var selectToCorp = 'SELECT * FROM territory WHERE nameHouse=?';

module.exports = {
    getDataFromCorp:function (id, res) {
        var connection = mysql.createConnection({
            host     : 'localhost',
            user     : 'egorsh',
            password : '787898',
            database : 'map'
        });

        connection.connect();
        connection.query(selectToCorp, id, function(err, row) {
            var stringData = row[0].description;
            res.end(JSON.stringify({description:stringData}));
            connection.end();
        });
    },
    getDataFromRoom:function (id, res) {
        var connection = mysql.createConnection({
            host     : 'localhost',
            user     : 'egorsh',
            password : '787898',
            database : 'map'
        });

        connection.connect();

        connection.query(selectToRoom, createID(id), function(err, row) {
            if(row.length != 0) {
                var sizeRow = row.length;
                var group = row[0].Group;
                var period = row[0].Period;
                var subject = row[0].Subject;
                var teacher = row[0].Teacher;

                //Переменные для отправки на клиент
                //Группа
                var numberGroup;
                var department;
                var course;
                //Период
                var start;
                var end;
                //Предмет
                var nameSubject;
                //Преподаватель
                var name;
                var surname;
                var patronymic;
                connection.query('SELECT * FROM map.group WHERE codeGroup=?', group, function (err2, row2) {
                    numberGroup = row2[0].numberGroup;
                    department = row2[0].department;
                    course = row2[0].course;

                    connection.query('SELECT * FROM map.period WHERE numberLesson=?', period, function (err3, row3) {
                        start = row3[0].start;
                        end = row3[0].end;

                        connection.query('SELECT * FROM map.subject WHERE subjectCode=?', subject, function (err4, row4) {
                            nameSubject = row4[0].nameSubject;

                            connection.query('SELECT * FROM map.teacher WHERE teacherCode=?', teacher, function (err5, row5) {
                                name = row5[0].name;
                                surname = row5[0].surname;
                                patronymic = row5[0].patronymic;

                                res.end(JSON.stringify({
                                    numberGroup: numberGroup,
                                    department: department,
                                    course: course,
                                    start: start,
                                    end: end,
                                    nameSubject: nameSubject,
                                    name: name,
                                    surname: surname,
                                    patronymic: patronymic
                                }));
                            });
                        });
                    });
                });
            }else
            res.end(JSON.stringify({
                numberGroup: ""
            }));
        });
    }
};