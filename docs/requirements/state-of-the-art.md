# Система управління відкритими даними. Аналіз предметної області

## Вступ

В цьому документі наведено:

- результати аналізу предметної області системи управління відкритими даними;
- визначення термінів та скорочень;
- опис підходів, моделей та способів вирішення завдання;
- опис існуючих рішень завдання, їх порівняльна характеристика;
- висновки щодо доцільності розробки нової системи.


## Основні визначення

**Відкриті дані (open data)** - це інформація, яку можна вільно використовувати та розповсюджувати. 
Необхідно лише дотримуватись вимог вказувати вихідні дані та розповсюджувати їх на таких же умовах, що і вихідні. 

Вимоги до відкритих даних:

- Дані повинні бути **юридично** відкритими, а це означає, що вони повинні бути розміщені публічно або на ліберальних умовах
  використання з мінімальними обмеженнями.
 
- Дані повинні бути **технічно** відкритими, а це означає, що вони опубліковані в електронних форматах (JSON, XML, RDF), 
  які читаються машиною та не є власністю, щоб кожен міг отримати доступ та використовувати дані за допомогою загальнодоступних
  програмних засобів. Електронні таблиці Microsoft Excel, текстові документи txt та PDF не рекомендуються для open data через відсутність в них чіткої структури даних.

**Open Database License (ODbL)** — "Share-alike" ліцензійна угода, призначена для того, щоб дозволити користувачам вільно ділитися, змінювати і використовувати відкриті бази даних, зберігаючи при цьому таку ж свободу і для інших.

**Великі дані (big data)** - це поєднання структурованих, напівструктурованих та неструктурованих даних, зібраних організаціями,
які є настільки великими, швидкими або складними, що їх важко або неможливо обробити традиційними методами.

Галузевий аналітик Дуг Лейні сформулював поширене зараз визначення великих даних як три V:

Volume: організації збирають дані з різних джерел, включаючи комерційні операції, розумні (IoT) пристрої, промислове обладнання, відео, соціальні медіа тощо.
У минулому його зберігання було б проблемою, але такі платформи як Hadoop полегшило навантаження.

Velocity: з розвитком інтернету речей дані надходять до підприємств з безпрецедентною швидкістю, і їх необхідно обробляти своєчасно.

Variety: дані надходять будь-яких типів форматів - від структурованих числових даних у традиційних базах даних до неструктурованих текстових документів, електронних листів, відео, аудіо тощо.

**База даних (database)** - це впорядкований набір структурованої інформації або даних, які зазвичай зберігаються в електронному вигляді в 
комп'ютерній системі. Базою даних зазвичай керує система управління базами даних (СУБД). Дані разом з СУБД, а також додатки, які з ними пов'язані, називаються системою баз даних, або, для стислості, просто базою даних.

**Набір даних (dataset)** - це сукупність цілісних, пов’язаних між собою даних, що складається з окремих елементів, але комп’ютер може ними керувати як єдиний блок.
База даних - це організована колекція даних, що зберігаються у вигляді наборів даних.

**Cтворення (збір даних)** - дані можна створювати, використовуючи методи, обладнання та особистий досвід, щоб відповісти на питання, що стосуються певної сфери.
Збір даних - це підхід збору інформації про предмет з різних джерел для отримання повного та більш точного уявлення про нього.

**Використання даних** - дані можна переглядати, обробляти, змінювати та зберігати. Зміни важливих даних потрібно відстежувати.
Дані також можуть бути доступні для обміну між сервісами, користувачами, організаціями тощо.

**Архiвація даних**  - це збереження копії даних, до якої не часто звертаються та не використовують, але її необхідно зберігати для різних потреб користувачів.
Якщо потрібно, заархівовані дані можна відновити.

**Видалення даних** - проблемою є витрати на зберігання непотрібних даних.
Тому важливо видаляти дані, які втратили свою актуальність, щоб створити більше місця для зберігання активних даних.
На цьому етапі дані видаляються з архівів, коли вони перевищують необхідний термін зберігання.

**Повторне використання даних** - зменшує кількість звернень, які уповільнюють доступ до пам’яті, використовуючи замість цього більш швидке сховище. 
Методи повторного використання даних виключають повторні звернення до тих самих даних, зберігаючи такі дані у внутрішніх регістрах та/або в пам’яті швидшого доступу, ніж у місцях початкового збереження даних.

## Підходи та способи вирішення завдання

### Життэвий цикл даних

