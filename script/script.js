// Начинаем работу когда страница полностью загружена (включая графику)
$(window).load(
  function svgElementClicked(theElement)
		{
			var s = document.getElementById("status");
			if(theElement.id != 'lmap')
			{
				s.textContent = "Корпус " + theElement.id;
			}else
			s.textContent = " ";
		}
);
