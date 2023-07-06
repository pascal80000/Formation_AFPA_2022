import React, { useState, useEffect } from 'react'


function Liste() {

  const [articles, setArticles] = useState([]);

  const addArticle = (event) => {
    event.preventDefault();

    const newArticle = event.target.article.value.trim();
    if (newArticle !== '') {
      setArticles([...articles, newArticle]);
      event.target.article.value = '';
    }
  };

  const delArticles = (event) => {
    event.preventDefault();
    setArticles('');
  }


  return (

    <div class="list-group m-4 ">
      <fieldset>
        <div class="card-header m-4 ">
          <h2>Liste de courses</h2>
        </div>
      </fieldset>

      <fieldset class="container">
        <div class="card m-4 ">
          <ul class="pager">
            <form onSubmit={addArticle}>
              <div class="m-2">
                <input type="text" name="article" placeholder='  Entrer un article' />
              </div>
              <button class="ok m-2" type="submit">Ajouter</button>
            </form>
            <form onAbort={delArticles}>
              <button class="ko m-2" type="submit">Vider la liste</button>
            </form>
          </ul>
        </div>
      </fieldset>

      <div class="items">
        <fieldset class="card-header m-4">
          <legend>ARTICLES</legend>
          <ul class="list-group-item list-group-item-action flex-column align-items-start ">
            {articles.map((articles, index) => (
              <li key={index}>{articles}</li>
            ))}
          </ul>

        </fieldset>
      </div>
    </div>

  );
}


export default Liste;