1. Створення (збір) даних. 
2. Збереження та обслуговування даних.
3. Використання даних.
4. Архівація даних.
5. Видалення або повторне використання даних.

### Модель даних DDF

**Модель даних DDF** - система для впорядкування даних та визначення того, як частини даних співвідносяться між собою. Сама DDF не визначає формат, у якому зберігаються дані. Іншими словами: DDF - це концептуальна модель,
яка використовується для визначення наборів даних. Кожен набір даних DDF характеризується: поняттями (Concepts), метаданими (Metadata), сутностями (Entities), точками даних (Datapoints) and синонімами (Synonyms).

1. **Datapoints.** Дані в DDF зберігаються в парах ключ-значення (Datapoints). Ключ складається з двох або більше вимірів, тоді як значення складається з одного показника.
2. **Entities.** Кожна сутність представлена унікальним ідентифікатором у стовпці домену сутності. Цей ідентифікатор є унікальним, але лише в межах домену сутності.
   Ідентифікатор не обов’язково має бути назвою сутності, але тим не менше має мати значення.
   Наприклад, rus - Russia, swe - Sweden, nor - Norway.
3. **Concepts.** Поняття - це заголовки таблиць у будь-якому місці набору даних DDF. Властивості поняття - це поняття, які дають інформацію про поняття. Будь-яка властивість будь-якого поняття може бути визначена подібним чином у DDF. 
   Усі поняття, що використовуються у наборі даних, повинні бути перераховані, і будь-яка властивість цих понять може бути визначена в цьому переліку.
   
   **Concept types:**
    - рядок (симовлів);
    - міра (числове значення);
    - інтервал (між двома числовими значеннями.
      Значення інтервалу - це два числа у форматі масиву JSON);
    - логічне значення (boolean);
    - домен сутності (поняття, яке має всі можливі значення);
    - набір сутностей (концепція, у якій перераховані всі можливі значення, обмежені доменом сутності);
    - роль (набір сутностей, який містить в точності ті ж сутності, що й інший набір сутностей. Отже, у ролі є інша сутність, встановлена в якості домену);
    - композиція (представляє собою композицію двох або більше інших понять, які належать один одному);
    - час (окремий випадок домену сутності. Поняття рік, місяць, день, тиждень та квартал є її окремими випадками).
4. **Metadata.** У загальному випадку — це дані, що характеризують або пояснюють інші дані. Наприклад, значення «123456» само по собі недостатньо виразне. А якщо значенню «123456» зіставлено достатньо виразне ім'я «поштовий індекс» (що вже є метаданими),
   то в цьому контексті значення «123456» більш осмислене — можна витягати інформацію про місцеположення адресата, що має даний поштовий індекс.
### Відмінність між даними і метаданими
Метадані використовуються для підвищення якості пошуку. 
Пошукові запити, що використовують метадані можуть врятувати користувача від зайвої ручної роботи з фільтрації. 
Інформуючи комп'ютер про те, які елементи даних зв'язані і як ці зв'язки враховувати, стає можливим здійснювати достатньо складні операції по 
фільтрації та пошуку. Такий підхід, званий представленням знань, знаходиться у сфері інтересів Семантичної павутини та штучного інтелекту.

Метадані створюються для оптимізації алгоритмів стиснення з втратою якості. Наприклад, якщо метадані дозволяють комп'ютеру розділити зображення на основну частину і фонову,
то остання може бути стиснута сильніше, що дозволить досягти більшого коефіцієнта стиснення.
Деякі види метаданих призначені для забезпечення можливості різних видів представлення деяких даних.
Інші описові метадані можуть використовуватися автоматизованими робочими потоками.

Метадані стають важливі у World Wide Web внаслідок необхідності забезпечення пошуку корисної інформації серед величезної кількості доступної.
Метадані, створені вручну мають велику цінність, оскільки це гарантує свідомість.

## Порівняльна характеристика існуючих засобів вирішення завдання

