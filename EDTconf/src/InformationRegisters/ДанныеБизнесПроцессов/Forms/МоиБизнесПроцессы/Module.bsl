////////////////////////////////////////////////////////////////////////////////
// ОБРАБОТЧИКИ СОБЫТИЙ ФОРМЫ

&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	
	УстановитьОтбор(Новый Структура("ПоказыватьЗавершенные", ПоказыватьЗавершенные));
	ОбщегоНазначенияКлиентСервер.УстановитьЭлементОтбора(
			Список.Отбор, "Автор", Пользователи.ТекущийПользователь());

КонецПроцедуры

&НаКлиенте
Процедура ОбработкаОповещения(ИмяСобытия, Параметр, Источник)
	Если ИмяСобытия = "Запись_ЗадачаИсполнителя" Тогда
		Элементы.Список.Обновить();
	КонецЕсли;
КонецПроцедуры

&НаСервере
Процедура ПриЗагрузкеДанныхИзНастроекНаСервере(Настройки)
	
	УстановитьОтбор(Настройки);
		
КонецПроцедуры

////////////////////////////////////////////////////////////////////////////////
// ОБРАБОТЧИКИ СОБЫТИЙ ЭЛЕМЕНТОВ ШАПКИ ФОРМЫ

&НаКлиенте
Процедура ПоказыватьЗавершенныеПриИзменении(Элемент)
	
	УстановитьОтбор(Новый Структура("ПоказыватьЗавершенные", ПоказыватьЗавершенные));
	
КонецПроцедуры

////////////////////////////////////////////////////////////////////////////////
// ОБРАБОТЧИКИ СОБЫТИЙ ТАБЛИЦЫ ФОРМЫ Список

&НаКлиенте
Процедура СписокВыбор(Элемент, ВыбраннаяСтрока, Поле, СтандартнаяОбработка)
	Если Элементы.Список.ТекущиеДанные <> Неопределено Тогда
		ОткрытьЗначение(Элементы.Список.ТекущиеДанные.БизнесПроцесс);
 	КонецЕсли;
	СтандартнаяОбработка = Ложь;
КонецПроцедуры

&НаКлиенте
Процедура СписокПередНачаломИзменения(Элемент, Отказ)
	Если Элемент.ТекущиеДанные <> Неопределено Тогда
		ОткрытьЗначение(Элемент.ТекущиеДанные.БизнесПроцесс);
		Отказ = Истина;
 	КонецЕсли;       
КонецПроцедуры

////////////////////////////////////////////////////////////////////////////////
// ОБРАБОТЧИКИ КОМАНД ФОРМЫ

&НаКлиенте
Процедура ПометкаУдаления(Команда)
	БизнесПроцессыИЗадачиКлиент.СписокБизнесПроцессовПометкаУдаления(Элементы.Список);
КонецПроцедуры

////////////////////////////////////////////////////////////////////////////////
// СЛУЖЕБНЫЕ ПРОЦЕДУРЫ И ФУНКЦИИ

&НаСервере
Процедура УстановитьОтбор(ПараметрыОтбора)
	
	ОбщегоНазначенияКлиентСервер.УдалитьЭлементыГруппыОтбора(Список.Отбор, "Завершен");
	
	Если НЕ ПараметрыОтбора["ПоказыватьЗавершенные"] Тогда
		ОбщегоНазначенияКлиентСервер.УстановитьЭлементОтбора(
			Список.Отбор, "Завершен", Ложь);
	КонецЕсли;
	
КонецПроцедуры

