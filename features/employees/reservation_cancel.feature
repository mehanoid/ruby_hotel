#language: ru
Функционал: Аннулирование брони

  @javascript
  Сценарий:
    Допустим существуют несколько броней
    И я залогинен как менеджер по бронированию
    Если я нажимаю "Брони"
    И выбираю первую бронь в списке
    И нажимаю "Аннулировать"
    То я должен увидеть "Бронь аннулирована"
    И я не должен видеть аннулированную бронь в общем списке