# Описание схемы pipeline бизнес события первая зарплата

## Ресуры
**bevents_common_first_salary** - Файлы с ресурсами для обработки транзакций (бизнес правила, конфигурации, общие утилиты для pipeline)

**bevents_streaming_aggregate_first_salary_state** - Состояние хранения во Flink данных клиентов

---

# Топики кафка

**CFT2RS_CD** - Топик с сообщениями транзакций клиентов в ЦФТ в формате json

**issuing_operation** - Топик с данными way4 с зарплатами и постранзакциями

**prof_tx** - Топик с транзакциями profile в формате json

**dev_bevents__realtime__input_converter__prof__transactions__uaspdto** - Топик с транзакциями профайл в формате UaspDto

**dev_bevents__realtime__input_converter__prof__transactions__dlq** - Топик с транзакциями профайл которые не удалось привести к формату UaspDto

**dev_bevents__batch__ca_regulatory_client_id_of_profile__uaspdto** - Топик с данными соответствия контракта для внутреннего идентификатора клиента для профайл к контракту из холодного хранилища

**dev_bevents__batch__ca_regulatory_client_id_of_profile__status** - Топик с данными результатами загрузки в состояние Flink соответствия контракта для внутреннего идентификатора клиента для профайл к контракту из холодного хранилища

**dev_bevents__realtime__enrichment__prof__transactions_with_clientid__uaspdto** - Топик с данными транзакций профайла обогащённые внутренним идентификатором клиента профайла

**dev_bevents__realtime__enrichment__prof__transactions_with_clientid__dlq** - Топик с данными транзакций профайла, которые не удалось обогатить внутренним идентификатором клиента профайла

**dev_bevents__batch__ca_regulatory_mdm_id_of_client_id_profile__uaspdto** - Топик с кросс-ссылками соответствия внутреннего идентификатора клиента профайл  глобальному идентификатору клиента

**dev_bevents__batch__ca_regulatory_mdm_id_of_client_id_profile__status** - Топик c результатами загрузки в состояние Flink с кросс-ссылками соответствия внутреннего идентификатора клиента профайл  глобальному идентификатору клиента

**dev_bevents__batch__ca_regulatory_contract_num_of_mdm_id_profile__uaspdto** - Топик  с данными номера счёта для глобального идентификатора профайла

**dev_bevents__batch__ca_regulatory_contract_num_of_mdm_id_profile__status** - Топик с данными результатами загрузки в состояние Flink данных номера счёта для глобального идентификатора профайла

**dev_bevents__realtime__enrichment__prof__transactions_with_mdm_id__uaspdto** - Топик с обогащёнными транзакциями профайл глобальным идентификатором клиента

**dev_bevents__realtime__enrichment__prof__transactions_with_mdm_id__dlq** - Топик с транзакциями профайл с которыми возникли ошибки при обогащении глобальным идентификатором клиента

**dev_bevents__realtime__enrichment__prof__transactions_with_mdm_id__dlq** - Топик с транзакциями профайл с которыми возникли ошибки при обогащении глобальным идентификатором клиента

**dev_bevents__realtime__enrichment__prof__transactions_with_mdm_id__additional** - Топик с транзакциями профайл для которых не был в состоянии Flink найден глобальный идентификатор клиента

**dev_bevents__realtime__additional_enrichment__prof__transactions_with_mdm_id__dlq** - Топик с транзакциями профайла с ошибками в которых произошли в процессе до обогащения

**dev_bevents__realtime__additional_enrichment__prof__transactions_with_mdm_id__uaspdto** - Топик с до обогащёнными транзакциями профайла глобальным идентификатором клиента

**ift_ivr__uasp_realtime__input_converter__mdm_cross_link__json** - Топик с полученными кросс-ссылками в дообогащении

**dev_ivr__uasp_realtime__mdm_enrichment__uaspdto** - Топик с обогащёнными данными глобальным идентификатором и классификацией сообщения (из всех сообщений необходимо будет выбрать сообщения с зарплатами и постранзакциями)

**dev_bevents__batch__ca_first_salary_transactions__uaspdto** - Топик для загрузки транзакций по всем источникам для первичного формирования состояния и восстановления

**dev_bevents__realtime__input_converter__cft__accounts__uaspdto** - Топик с сообщениями счетов клиентов в ЦФТ в формате UaspDto

**dev_bevents__realtime__input_converter__cft__accounts__dlq** - Топик с ошибками обработки сообщений счетов клиентов в ЦФТ

**dev_bevents__realtime__input_converter__cft__transactions__uaspdto** - Топик с сообщениями транзакций клиентов в ЦФТ в формате UaspDto

**dev_bevents__realtime__input_converter__cft__transactions__dlq** - Топик с ошибками обработки сообщений транзакций клиентов в ЦФТ

**dev_bevents__realtime__enrichment_prepare_transactions__uaspdto** - Топик с подготовленными данными для обогащения (подготовка необходима для синхронизации для разных источников название полей валюты и даты)

**dev_bevents__realtime__enrichment_prepare_transactions__dlq** - Топик сообщений для которых не удалось подготовить данные для обогащения

