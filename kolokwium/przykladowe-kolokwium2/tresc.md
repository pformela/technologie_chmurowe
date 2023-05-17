Korzystając z Docker'a, Dockerfile i docker-compose, zaprojektuj i zbuduj system składający się z trzech serwisów -
aplikacji webowej napisanej w Node.js (Express), bazy danych (MongoDB) oraz serwera Redis.

Aplikacja Express powinna obsługiwać trzy endpointy:

GET /tasks - zwraca listę zadań z bazy danych MongoDB
POST /tasks - dodaje nowe zadanie do bazy danych MongoDB
PUT /tasks/:id - aktualizuje status zadania w bazie danych MongoDB i zwiększa licznik zaktualizowanych zadań w Redis

Plik Dockerfile dla aplikacji Express powinien być rozbudowany i zawierać efektywne warstwy do budowy obrazu.

Plik docker-compose powinien definiować wszystkie trzy serwisy (aplikacja Express, MongoDB oraz Redis) oraz konfigurować sieć dla tych serwisów.

Wskazówka: Obsługa bazy redis:

```
const redis = require('redis');
const redisClient = redis.createClient({​ host: 'redis', port: 6379 }​);
redisClient.incr('updatedTasks', (err, count) => {​
  if (err) res.status(500).json({​ error: err.message }​);
  else res.json({​ task, updatedTasksCount: count }​); }​);
```
