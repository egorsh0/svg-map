// Начинаем работу когда страница полностью загружена (включая графику)
var flagToJump = 0;
var modalWindow = {
    _block: null,
    _win: null,
    initBlock: function() {
        _block = document.getElementById('overlay'); //Получаем наш блокирующий фон по ID

        //Если он не определен, то создадим его
        if (!_block) {
            var parent = document.getElementsByTagName('body')[0]; //Получим первый элемент тега body
            var obj = parent.firstChild; //Для того, чтобы вставить наш блокирующий фон в самое начало тега body
            _block = document.createElement('div'); //Создаем элемент div
            _block.id = 'overlay'; //Присваиваем ему наш ID
            parent.insertBefore(_block, obj); //Вставляем в начало
            _block.onclick = function() { modalWindow.close(); } //Добавим обработчик события по нажатию на блокирующий экран - закрыть модальное окно.
        }
        _block.style.display = 'inline'; //Установим CSS-свойство
    },
    initWin: function(html) {
        _win = document.getElementById('popup'); //Получаем наше диалоговое окно по ID
        //Если оно не определено, то также создадим его по аналогии
        if (!_win) {
            var parent = document.getElementsByTagName('body')[0];
            var obj = parent.firstChild;
            _win = document.createElement('div');
            _win.id = 'popup';
            parent.insertBefore(_win, obj);
        }
        _win.style.display = 'inline'; //Зададим CSS-свойство

        //Свойства для появления
        _win.style.webkitTransition = 'all ease .5s';
        _win.style.mozTransition = 'all ease .5s';
        _win.style.oTransition = 'all ease .5s';
        _win.style.transition = 'all ease .5s';

        _win.innerHTML = html; //Добавим нужный HTML-текст в наше диалоговое окно

        //Установим позицию по центру экрана

        _win.style.left = '50%'; //Позиция по горизонтали
        _win.style.top = '50%'; //Позиция по вертикали

        _win.style.marginTop = -(_win.offsetHeight / 2) + 'px';
        _win.style.marginLeft = -100 + 'px';
    },

    close: function() {
        document.getElementById('overlay').style.display = 'none';
        document.getElementById('popup').style.display = 'none';
    },
    show: function(html) {
        modalWindow.initBlock();
        modalWindow.initWin(html);
    }
};

function BackImage() {
    var map = document.getElementById('imap');
    map.style.visibility = 'visible';

    var floor = document.getElementById('floorMap');
    floor.style.visibility = 'hidden';

    var homeButton = document.getElementById('homeButton');
    homeButton.style.visibility = 'hidden';

    flagToJump = 0;
}

function toCorp(obj){
    if(obj.id!='lmap' && obj.id!="") {
        if(obj.id != '2')
        {
            var response = postHttp(obj.id, 'corp');
            var stringsToWindow = response.description;
            var strToView = stringsToWindow.split(/\?|&/);
            stringsToWindow = '';
            for(var i = 0; i < strToView.length; i++)
                stringsToWindow = stringsToWindow + strToView[i] + '<br>';
            var tableFromView = '<table cellspacing="0" id="maket">' +
                ' <tr>' +
                ' <td id="leftcol">Основные места</td><td id="rightcol">' + stringsToWindow + '</td>' +
                '</tr> ' +
                '</table>';
            modalWindow.show('<h1>Корпус ' + obj.id + '</h1>' + tableFromView);
        }
        else
        {
            var map = document.getElementById('imap');
            map.style.visibility = 'hidden';
            var floor = document.getElementById('floorMap');
            floor.style.visibility = 'visible';
            var homeButton = document.getElementById('homeButton');
            homeButton.style.visibility = 'visible';
        }
    }

}

