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
      <div v-for="task in tasks" v-if="!task.is_done" v-bind:id="'row_task_' + task.id" class="panel-block">
        <label class="checkbox" v-bind:for="'task_' + task.id">
          <input type="checkbox" v-bind:id="'task_' + task.id">
            {{ task.name }}
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
      <label v-for="task in tasks" v-if="task.is_done" v-bind:id="'row_task_' + task.id" class="panel-block">
        <span v-bind:id="'task_' + task.id" class="icon has-text-success">
          <i class="far fa-check-circle"></i>
        </span>
        <p v-bind:for="'task_' + task.id" class="line-through">
          {{ task.name }}
        </p>
      </label>
    </div>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  data: function() {
    return {
      tasks: [],
      newTask: '',
    }
  },
  mounted: function() {
    this.fetchTasks();
  },
  methods: {
    fetchTasks: function() {
      axios.get('api/tasks').then((response) => {
        for(var i = 0; i < response.data.tasks.length; i++) {
          this.tasks.push(response.data.tasks[i]);
        }
      }, (error) => {
        console.log(error);
      });
    }
  }
}
</script>

<style scoped>
  [v-cloak] {
    display: none;
  }
  .display_none {
    display: none;
  }
  .line-through {
    text-decoration: line-through;
  }
  .panel-heading {
    background-color: hsl(204, 86%, 53%);
    color: hsl(0, 0%, 100%);
  }
  .finished-button {
    margin-bottom: 30px;
  }
</style>