### [Gapminder](https://www.gapminder.org/)
Незалежна освітня некомерційна організація, яка виявляє систематичні помилки щодо важливих світових тенденцій і пропорцій та використовує достовірні дані для розробки легко зрозумілих навчальних матеріалів, щоб позбавити людей від їх помилкових уявлень. Швидкий веб-сайт зі зручним інтерфейсом та цікаво поданим матеріалом у вигляді тесту, що надає статичні дані про країни всього світу.
### [Google Trends](https://trends.google.com/trends/?geo=US)
Публічний web-додаток корпорації Google, заснований на пошуку Google, який показує, як часто певний термін шукають по відношенню до загального обсягу пошукових запитів у різних регіонах світу і на різних мовах. На горизонтальній осі основного графіка представлено час, а на вертикальній — як часто термін шукали по відношенню до загального числа пошукових запитів в усьому світі.
Під основним графіком відображається розподіл популярності за регіонами, містами і мовами.
### [Єдиний державний веб-портал відкритих даних](https://data.gov.ua/)
Єдиний державний вебпортал відкритих даних, data.gov.ua — український урядовий вебсайт,
створений з метою зберігання публічної інформації у формі відкритих даних та забезпечення надання доступу до неї широкому колу осіб за принципами, визначеними у Міжнародній хартії відкритих даних, до якої Україна приєдналася у жовтні 2016 року.
### [Statistics Poland](https://stat.gov.pl/en/)
Головна державна платформа Польщі, яке займається збором та публікацією статистичних даних, що стосуються економіки, населення та суспільства країни, на національному та місцевому рівнях.
### [FiveThirtyEight](https://data.fivethirtyeight.com/)
Одне із найповніших та найякісніших джерел даних про все - від політики до спорту-це FiveThirtyEight. Обмін даними та кодом за статтями та графічними матеріалами.
### [Yelp](https://www.yelp.com/dataset)
Yelp - це підмножина підприємств, оглядів та даних користувачів для використання в особистих, освітніх та академічних цілях. Дані доступні у вигляді файлів JSON.
- *Functionality (функциональні вимоги)*
- *Usability (вимоги до зручності роботи)*
- *Reliability (вимоги до надійності)*
- *Performance (вимоги до продуктивності)*
- *Supportability (вимоги до підтримки)*

✗ - функція не реалізована
○ - функція реалізована, проте має недоліки
🗸 - функція реалізована вдало


Сервіси/критерії | Система управління відкритими даними | ⠀Gapminder⠀ | ⠀⠀⠀⠀⠀⠀ Google Trends ⠀⠀⠀⠀⠀⠀⠀⠀| Єдиний державний веб-портал відкритих даних |⠀⠀⠀⠀⠀⠀⠀⠀ Statistics Poland ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀| FiveThirtyEight | ⠀⠀⠀Yelp⠀⠀⠀ |
:---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: 
**Functionality** | **🗸** | **✗** | **🗸** | **🗸** | **✗** | **○** | **○**
Розміщення даних користувачем | 🗸 | ✗ | ✗ | ✗ | ✗ | ✗ | ✗
Пошук | 🗸 | ○ | 🗸 | ○ | 🗸 | ✗ | ✗
Візуалізація даних | 🗸 | 🗸 | 🗸 | ✗ | 🗸 | 🗸 | 🗸
**Usability** | **🗸** | **🗸** | **🗸**| **🗸** | **🗸** | **○** | **○** 
Багатомовність | 🗸 | ✗ | 🗸 | ○ | ○ | ✗ | 🗸
Наявність документації | 🗸 | ✗ | 🗸 | 🗸 | ✗ | ✗ | 🗸
**Reliability** | **🗸** | **🗸** | **🗸** | **🗸** | **✗** | **🗸** | **🗸** 
Наявність ліцензії | 🗸 | 🗸 | 🗸 | 🗸 | ✗ | 🗸 | 🗸
Актуальність даних | 🗸 | ○ | 🗸 | 🗸 | 🗸 | ○ | 🗸
**Performance** (оцінка за PageSpeed Insights) | **🗸** | **85** | **87** | **82** | **72** | **97** | **76** 
**Supportability**| **🗸** | **○** | **○** | **○** | **🗸** | **✗** | **✗** 
## Висновки

В результаті проведеного дослідження було виявлено, що серед розглянутих систем відсутній інструмент, який
задовільнив би всі вимоги. Тож, нашою командою було прийнято рішення створити систему, яка б повністю реалізувала всі потреби та мала відповідний функціонал.


## Посилання

https://developers.google.com/speed/pagespeed/insights/?hl=uk

https://www.dataworks.ie/5-stages-in-the-data-management-lifecycle-process/

http://opendatatoolkit.worldbank.org/en/essentials.html

https://docs.google.com/document/d/1Cd2kEH5w3SRJYaDcu-M4dU5SY8No84T3g-QlNSW6pIE/edit#heading=h.bo2hy9xsnxcp

https://www.britannica.com/technology/database

https://www.sas.com/ru_ru/insights/big-data/what-is-big-data.html



