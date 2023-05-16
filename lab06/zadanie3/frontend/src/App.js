import React from "react";
import { useEffect, useState } from "react";

const App = () => {
  const [data, setData] = useState(null);

  useEffect(() => {
    fetch("http://backend:8080/").then((response) => {
      setData(response.data);
    });
  });

  if (data === null) {
    return <p>Loading...</p>;
  } else {
    return (
      <ul>
        {data.data.restaurants.map((restaurant) => (
          <li key={restaurant._id}>{restaurant.name}</li>
        ))}
      </ul>
    );
  }
};

export default App;
