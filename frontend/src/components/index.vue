<template>
  <div class="container">
    <!-- タスク追加フォーム -->
    <div class="columns">
      <div class="column is-10">
        <div class="control has-icons-left">
          <input class="input is-rounded is-info" type="text" placeholder="Add your plans!!">
          <span class="icon is-right">
            <i class="fas fa-pencil-alt"></i>
          </span>
        </div>
      </div>
      <div class="column is-2">
        <a class="button is-rounded is-info">Add Task!</a>
      </div>
    </div>

    <!-- タスク一覧 -->
    <div class="panel">
      <p class="panel-heading is-info">
        Your Tasks
      </p>
      <div class="panel-block">
        <label class="checkbox">
          <input type="checkbox">
            Sample Task
        </label>
      </div>
    </div>

    <!-- 完了タスク表示ボタン -->
    <div>
      <button class="button is-info is-fullwidth is-focused is-rounded finished-button">
        Show Finished Tasks
      </button>
    </div>

    <!-- 完了タスク一覧 -->
    <div class="panel">
      <label class="panel-block">
        <span class="icon has-text-success">
          <i class="far fa-check-circle"></i>
        </span>
        <p>
          Sample Finished Task
        </p>
      </label>
    </div>
  </div>
</template>

<style>
  .panel-heading {
    background-color: hsl(204, 86%, 53%);
    color: hsl(0, 0%, 100%);
  }

  .finished-button {
    margin-bottom: 30px;
  }
</style>
