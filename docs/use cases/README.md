# Діаграма прецедентів

---

@startuml

    actor "Administrator" as Administrator
    actor "Editor" as Editor
    actor "User" as User

    usecase "<b>UCA_1</b>\nКерувати розділами\n та наборами даних" as UCA_1
    usecase "<b>UCA_2</b>\nКерувати\n правами редактора" as UCA_2

    Administrator -r-> UCA_2
    Administrator -r-> UCA_1

    usecase "<b>UCE_1</b>\nСтворювати та редагувати\n набори даних" as UCE_1
    usecase "<b>UCE_2</b>\nКерувати файлами" as UCE_2

    Editor -r-> UCE_2
    Editor -r-> UCE_1

    usecase "<b>UCU_1</b>\nШукати, переглядати\n та зберігати файли" as UCU_1
    usecase "<b>UCU_2</b>\nДодавати файли\n до набору даних" as UCU_2

    User -r-> UCU_2
    User -r-> UCU_1
    
    
    Administrator -d-|> Editor
    Editor -d-|> User

@enduml

# Схеми використання для користувача

---

@startuml

    actor "User" as User

    usecase "<b>UCU_1</b>\nШукати, переглядати\n та зберігати файли" as UCU_1 #91FF5B
    usecase "<b>UCU_2</b>\nДодавати файли\n до набору даних" as UCU_2 #91FF5B

    User -l-> UCU_1
    User -r-> UCU_2

    usecase "<b>UCU_1.1</b>\nПошук файлу" as UCU_1.1
    usecase "<b>UCU_1.2</b>\nПереглядати дані \nу формі таблиці,\nдіаграми чи графіку" as UCU_1.2
    usecase "<b>UCU_1.3</b>\nЗберегти файл \nна пристрій" as UCU_1.3

    UCU_1.1 ..> UCU_1 :extends
    UCU_1.2 ..> UCU_1 :extends
    UCU_1.3 ..> UCU_1 :extends

    usecase "<b>UCU_2.1</b>\nДодати файл \nдо набору даних" as UCU_2.1

    UCU_2.1 ..> UCU_2 :extends

@enduml

# Схеми використання для редактора

---

@startuml

    actor "Editor" as Editor

    usecase "<b>UCE_1</b>\nСтворювати та редагувати\n набори даних" as UCE_1 #00B7FF
    usecase "<b>UCE_2</b>\nКерувати файлами" as UCE_2 #00B7FF

    Editor -l-> UCE_1
    Editor -r-> UCE_2

    usecase "<b>UCE_1.1</b>\nСтворити новий набір даних" as UCE_1.1
    usecase "<b>UCE_1.2</b>\nРедагувати набір даних" as UCE_1.2

    UCE_1.1 ..> UCE_1 :extends
    UCE_1.2 ..> UCE_1 :extends

    usecase "<b>UCE_2.1</b>\nАрхівувати файл" as UCE_2.1
    usecase "<b>UCE_2.2</b>\nВидалити файл" as UCE_2.2

    UCE_2.1 ..> UCE_2 :extends
    UCE_2.2 ..> UCE_2 :extends

@enduml

# Схеми використання для адміністратора

---

@startuml

    actor "Admin" as Admin

    usecase "<b>UCA_1</b>\nКерувати розділами\n та наборами даних" as UCA_1 #FF8600
    usecase "<b>UCA_2</b>\nКерувати\n правами редактора" as UCA_2 #FF8600

    Admin -l-> UCA_1
    Admin -r-> UCA_2

    usecase "<b>UCA_1.1</b>\nСтворити новий \nрозділ даних" as UCA_1.1
    usecase "<b>UCA_1.2</b>\nВидалити \nрозділ даних" as UCA_1.2
    usecase "<b>UCA_1.3</b>\nВидалити \nнабір даних" as UCA_1.3

    UCA_1.1 ..> UCA_1 :extends
    UCA_1.2 ..> UCA_1 :extends
    UCA_1.3 ..> UCA_1 :extends

    usecase "<b>UCA_2.1</b>\nДодати \nправа редактора" as UCA_2.1
    usecase "<b>UCA_2.2</b>\nВидалити \nправа редактора" as UCA_2.2

    UCA_2.1 ..> UCA_2 :extends
    UCA_2.2 ..> UCA_2 :extends

@enduml

# Сценарії для користувача

---

# Сценарії для редактор

---

# Сценарії для адміністратора

---

В цьому файлі необхідно перелічити всі документи, розроблені в проекті та дати посилання на них.

*Модель прецедентів повинна містити загальні оглядові діаграми та специфікації прецедентів.*



