# RubyHotel

Данное приложение разрабатывалось мной в рамках дипломного проекта, защищённого в декабре 2013 года.
RubyHotel - автоматизированная система управления отелем.
Возможности, предоставляемые системой:

* учёт текущего состояния номерного фонда, включая действующие тарифы, данные о занятости номеров и данные о бронях
* учёт данных о клиентах гостиницы
* предоставление актуальных данных о состоянии номерного фонда для клиентов
* предоставление возможности клиентам гостиницы самостоятельно бронировать номера
* автоматическое аннулирование броней в случае истечения их срока
* расчёт стоимости проживания на основании действующих тарифов
* поиск по данным об активных бронях и проживающих клиентах  
* механизм авторизации и разграничение прав для различных групп пользователей

## Демо

Увидеть работу данного приложения вы можете [здесь](http://ruby-hotel.herokuapp.com/) (интерфейс для клиентов гостиницы). Интерфейс для сотрудников отеля (админка) находится [здесь](http://ruby-hotel.herokuapp.com/admin).

## Сброс базы данных

Вероятно, вначале вы захотите выполнить сброс базы данных. Для этого перейдите по [этой ссылке](http://ruby-hotel.herokuapp.com/dbreset) и нажмите кнопку "Сбросить". При этом будут созданы следующие учётные записи: 

* admin@example.com - системный администратор
* receptionist@example.com - администратор гостиницы (портье)
* reservation_manager@example.com - менеджер по бронированию

Всем этим учётным записям будет задан пароль "12345678"

Для входа с использованием этих учётных записей нужно открыть [интерфейс для сотрудников отеля](http://ruby-hotel.herokuapp.com/admin  )
