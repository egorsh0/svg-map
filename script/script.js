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
}

function BackImage() {
    var map = document.getElementById('imap');
    map.style.visibility = 'visible';

    var floor = document.getElementById('floorMap');
    floor.style.visibility = 'hidden';

    flagToJump = 0;
}

function toCorp(obj){
    if(obj.id!='lmap' && obj.id!="") {
        if(obj.id != '2')
            modalWindow.show('<h1>Корпус ' + obj.id + '</h1>');
        else
        {
            var map = document.getElementById('imap');
            map.style.visibility = 'hidden';
            var floor = document.getElementById('floorMap');
            floor.style.visibility = 'visible';
        }
    }

}

function postHttp(id) {
// 1. Создаём новый объект XMLHttpRequest
    var xhr = new XMLHttpRequest();

// 2. Конфигурируем его: GET-запрос на URL 'phones.json'
    xhr.open('GET', '/getData?id='+id, false);

// 3. Отсылаем запрос
    xhr.send();
    // 4. Если код ответа сервера не 200, то это ошибка
    if (xhr.status != 200) {
        // обработать ошибку
        alert( xhr.status + ': ' + xhr.statusText ); // пример вывода: 404: Not Found
    } else {
        // вывести результат
        var response = JSON.parse(xhr.responseText); // responseText -- текст ответа.
        alert(response.name);
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
        postHttp(target.id);
    }, false);
    // Получаем доступ к SVG DOM этажу
    var svgObjectFloor = document.getElementById('floorMap');
    if ('contentDocument' in svgobject)
        var svgDomFloor = svgObjectFloor.contentDocument;

    svgDomFloor.getElementById('floor').addEventListener('click', function corp(event) {
        var target = event.target;
        if(target.correspondingUseElement)
            target = target.correspondingUseElement;
        toCorp(target);
    }, false);
});