Вбудовування зображень діаграм здійснюється з використанням сервісу [plantuml.com](https://plantuml.com/). 

В markdown-файлі використовується опис діаграми

```md


@startuml

    right header
        <font size=24 color=black>Package: <b>UCD_3.0
    end header

    title
        <font size=18 color=black>UC_8. Редагувати конфігурацію порталу
        <font size=16 color=black>Діаграма прецедентів
    end title


    actor "Користувач" as User #eeeeaa
    
    package UCD_1{
        usecase "<b>UC_1</b>\nПереглянути список \nзвітів" as UC_1 #aaeeaa
    }
    
    usecase "<b>UC_1.1</b>\nЗастосувати фільтр" as UC_1.1
    usecase "<b>UC_1.2</b>\nПереглянути метадані \nзвіту" as UC_1.2  
    usecase "<b>UC_1.2.1</b>\nДати оцінку звіту" as UC_1.2.1  
    usecase "<b>UC_1.2.2</b>\nПереглянути інформацію \nпро авторів звіту" as UC_1.2.2
    
    package UCD_1 {
        usecase "<b>UC_4</b>\nВикликати звіт" as UC_4 #aaeeaa
    }
    
    usecase "<b>UC_1.1.1</b>\n Використати \nпошукові теги" as UC_1.1.1  
    usecase "<b>UC_1.1.2</b>\n Використати \nрядок пошуку" as UC_1.1.2
    usecase "<b>UC_1.1.3</b>\n Використати \nавторів" as UC_1.1.3  
    
    
    
    User -> UC_1
    UC_1.1 .u.> UC_1 :extends
    UC_1.2 .u.> UC_1 :extends
    UC_4 .d.> UC_1.2 :extends
    UC_1.2 .> UC_1.2 :extends
    UC_1.2.1 .u.> UC_1.2 :extends
    UC_1.2.2 .u.> UC_1.2 :extends
    UC_1 ..> UC_1.2.2 :extends
    
    
    UC_1.1.1 -u-|> UC_1.1
    UC_1.1.2 -u-|> UC_1.1
    UC_1.1.3 -u-|> UC_1.1
    
    right footer
        Аналітичний портал. Модель прецедентів.
        НТУУ КПІ ім.І.Сікорського
        Киів-2020
    end footer

@enduml

**Діаграма прецедентів**

```

яка буде відображена наступним чином


@startuml

    right header
        <font size=24 color=black>Package: <b>UCD_3.0
    end header

    title
        <font size=18 color=black>UC_8. Редагувати конфігурацію порталу
        <font size=16 color=black>Діаграма прецедентів
    end title


    actor "Користувач" as User #eeeeaa
    
    package UCD_1{
        usecase "<b>UC_1</b>\nПереглянути список \nзвітів" as UC_1 #aaeeaa
    }
    
    usecase "<b>UC_1.1</b>\nЗастосувати фільтр" as UC_1.1
    usecase "<b>UC_1.2</b>\nПереглянути метадані \nзвіту" as UC_1.2  
    usecase "<b>UC_1.2.1</b>\nДати оцінку звіту" as UC_1.2.1  
    usecase "<b>UC_1.2.2</b>\nПереглянути інформацію \nпро авторів звіту" as UC_1.2.2
    
    package UCD_1 {
        usecase "<b>UC_4</b>\nВикликати звіт" as UC_4 #aaeeaa
    }
    
    usecase "<b>UC_1.1.1</b>\n Використати \nпошукові теги" as UC_1.1.1  
    usecase "<b>UC_1.1.2</b>\n Використати \nрядок пошуку" as UC_1.1.2
    usecase "<b>UC_1.1.3</b>\n Використати \nавторів" as UC_1.1.3  
    
    
    
    User -> UC_1
    UC_1.1 .u.> UC_1 :extends
    UC_1.2 .u.> UC_1 :extends
    UC_4 .d.> UC_1.2 :extends
    UC_1.2 .> UC_1.2 :extends
    UC_1.2.1 .u.> UC_1.2 :extends
    UC_1.2.2 .u.> UC_1.2 :extends
    UC_1 ..> UC_1.2.2 :extends
    
    
    UC_1.1.1 -u-|> UC_1.1
    UC_1.1.2 -u-|> UC_1.1
    UC_1.1.3 -u-|> UC_1.1
    
    right footer
        Аналітичний портал. Модель прецедентів.
        НТУУ КПІ ім.І.Сікорського
        Киів-2020
    end footer

@enduml

**Діаграма прецедентів**


