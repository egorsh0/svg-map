// �������� ������ ����� �������� ��������� ��������� (������� �������)
$(window).load(function () {
  // �������� ������ � SVG DOM
  var svgobject = document.getElementById('imap'); 
  if ('contentDocument' in svgobject)
    var svgdom = svgobject.contentDocument;

  // ��� ��� WebKit (����� ��������� ������������� ���� �����)
  var viewBox = svgdom.rootElement.getAttribute("viewBox").split(" ");
  var aspectRatio = viewBox[2] / viewBox[3];
  svgobject.height = parseInt(svgobject.offsetWidth / aspectRatio);
  });
  