function toFloor(obj){
    if(obj.id!='floor' && obj.id!="") {
        if((obj.id != '2224') && (obj.id != '2201')) {
            var response = postHttp(obj.id, 'floor');
            if(response.numberGroup != "") {
                var tableFromView = '<table cellspacing="0" id="maket">' +
                    ' <tr>' +
                    ' <td id="leftcol">Группа</td><td id="rightcol">' + response.numberGroup + '</td>' +
                    '</tr> ' +
                    ' <tr>' +
                    ' <td id="leftcol"></td><td id="rightcol">' + response.start + ' // ' + response.end + '</td>' +
                    '</tr> ' +
                    ' <tr>' +
                    ' <td id="leftcol">Предмет</td><td id="rightcol">' + response.nameSubject + '</td>' +
                    '</tr> ' +
                    ' <tr>' +
                    ' <td id="leftcol">Преподаватель</td><td id="rightcol">' + response.surname + ' ' + response.name + ' ' + response.patronymic + '</td>' +
                    '</tr> ' +
                    '</table>';
                modalWindow.show('<h1>' + obj.id + '</h1>' + tableFromView);
            }
        }else{
            var response = postHttp(obj.id, 'floor');
            var strToView = response.dean.split(/\?|&/);
            var dean = '';
            for(var i = 0; i < strToView.length; i++)
                dean = dean + strToView[i] + '<br>';

            strToView = response.depDean.split(/\?|&/);
            var depDean = '';
            for(var i = 0; i < strToView.length; i++)
                depDean = depDean + strToView[i] + '<br>';

            strToView = response.contacts.split(/\?|&/);
            var contacts = '';
            for(var i = 0; i < strToView.length; i++)
                contacts = contacts + strToView[i] + '<br>';

            var tableFromView = '<table cellspacing="0" id="maket">' +
                ' <tr>' +
                ' <td id="leftcol">Декан</td><td id="rightcol">' + dean + '<br>' +'</td>' +
                '</tr> ' +
                ' <tr>' +
                ' <td id="leftcol">Зам.декана</td><td id="rightcol">' + depDean + '</td>' +
                '</tr> ' +
                ' <tr>' +
                ' <td id="leftcol">Контакты</td><td id="rightcol">' + contacts + '</td>' +
                '</tr> ' +
                '</table>';
            var office;
            if(obj.id == '2224')
                office = 'ФКТИ';
            else office = 'ФРТ';
            modalWindow.show('<h1>' + 'Деканат ' + office + '</h1>' + tableFromView);
        }
    }
}

function postHttp(id, map) {
// 1. Создаём новый объект XMLHttpRequest
    var xhr = new XMLHttpRequest();

// 2. Конфигурируем его: GET-запрос на URL 'phones.json'
    xhr.open('GET', '/getData?id='+id + '?map='+map, false);

// 3. Отсылаем запрос
    xhr.send();
    // 4. Если код ответа сервера не 200, то это ошибка
    if (xhr.status != 200) {
        // обработать ошибку
        alert( xhr.status + ': ' + xhr.statusText ); // пример вывода: 404: Not Found
    } else {
        // вывести результат
        var response = JSON.parse(xhr.responseText); // responseText -- текст ответа.
        return response;
    }
}

document.onmousemove = moveTip;

function moveTip(e) {
    floatTipStyle = document.getElementById("floatTip").style;
    w = 250; // Ширина подсказки

    // Для браузера IE6-8
    if (document.all)  {
        x = event.clientX + document.body.scrollLeft;
        y = event.clientY + document.body.scrollTop;

        // Для остальных браузеров
    } else   {
        x = e.pageX; // Координата X курсора
        y = e.pageY; // Координата Y курсора
    }

    // Показывать слой справа от курсора
    if ((x + w + 10) < document.body.clientWidth) {
        floatTipStyle.left = x + 'px';

        // Показывать слой слева от курсора
    } else {
        floatTipStyle.left = x - w + 'px';
    }

    // Положение от  верхнего края окна браузера
    floatTipStyle.top = y + 20 + 'px';
}

function toolTip(msg) {
    floatTipStyle = document.getElementById("floatTip").style;
    if (msg) {
        // Выводим текст подсказки
        document.getElementById("floatTip").innerHTML = msg;
        // Показываем подсказку
        floatTipStyle.display = "block";
    } else {
        // Прячем подсказку
        floatTipStyle.display = "none";
    }
}

function search(ele) {
    var str = ele.value.replace(/(^\s*)|(\s*)$/g, '');
    if(event.keyCode == 13) {
        if(str != "")
            document.getElementById(str).click();
    }
}


$(window).load(function () {
    // Получаем доступ к SVG DOM карты
    var svgobject = document.getElementById('imap');
    if ('contentDocument' in svgobject)
        var svgdom = svgobject.contentDocument;

    svgdom.getElementById('lmap').addEventListener('click', function corp(event) {
        var target = event.target;
        if(target.correspondingUseElement)
            target = target.correspondingUseElement;
        toCorp(target);
    }, false);


    // Получаем доступ к SVG DOM этажу
    var svgObjectFloor = document.getElementById('floorMap');
    if ('contentDocument' in svgobject)
        var svgDomFloor = svgObjectFloor.contentDocument;

    svgDomFloor.getElementById('floor').addEventListener('click', function corp(event) {
        var target = event.target;
        if(target.correspondingUseElement)
            target = target.correspondingUseElement;
        toFloor(target);
    }, false);
});