**dev_ivr__uasp_realtime__outer_cbr_rate__uaspdto** - Топик с курсами валют по одной валюте в одном сообщении в формате UaspDto

**dev_bevents__uasp_realtime__outer_cbr_rate__status** - Топик с информацией обработки валюты, что означает валюта сохранена в состояние Flink и готова для обогащения потока

**dev_bevents__realtime__enrichment_first_salary_transactions__dlq** - Топик для сообщений по какой либо причине не удалось обогатить

**dev_bevents__realtime__enrichment_first_salary_transactions__uaspdto** - Топик транзакций ЦФТ обогащённый курсами валют

**dev_bevents__realtime__aggregate_first_salary__dlq** - Топик сервиса агрегации с ошибками вычисления

**dev_bevents__realtime__aggregate_first_salary__uaspdto** - Топик с результатами агрегации

**dev_bevents__realtime__filter_first_salary__dlq** - Топик с ошибками фильтрации

**dev_bevents__realtime__filter_first_salary__filter** - Топик с отфильтрованными сообщениями

**dev_bevents__realtime__filter_first_salary__uaspdto** - Топик с сообщениями прошедшими фильтрацию


**dev_bevents__realtime__modelvector_first_salary__dlq** - Топик с ошибками формирования конечного вектора для первых зарплат

**dev_bevents__realtime__modelvector_first_salary__json** - Топик с финальным вектором первой зарплаты в формате json

**dev_bevents__realtime__modelvector_first_pension__dlq** - Топик с ошибками формирования конечного вектора для пенсий

**dev_bevents__realtime__modelvector_first_pension__json** - Топик с финальным вектором первой пенсии в формате json

**dev_bevents__realtime__modelvector_first_postransaction__json** - Топик с финальным вектором pos-транзакции в формате json


---


## Сервис-адаптер сообщений с тразакциями клиентов профайла
#### bevents_streaming_input_convertor_profile_transactions - выполняет выборку необходимых атрибутов (см. спецификацию) из json в UaspDto

#### Входящие топики

* prof_tx

#### Исходящие топики
* dev_bevents__realtime__input_converter__prof__transactions__dlq
* dev_bevents__realtime__input_converter__prof__transactions__uaspdto

---

## Сервис обогащения транзакций профайла внутренним идентификатором клиента
#### bevents_streaming_enrichment_profile_client_id - принимает для контрактов профайла внутренние идентификаторы клиента и сохраняет их в состоянии, обогащает поток транзакций профайла внутренним идентификатором клиента
#### Входящие топики
* dev_bevents__realtime__input_converter__prof__transactions__uaspdto
* dev_bevents__batch__ca_regulatory_client_id_of_profile__uaspdto
#### Исходящие топики
* dev_bevents__batch__ca_regulatory_client_id_of_profile__status
* dev_bevents__realtime__enrichment__prof__transactions_with_clientid__uaspdto
* dev_bevents__realtime__enrichment__prof__transactions_with_clientid__dlq

---

## Сервис обогащения транзакций профайла внутренним глобальным идентификатором клиента и номером счёта клиента
#### bevents_streaming_enrichment_profile_mdm_id - принимает для профайла глобальный идентификатор клиента клиента и сохраняет в состоянии, обогащает поток транзакций профайла глобальным идентификатором клиента + номером счёта клиента
#### Входящие топики
* dev_bevents__realtime__enrichment__prof__transactions_with_clientid__uaspdto
* dev_bevents__batch__ca_regulatory_mdm_id_of_client_id_profile__uaspdto
* dev_bevents__batch__ca_regulatory_contract_num_of_mdm_id_profile__uaspdto
* dev_bevents__realtime__additional_enrichment__prof__transactions_with_mdm_id__uaspdto
#### Исходящие топики
* dev_bevents__batch__ca_regulatory_mdm_id_of_client_id_profile__status
* dev_bevents__batch__ca_regulatory_contract_num_of_mdm_id_profile__status
* dev_bevents__realtime__enrichment__prof__transactions_with_mdm_id__uaspdto
* dev_bevents__realtime__enrichment__prof__transactions_with_mdm_id__dlq
* dev_bevents__realtime__enrichment__prof__transactions_with_mdm_id__additional

--

## Сервис до обогащения транзакций профайла внутренним глобальным идентификатором клиента
#### bevents_streaming_mdm_additional_enrichment_profile_mdm_id - по внутреннему идентификатору клиента профайл через API MDM получает глобальный идентификатор клиента клиента и обогащает им сообщение с транзакцией клиента
#### Входящие топики
* dev_bevents__realtime__enrichment__prof__transactions_with_mdm_id__additional
#### Исходящие топики
* dev_bevents__realtime__additional_enrichment__prof__transactions_with_mdm_id__dlq
* dev_bevents__realtime__additional_enrichment__prof__transactions_with_mdm_id__uaspdto
* ift_ivr__uasp_realtime__input_converter__mdm_cross_link__json

---

## Сервис-адаптер сообщений с кросс-ссылками клиентов
#### bevents_streaming_input_convertor_mdm_cross_link - выполняет выборку необходимых атрибутов (см. спецификацию) из json в UaspDto

