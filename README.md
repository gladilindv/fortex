Fortex job contest
==================


Задача 1.
------------------

#### решение
http://sqlfiddle.com/#!9/41cd9a/6/0

#### вопросы
- почему в примере для UserID=150 рассчитано 5 дней ?
- для чего введен и что означает (как и нужно ли) использовать другой тип события EventID=3 ?
- нужно ли понимать что ID клиента указывается параметров в запросе ?
- что означает "последний польователь продолжает работать до сих пор" ? 
- как определяется "последний пользовтель" ?
- для чего введено в исходную таблицу поле Time ? 
- почему оно не используется в примере для расчета (как доказательство - целое число дней в результате примера) ?

Задача 2.
------------------

#### решение
* SQL-часть http://sqlfiddle.com/#!9/f4015e/2/0
* PHP-часть https://repl.it/repls/GrowlingDefinitiveDiscussions


#### вопросы
- предложенная схема требует нормализации
- не понятно с какой целью в одной таблице `persons` объединены и люди и их привязка к зданиям
(_должна быть введена отдельная таблица `locations`, в которой будет связь человек->здание. А такой формат 
 только если для упрощения примера_)

- могут ли существовать разные люди привязанные к разным зданиям ?
- равно ли по количеству число людей и число зданий ?

- не понятно с какой целью разные люди имеют одинаковые контактные данные 

#### предложение
Судя по профилю компании, речь идет о поиске разных объектов, доступ
к которым имеют разные аккаунты, но при этом в их профиле указан одинаковый телефон. 
На мой взгляд, в этом случае искать нужно не здания и бороться с последствиями такой архитектуры,
а исключить возможность появления таких аккаунтов в принципе

Задача 3.
------------------

#### решение
https://jsfiddle.net/gladilindv/votnkbe3/

#### вопросы
- в задаче предложен весьма сомнительный подход для поиска элементов (искать элементы на странице)
- использование jQuery даже для указанной цели очень и очень избыточно

#### предложение
- использовать подход MVC для построения контента
- искать элементы не на странице, а в модели данных
- использовать или нативный JS-скрипт или подключить любой реактивный фреймворк (React/Vue etc)
