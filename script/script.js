// �������� ������ ����� �������� ��������� ��������� (������� �������)
$(window).load(
  function svgElementClicked(theElement)
		{
			var s = document.getElementById("status");
			if(theElement.id != 'lmap')
			{
				s.textContent = "������ " + theElement.id;
			}else
			s.textContent = " ";
		}
);