#### Входящие топики

* ift_ivr__uasp_realtime__input_converter__mdm_cross_link__json

#### Исходящие топики
* dev_bevents__realtime__input_converter__mdm_cross_link__dlq
* dev_bevents__batch__ca_regulatory_mdm_id_of_client_id_profile__uaspdto

---

## Сервис обработки потока данных way4 (из данного потока необходимы зарплаты и постанзакции)
#### uasp_streaming_main_input - выполняет выборку необходимых атрибутов (см. спецификацию) из json в UaspDto, обогащает глобальным идентификатором и классифицирует сообщения для дальнейшего использования только сообщений с зарплатами и постранзакциями (детали сервиса можно посмотреть в проектах uasp-streaming-main-input и uasp-streaming-common)

#### Входящие топики (указан только основной топик)

* issuing_operation

#### Исходящие топики (указан только основной топик)

* dev_ivr__uasp_realtime__mdm_enrichment__uaspdto

---

## Сервис загрузки данных way4 с транзакциями в поток обработки сервиса первой зрплаты (из данного потока необходимы зарплаты и постанзакции)
#### bevents_streaming_unp_convertor_way4_transactions - выполняет  загрузки данных way4 с транзакциями в поток обработки сервиса первой зрплаты

#### Входящие топики

* dev_ivr__uasp_realtime__mdm_enrichment__uaspdto


---

## Сервис-адаптер сообщений с тразакциями клиентов ЦФТ
#### bevents_streaming_input_convertor_first_salary_transactions - выполняет выборку необходимых атрибутов (см. спецификацию) из json в UaspDto

#### Входящие топики

* CFT2RS_CD

#### Исходящие топики
* dev_bevents__realtime__input_converter__cft__transactions__dlq
* dev_bevents__realtime__input_converter__cft__transactions__uaspdto

---

## Сервис подготовки сообщений для обогащения курсами валют 
#### bevents_streaming_business_rules_prepare_enrichment_transactions - добавляет в сообщение в системные поля название валюты и дату необходимые для выполнения обогащения курсами валют
#### Входящие топики (объединение входящих топиков выполняется в union_way4_cft на уровне сервиса bevents_streaming_main_first_salary, тестирование поэтому выполняем данного сервиса отдельно для каждого потока, в дальнейшем необходимо создать атомарный сервис объединения)
* dev_bevents__realtime__input_converter__cft__transactions__uaspdto
* dev_ivr__uasp_realtime__mdm_enrichment__uaspdto
#### Исходящие топики
* dev_bevents__realtime__enrichment_prepare_transactions__uaspdto
* dev_bevents__realtime__enrichment_prepare_transactions__dlq

---

## Сервис обогащения курсами валют потока 
#### bevents_streaming_enrichment_first_salary_exchange - принимает курсы валют и сохраняет их в состоянии, обогащает поток транзакций значениями (курс, количество единиц валюты) обмена валюты к рублю  
#### Входящие топики
* dev_ivr__uasp_realtime__outer_cbr_rates__json
* dev_bevents__realtime__enrichment_prepare_transactions__uaspdto
#### Исходящие топики
* dev_bevents__uasp_realtime__outer_cbr_rate__status 
* dev_bevents__realtime__enrichment_first_salary_transactions__dlq 
* dev_bevents__realtime__enrichment_first_salary_transactions__uaspdto 

---

## Сервис вычисления первой зарплаты 
#### bevents_streaming_aggregate_first_salary - обогащает транзакции информацией из данными состояния, выполняет бизнес правила определения первой, второй и третей зарплаты, сохраняет в состоянии последние 3 зарплаты
#### Входящие топики
* dev_bevents__realtime__enrichment_first_salary_transactions__uaspdto
* dev_bevents__batch__ca_first_salary_transactions__uaspdto
#### Состояние Flink
* bevents_streaming_aggregate_first_salary_state
#### Исходящие топики
* dev_bevents__realtime__aggregate_first_salary__dlq 
* dev_bevents__realtime__aggregate_first_salary__uaspdto

---

## Сервис фильтрации потока данных
#### bevents_streaming_filter_first_salary - фильтрует сообщения с отсутствием бизнес события первой, второй или третей зарплаты
#### Входящие топики
* dev_bevents__realtime__aggregate_first_salary__uaspdto
#### Исходящие топики
* dev_bevents__realtime__aggregate_first_salary__dlq
* dev_bevents__realtime__aggregate_first_salary__uaspdto

---

## Сервис формирования фианального вектора
#### bevents_streaming_modelvector_first_salary - формирует из UaspDto конечный вектор с бизнес событием
#### Входящие топики
* dev_bevents__realtime__filter_first_salary__uaspdto
#### Исходящие топики
* dev_bevents__realtime__modelvector_first_salary__dlq
* dev_bevents__realtime__modelvector_first_salary__json
* dev_bevents__realtime__modelvector_first_pension__json
* dev_bevents__realtime__modelvector_first_postransaction__json
* dev_bevents__realtime__modelvector_first_salary__qa

---